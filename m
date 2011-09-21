From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/3] Variable sized cell support
Date: Wed, 21 Sep 2011 13:42:08 -0700
Message-ID: <1316637731-21872-1-git-send-email-robotboy@chromium.org>
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

    property = /size/ [8|16|32|64] <0x00 .... 0x12>;

So cell arrays of 8, 16, 32, or 64-bits can now be created.  No padding is
done on the resulting cell array.  So if three 8-bit cells are specified the
resulting property will contain three bytes.

This patch set assumes that the character literals in cell lists patch has
already been applied to your tree as it uses them in it's test case and the
diff will not apply cleanly to TOT without the character literals patch because
both patch sets modify the same locations in the parser.  You do not need to
apply the character literal support in bytestrings patch however.

Anton Staaf (3):
  libfdt: Add fdt16_to_cpu utility function
  dtc: Add data_append_literal function
  dtc: Add support for variable sized cells

 Documentation/dts-format.txt |   18 +++++++-
 data.c                       |   33 ++++++++++++++++
 dtc-lexer.l                  |    6 +++
 dtc-parser.y                 |   59 +++++++++++++++++++----------
 dtc.h                        |    5 ++
 libfdt/libfdt_env.h          |    6 +++
 tests/.gitignore             |    1 +
 tests/Makefile.tests         |    1 +
 tests/run_tests.sh           |    3 +
 tests/sized_cells.c          |   84 ++++++++++++++++++++++++++++++++++++++++++
 tests/sized_cells.dts        |   11 +++++
 tests/testdata.h             |    2 +
 12 files changed, 205 insertions(+), 24 deletions(-)
 create mode 100644 tests/sized_cells.c
 create mode 100644 tests/sized_cells.dts

-- 
1.7.3.1
