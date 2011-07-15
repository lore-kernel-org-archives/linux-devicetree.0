From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] dmaengine: imx-sdma: use platform_device_id to
	identify sdma version
Date: Fri, 15 Jul 2011 10:25:21 +0200
Message-ID: <20110715082521.GL6069@pengutronix.de>
References: <1310660057-17953-1-git-send-email-shawn.guo@linaro.org>
	<1310660057-17953-2-git-send-email-shawn.guo@linaro.org>
	<20110715080132.GI6069@pengutronix.de>
	<20110715082204.GD1840@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110715082204.GD1840-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 15, 2011 at 04:22:05PM +0800, Shawn Guo wrote:
> Hi Sascha,
> 
> On Fri, Jul 15, 2011 at 10:01:32AM +0200, Sascha Hauer wrote:
> > On Fri, Jul 15, 2011 at 12:14:16AM +0800, Shawn Guo wrote:
> > > It might be not good to use software defined version to identify sdma
> > > device type, when hardware does not define such version.  Instead,
> > > soc name is stable enough to define the device type.
> > > 
> > > The patch uses platform_device_id rather than version number passed
> > > by platform data to identify sdma device type/version.
> > > 
> > > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > 
> > Generally Acked-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > 
> > However, I find no branch to apply this on. This patch *mostly* applied
> > after I merged Grants gpio-next branch into mine and resolved the
> > resulting merge conflicts.
> > 
> I appreciate it, if you can do that.

Do what? apply it mostly?

>  Otherwise, maybe we can let it
> rest for a while until all trees get merged in coming -rc window.

Yes please. I don't want to move i.MX in the merge conflict focus again,
this wouldn't be good for all of us.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
