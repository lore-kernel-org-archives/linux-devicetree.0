From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Subject: [PATCHv2 0/3] mpc52xx/wdt: re-enable the MPC5200 WDT
Date: Thu, 12 Nov 2009 19:39:26 +0100
Message-ID: <1258051166.2280.0@antares>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Likely, Grant" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linux PPC Development <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Devicetree Discussions <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This set of patches merges the MPC5200 WDT into the GPT code, making it
functional again - currently, the MPC5200 GPT code blocks using the WDT.

Additionally, it defines a new OF property as to reserve and/or enable the
WDT during the boot process which may be a requirement for safety-related
(e.g. ISO/EN 61508) applications.

Note that all patches are against Grant Likely's "next" tree.

Compared to the first version of the patch, the basic change is a full merge
of the WDT code into the GPT implementation in arch/powerpc/platforms/52xx.
It makes the old WDT implementation file obsolete.  As a side effect, it is
not possible any more to build the 52xx WDT support as module which shouldn't
be a big issue, though.

Cheers, Albrecht.

---

 Documentation/powerpc/dts-bindings/fsl/mpc5200.txt |   17 +-
 arch/powerpc/include/asm/mpc52xx.h                 |    5 +-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c          |  328 ++++++++++++++++++--
 drivers/watchdog/Kconfig                           |    4 +-
 drivers/watchdog/Makefile                          |    1 -
 5 files changed, 331 insertions(+), 24 deletions(-)
