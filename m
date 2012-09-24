From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 0/2] dtc: cpp co-existence
Date: Mon, 24 Sep 2012 16:51:15 -0600
Message-ID: <1348527077-27471-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This series is a minimal set of changes to dtc that allows one to run
cpp on a .dts file, and pass the result to dtc for final compilation.

Stephen Warren (2):
  dtc: cpp co-existence: allow names starting with # to be escaped
  dtc: cpp co-existence: add support for #line directives

 dtc-lexer.l                |   26 ++++++++++++++++++++++++--
 srcpos.c                   |    6 ++++++
 srcpos.h                   |    2 ++
 tests/.gitignore           |    1 +
 tests/Makefile.tests       |    2 +-
 tests/propname_escapes.c   |   43 +++++++++++++++++++++++++++++++++++++++++++
 tests/propname_escapes.dts |   13 +++++++++++++
 tests/run_tests.sh         |    3 +++
 8 files changed, 93 insertions(+), 3 deletions(-)
 create mode 100644 tests/propname_escapes.c
 create mode 100644 tests/propname_escapes.dts
