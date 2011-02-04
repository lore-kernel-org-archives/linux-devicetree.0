From: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/4] powerpc: Open PIC binding and "pic-no-reset"
Date: Fri,  4 Feb 2011 17:25:37 -0600
Message-ID: <1296861941-3370-1-git-send-email-meador_inge@mentor.com>
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
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set provides a binding for Open PIC and implements support for
a new property, specified by that binding, called "pic-no-reset".  With
"pic-no-reset" in place the "protected-sources" property is no longer needed
and its full implementation was removed.  "protected-sources" is still checked
for, however, for legacy purposes.

For v3 of this patch the Open PIC binding was changed to be more consistent
with existing bindings, several DTS files were cleaned up, "no-reset" was
changed to "pic-no-reset", and a check to treat "protected-sources" as a
synonym for "pic-no-reset" was added.

Signed-off-by: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

Meador Inge (4):
  powerpc: Removing support for 'protected-sources'
  powerpc: document the Open PIC device tree binding
  powerpc: make MPIC honor the "pic-no-reset" device tree property
  powerpc: Replacing "protected-sources" with "pic-no-reset" in DTS
    files

 Documentation/powerpc/dts-bindings/open-pic.txt |   98 ++++++++++++++++++++++
 arch/powerpc/boot/dts/mpc8572ds_camp_core0.dts  |    6 +-
 arch/powerpc/boot/dts/mpc8572ds_camp_core1.dts  |   11 +--
 arch/powerpc/boot/dts/p2020rdb_camp_core0.dts   |    7 +--
 arch/powerpc/boot/dts/p2020rdb_camp_core1.dts   |    7 +--
 arch/powerpc/include/asm/mpic.h                 |    7 +-
 arch/powerpc/sysdev/mpic.c                      |  102 ++++++++++++-----------
 7 files changed, 157 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/powerpc/dts-bindings/open-pic.txt
