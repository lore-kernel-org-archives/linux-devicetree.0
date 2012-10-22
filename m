From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/3] PWM: vt8500: Update vt8500 PWM driver support
Date: Mon, 22 Oct 2012 13:52:08 +0000
Message-ID: <201210221352.08352.arnd@arndb.de>
References: <1350643135-13197-1-git-send-email-linux@prisktech.co.nz>
 <201210221150.22004.arnd@arndb.de>
 <20121022120706.GA19467@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121022120706.GA19467-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
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
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 22 October 2012, Thierry Reding wrote:
> > As long as we get build warnings for leaving out the __devinit/__devexit
> > annotations, I would generally recommend putting them in. If we do a
> > patch to remove all of them, a couple extra instances will not cause
> > any more troubles than we already have.
> 
> I've never seen any build warnings for leaving __devinit/__devexit out.
> Where does that happen?

Section mismatches usually result into warnings from modpost, like

WARNING: modpost: Found 1 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=y'

Actually doing that gives you an output like this (currently on exynos_defconfig):

$ make CONFIG_DEBUG_SECTION_MISMATCH=y
WARNING: drivers/pinctrl/built-in.o(.devinit.text+0x124): Section mismatch in reference from the function samsung_pinctrl_probe() to the function .init.text:samsung_gpiolib_register()
The function __devinit samsung_pinctrl_probe() references
a function __init samsung_gpiolib_register().
If samsung_gpiolib_register is only used by samsung_pinctrl_probe then
annotate samsung_gpiolib_register with a matching annotation.

or like this (now fixed in socfpga_defconfig):

WARNING: drivers/net/ethernet/stmicro/stmmac/stmmac.o(.text+0x5d4c): Section mismatch in reference from the function stmmac_pltfr_probe() to the function .devinit.text:stmmac_probe_config_dt()
The function stmmac_pltfr_probe() references
the function __devinit stmmac_probe_config_dt().
This is often because stmmac_pltfr_probe lacks a __devinit 
annotation or the annotation of stmmac_probe_config_dt is wrong.

I believe you normally don't get warnings for functions that could be
marked __devinit and only call regular functions, but there are
a couple of __devinit infrastructure functions that you can't call
from a function that isn't __init or __devinit.

	Arnd
