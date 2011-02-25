From: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 0/2]  powerpc: Open PIC binding and "pic-no-reset"
Date: Fri, 25 Feb 2011 15:59:35 -0600
Message-ID: <1298671177-19572-1-git-send-email-meador_inge@mentor.com>
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
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Dave Kleikamp <shaggy-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set provides a binding for Open PIC and implements support for
a new property, specified by that binding, called "pic-no-reset".

v4 - Per Ben's feedback the protected sources implementation was left
     completely intact.  As such, the DTS cleanup and "protected-sources"
     removal patches were dropped.

v3 - the Open PIC binding was changed to be more consistent with existing
     bindings, several DTS files were cleaned up, "no-reset" was changed to
     "pic-no-reset", and a check to treat "protected-sources" as a synonym for
     "pic-no-reset" was added.

Signed-off-by: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Dave Kleikamp <shaggy-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Meador Inge (2):
  powerpc: document the Open PIC device tree binding
  powerpc: make MPIC honor the "pic-no-reset" device tree property

 Documentation/powerpc/dts-bindings/open-pic.txt |   98 +++++++++++++++++++++++
 arch/powerpc/include/asm/mpic.h                 |    6 ++
 arch/powerpc/sysdev/mpic.c                      |   67 ++++++++++++----
 3 files changed, 155 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/powerpc/dts-bindings/open-pic.txt
