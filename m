From: Meador Inge <meador_inge@mentor.com>
Subject: [PATCH v2 0/3] powerpc: Open PIC binding and 'no-reset' implementation
Date: Wed,  2 Feb 2011 19:51:37 -0600
Message-ID: <1296697900-14004-1-git-send-email-meador_inge@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: linuxppc-dev@lists.ozlabs.org
Cc: devicetree-discuss@lists.ozlabs.org, Hollis Blanchard <hollis_blanchard@mentor.com>
List-Id: devicetree@vger.kernel.org

This patch set provides a binding for Open PIC and implements support for
a new property, specified by that binding, called 'no-reset'.  With 'no-reset'
in place the 'protected-sources' property is no longer needed and was removed.

Signed-off-by: Meador Inge <meador_inge@mentor.com>
CC: Hollis Blanchard <hollis_blanchard@mentor.com>

Meador Inge (3):
  powerpc: Removing support for 'protected-sources'
  powerpc: document the Open PIC device tree binding
  powerpc: make MPIC honor the 'no-reset' device tree property

 Documentation/powerpc/dts-bindings/open-pic.txt |  115 +++++++++++++++++++++++
 arch/powerpc/include/asm/mpic.h                 |    7 +-
 arch/powerpc/sysdev/mpic.c                      |   92 ++++++++----------
 3 files changed, 160 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/powerpc/dts-bindings/open-pic.txt
