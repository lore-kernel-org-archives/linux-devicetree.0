From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 0/4] Series short description
Date: Tue, 02 Nov 2010 15:54:56 -0700
Message-ID: <20101102225243.1707.23433.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The following series implements various changes for merging and modifiying
device trees.

The last one is a first stab at making labels from aliases. This way we can
have a consistent syntax for paths from alias and label references:
	&{alias/path/from/alias}
	&{label/path/from/label}

There might be a better approach to implementing this. Once of the constraints
I ended up following was to provide line information when there is an attempt
to re-use a label from a deleted or modified node. This constraint (or
requirement) might not be viewed as important like I think. Removing this might
make the changes easier to implemnt but may make it harder for dts writers to
discover the source of errors.

This last patch doesn't include a test case, though I have tested basic
functionality.

---

John Bonesio (4):
      Allow nodes to be refrenced by path at the top level.
      Implements a new feature for deleting existing device tree nodes.
      Implements a new feature for deleting existing properties in device tree nodes.
      Allow nodes at the root to be specified by path as well as by label.


 Makefile.dtc                    |    1 
 checks.c                        |   20 +++++++
 dtc-lexer.l                     |   38 ++++++++++++-
 dtc-parser.y                    |   86 +++++++++++++++++++++++++++-
 dtc.h                           |   10 +++
 flattree.c                      |    3 +
 livetree.c                      |  118 +++++++++++++++++++++++++++++++++++++--
 tests/dtc-checkfails.sh         |    2 -
 tests/run_tests.sh              |    6 ++
 tests/test_tree1_merge_path.dts |   41 ++++++++++++++
 util.h                          |   10 +++
 11 files changed, 324 insertions(+), 11 deletions(-)
 create mode 100644 tests/test_tree1_merge_path.dts

-- 
Signature
