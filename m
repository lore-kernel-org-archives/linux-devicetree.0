From: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/2] powerpc: define and implement MPIC message register
	support
Date: Fri, 20 May 2011 11:36:37 -0500
Message-ID: <1305909399-26969-1-git-send-email-meador_inge@mentor.com>
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
Cc: openmcapi-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set defines a binding for FSL MPIC message registers and implements
an API for accessing those message registers.  Testing was done on a MPC8572DS
in an Linux-Linux AMP setup using OpenMCAPI (www.openmcapi.org) to communicate
between OS instances.  The message register API is used by the OpenMCAPI shared 
memory driver to send notifications between cores.

* v2 - Incorporate feedback from Scott Wood
   * Make binding less implementation specific.
   * Add 'mpic-' prefix to message register node properties and aliases.
   * Remove 'interrupt-parent' from binding.
   * Fixed some example bugs with receive masks.

Signed-off-by: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

Meador Inge (2):
  powerpc: document the FSL MPIC message register binding
  powerpc: add support for MPIC message register API

 .../devicetree/bindings/powerpc/fsl/mpic-msgr.txt  |   62 +++++
 arch/powerpc/include/asm/mpic_msgr.h               |   35 +++
 arch/powerpc/platforms/Kconfig                     |    8 +
 arch/powerpc/sysdev/Makefile                       |    3 +-
 arch/powerpc/sysdev/mpic_msgr.c                    |  279 ++++++++++++++++++++
 5 files changed, 386 insertions(+), 1 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/mpic-msgr.txt
 create mode 100644 arch/powerpc/include/asm/mpic_msgr.h
 create mode 100644 arch/powerpc/sysdev/mpic_msgr.c
