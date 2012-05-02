From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/4] mmc: sdhci-imx-esdhc: convert to use pinctrl
 subsystem
Date: Wed, 2 May 2012 09:51:26 +0800
Message-ID: <20120502015124.GP2194@S2101-09.ap.freescale.net>
References: <1335529578-14507-1-git-send-email-b29396@freescale.com>
 <1335529578-14507-4-git-send-email-b29396@freescale.com>
 <CACRpkdbE=fFhTr=MyD-2dgV=W07Kb-T+ax4dgdjZ8ONzoz3K7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbE=fFhTr=MyD-2dgV=W07Kb-T+ax4dgdjZ8ONzoz3K7A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 02, 2012 at 01:12:58AM +0200, Linus Walleij wrote:
> If I cannot apply it there are two ways to proceed:
> 1. Wait for next merge window
> 2. Pull pinctrl into i.MX tree
> 
Yes, if we would not wait for next merge window, I prefer to ask Arnd,
Olof to pull pinctrl into arm-soc as a dependency and we convert imx
drivers to the subsystem in there.

BTW, this patch should be split into two.  Adding dummy pinctrl for
imx should be one patch, and sdhci-imx-esdhc should be separate one.
And we may want to come up a series to convert all outstanding imx
driver to use pinctrl API, one patch for one driver with subsystem
maintainer Cc on the corresponding driver patch.

-- 
Regards,
Shawn
