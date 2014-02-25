#"union" merge demo

This is a simple demonstration of the `union` merge driver for maintaining
a `NEWS` file to which entries are added by different contributors.
The scenario consists of two branches `a` and `b` branched off `master`
where one line is added to the `NEWS` file.
An attempt is made to merge both changes back to `master`.

- [`demo_failing.sh`](demo_failing.sh) shows the behavior of the default `text` merge driver in
  presence of conflicting changes.

- [`demo_succeed_git.sh`](demo_succeed_git.sh) specifies that the `NEWS` file should be merged using
  the `union` merge driver by adding a corresponding entry to `.gitattributes`

- [`demo_hub.sh`](demo_hub.sh) interacts with GitHub (requires
  [`hub`](http://hub.github.com/)) and opens and merges two pull requests in a
  new repo named `demo_hub`

The first example fails by leaving a merge conflict to be resolved by the user.
The second example succeeds: The `NEWS` file contains two new entries from the
branches merged back to `master`.
In the third example, GitHub pull requests are merged via
`hub merge PULLREQ_URL`.
This also works without conflicts, in contrast to the "Merge" button on GitHub
which will be disabled when trying to merge the second pull request.
