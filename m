From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 0/3] Support character literals
Date: Fri,  9 Sep 2011 12:16:28 -0700
Message-ID: <1315595791-25793-1-git-send-email-robotboy@chromium.org>
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

    These patches add simple and escaped character literal parsing support
to the dtc for cell lists and bytestrings.  The first patch refactors the
string parsing code in data.c to expose the more primitive character parsing
code for use in the later patches.  I have left the bytestring support in
place but my hope is that it is now separate enough to be discussed
independantly of the refactor and cell list changes.

    Thanks,
        Anton

Changes in v4:
- Make character literal regex more permissive
- Check for empty character literal in eval_char_literal
- Allow lexing of character literals in all contexts
- Remove special case lexing of character literals in bytestrings

Changes in v3:
- Make octal and hex parsing code static to util.c
- Add test cases for both cell lists and bytestings w/ character literals
- Better error handling and simpler lexing
- Removed changes to out of date manual.txt
- Simplify use of get_escape_char in data_copy_escape_string
- Remove get_escape_char_exact

Changes in v2:
- Move the refactor of data.c to a separate patch
- Add support for character literals in cell lists
- Merge normal and escaped literal support for bytestrings into single patch

Anton Staaf (3):
  dtc: Refactor character literal parsing code
  dtc: Support character literals in cell lists
  dtc: Support character literals in bytestrings

 Documentation/dts-format.txt |    7 ++-
 data.c                       |   85 ++----------------------------------
 dtc-lexer.l                  |    8 +++
 dtc-parser.y                 |   36 +++++++++++++++
 tests/.gitignore             |    1 +
 tests/Makefile.tests         |    1 +
 tests/char_literal.c         |   58 ++++++++++++++++++++++++
 tests/char_literal.dts       |    6 +++
 tests/run_tests.sh           |    3 +
 tests/testdata.h             |    6 +++
 util.c                       |   99 ++++++++++++++++++++++++++++++++++++++++++
 util.h                       |    8 +++
 12 files changed, 234 insertions(+), 84 deletions(-)
 create mode 100644 tests/char_literal.c
 create mode 100644 tests/char_literal.dts

-- 
1.7.3.1
