From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/5] ARM: imx: Remove cpufreq driver
Date: Wed, 27 Mar 2013 22:05:31 +0800
Message-ID: <20130327140529.GG2674@S2101-09.ap.freescale.net>
References: <1364389294-1997-1-git-send-email-mpa@pengutronix.de>
 <1364389294-1997-6-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364389294-1997-6-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 27, 2013 at 02:01:34PM +0100, Markus Pargmann wrote:
> The old cpufreq driver is not necessary anymore with DT and
> cpufreq-cpu0.
> 
> Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  arch/arm/Kconfig                      |   7 --
>  arch/arm/mach-imx/Makefile            |   1 -
>  arch/arm/mach-imx/cpu_op-mx51.c       |  31 -----
>  arch/arm/mach-imx/cpu_op-mx51.h       |  14 ---
>  arch/arm/mach-imx/cpufreq.c           | 206 ----------------------------------
>  arch/arm/mach-imx/mach-cpuimx51sd.c   |   5 -
>  arch/arm/mach-imx/mach-mx51_babbage.c |   4 -
>  7 files changed, 268 deletions(-)
>  delete mode 100644 arch/arm/mach-imx/cpu_op-mx51.c

Target cpu_op-mx51.o should be removed from Makefile then.

I fixed it up and applied the series expect the first patch.  I expect
you will send follow-up patches to add imx51 operating-points into
device tree though.

Shawn
