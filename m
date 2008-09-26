From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: [PATCH 0/9 V3] Implement a new DTS Source Language
Date: Fri, 26 Sep 2008 15:25:39 -0500
Message-ID: <1222460748-20127-1-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series of patches enhances the DTS source language to
support a fullly interpreted language for generating nodes
and properties.  It is backward compatible with V1 sources.

The main features implemented by this patch set support
function definitions, 'if', 'for', 'return' and assignment
statements.  Local variables, global constants and
almost complete C-like expressions are also supported.

Enhancements to the source position and error/warning
reporting now support source column positions too.

Version 1 was the original posting.
Version 2 only fixed one patch in the series

This is Version 3 and it includes fixes and suggestions
due to community review and feedback, and includes a
new patch that provides some testing.  Git bisectability
has been ensured as well.


Jon Loeliger (9):
  Remove support for the legacy DTS source file format.
  Add conditionalized debug() print macro.
  Enhance source position implementation.
  Add header files for new Internal Representation form.
  Add most of the new IR implementation files.
  Add the main IR evaluation implementation
  Introduce new DTS language.
  Add documentation for the new DTS language.
  Test constant expressions in cell contexts.

 Documentation/manual.txt  |  500 ++++++++++++++--
 Makefile                  |    2 +-
 Makefile.dtc              |   18 +-
 dtc-lexer.l               |  311 +++++++---
 dtc-parser.y              |  721 ++++++++++++++++------
 dtc.c                     |    7 +-
 dtc.h                     |    9 +
 ir.c                      |  190 ++++++
 ir.h                      |  175 ++++++
 ir_builtin.c              |  180 ++++++
 ir_builtin.h              |   31 +
 ir_dump.c                 |  211 +++++++
 ir_emit.c                 |  490 +++++++++++++++
 ir_eval.c                 | 1502 +++++++++++++++++++++++++++++++++++++++++++++
 ir_scope.c                |  318 ++++++++++
 ir_scope.h                |  114 ++++
 livetree.c                |   16 +
 nv.c                      |  108 ++++
 nv.h                      |   34 +
 srcpos.c                  |  142 ++++-
 srcpos.h                  |   23 +-
 tests/Makefile.tests      |    1 +
 tests/base01.dts          |   24 +-
 tests/cell-expressions.c  |  116 ++++
 tests/empty.dts           |    2 +
 tests/escapes.dts         |    2 +
 tests/label01.dts         |   38 +-
 tests/references_dts0.dts |   12 +-
 tests/run_tests.sh        |   32 +-
 tests/test01.dts          |   38 +-
 tests/test_tree1_dts0.dts |   18 +-
 treesource.c              |    3 +
 32 files changed, 4987 insertions(+), 401 deletions(-)
 create mode 100644 ir.c
 create mode 100644 ir.h
 create mode 100644 ir_builtin.c
 create mode 100644 ir_builtin.h
 create mode 100644 ir_dump.c
 create mode 100644 ir_emit.c
 create mode 100644 ir_eval.c
 create mode 100644 ir_scope.c
 create mode 100644 ir_scope.h
 create mode 100644 nv.c
 create mode 100644 nv.h
 create mode 100644 tests/cell-expressions.c
