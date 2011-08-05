From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: AT91: dt: basic device tree showcase
Date: Fri,  5 Aug 2011 17:24:51 +0100
Message-ID: <1312561493-7849-1-git-send-email-nicolas.ferre@atmel.com>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

As a showcase, this is a basic device tree support for at91 SoC.
It add at91sam9g45 SoC with its Evaluation Kit board descriptions.
Only the dmaengine driver is converted at the moment so the support
is fairly simple.

Nicolas Ferre (2):
      AT91: dt: at91sam9g45 family and board device tree files
      AT91: dt: simple device tree support for at91sam9g45 family

 arch/arm/boot/dts/at91sam9g45.dtsi       |   27 ++++++++++++++++++++++
 arch/arm/boot/dts/at91sam9m10g45ek.dts   |   15 ++++++++++++
 arch/arm/mach-at91/Kconfig               |    8 ++++++
 arch/arm/mach-at91/Makefile.boot         |    2 +
 arch/arm/mach-at91/at91sam9g45_devices.c |    3 +-
 arch/arm/mach-at91/board-sam9m10g45ek.c  |   36 ++++++++++++++++++++++++++++++
 6 files changed, 90 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91sam9g45.dtsi
 create mode 100644 arch/arm/boot/dts/at91sam9m10g45ek.dts
