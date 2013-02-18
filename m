From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/8] ARM i.MX6q: Add GPU, VPU, IPU, and OpenVG resets
 to System Reset Controller (SRC)
Date: Mon, 18 Feb 2013 09:56:52 +0800
Message-ID: <20130218015650.GG6782@S2101-09.ap.freescale.net>
References: <1360776872-18584-1-git-send-email-p.zabel@pengutronix.de>
 <1360776872-18584-4-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1360776872-18584-4-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 13, 2013 at 06:34:27PM +0100, Philipp Zabel wrote:
> The SRC has auto-deasserting reset bits that control reset lines to
> the GPU, VPU, IPU, and OpenVG IP modules. This patch adds a reset
> controller that can be controlled by those devices using the
> reset controller API.

We now architecturally depend on RESET_CONTROLLER, so need to have
Kconfig to reflect that.  Not sure if it's the best solution, the
following is what I have.

drivers/reset/Kconfig:

config ARCH_HAS_RESET_CONTROLLER
	bool

menuconfig RESET_CONTROLLER
	bool "Reset Controller Support"
	default y if ARCH_HAS_RESET_CONTROLLER

arch/arm/mach-imx/Kconfig:

 config ARCH_MXC
        bool "Freescale i.MX family" if ARCH_MULTI_V4_V5 || ARCH_MULTI_V6_V7
+       select ARCH_HAS_RESET_CONTROLLER
        select ARCH_REQUIRE_GPIOLIB
        select ARM_PATCH_PHYS_VIRT
        select AUTO_ZRELADDR if !ZBOOT_ROM

Shawn
