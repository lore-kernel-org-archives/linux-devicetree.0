From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 0/3] Variable sized cell support
Date: Fri, 23 Sep 2011 11:02:51 -0700
Message-ID: <1316800974-30129-1-git-send-email-robotboy@chromium.org>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set adds, tests, and documents support for variable sized cells in
cell arrays.  The new syntax is:

    property = /bits/ [8|16|32|64] <0x00 .... 0x12>;

So cell arrays of 8, 16, 32, or 64-bits can now be created.  No padding is
done on the resulting cell array.  So if three 8-bit cells are specified the
resulting property will contain three bytes.

Changes in v2:
- sized_data renamed to celllist
- celllist definition moved to dtc-parser.y
- celllist non-terminal renamed to celllistprefix
- references always appended as -1 masked to the size of the cell
- smaller test values derived from TEST_VALUE_1
- data_append_literal renamed to data_append_integer
- be_ removed from values in data_append_integer
- len renamed to bits in data_append_integer

Changes in v3:
- Renamed size to bits in docs, parser, commit messages, and celllist struct
- Remove die on overflow from data_append_integer
- Rewrite data_append_cell|addr in terms of data_append_integer
- Minor cosmetic change to property names in test case (added 'b' to last two)

Anton Staaf (3):
  libfdt: Add fdt16_to_cpu utility function
  dtc: Add data_append_integer function
  dtc: Add support for variable sized cells

 Documentation/dts-format.txt |   18 +++++++-
 data.c                       |   39 ++++++++++++++++---
 dtc-lexer.l                  |    6 +++
 dtc-parser.y                 |   67 ++++++++++++++++++++++-----------
 dtc.h                        |    1 +
 libfdt/libfdt_env.h          |    6 +++
 tests/.gitignore             |    1 +
 tests/Makefile.tests         |    1 +
 tests/run_tests.sh           |    3 +
 tests/sized_cells.c          |   84 ++++++++++++++++++++++++++++++++++++++++++
 tests/sized_cells.dts        |   11 +++++
 11 files changed, 205 insertions(+), 32 deletions(-)
 create mode 100644 tests/sized_cells.c
 create mode 100644 tests/sized_cells.dts

-- 
1.7.3.1
