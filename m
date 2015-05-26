From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 3/5] dt-bindings: ARM: Mediatek: Document devicetree
 bindings for clock controllers
Date: Tue, 26 May 2015 13:08:19 +0200
Message-ID: <20150526110819.GI6325@pengutronix.de>
References: <1432192376-6712-1-git-send-email-jamesjj.liao@mediatek.com>
 <1432192376-6712-4-git-send-email-jamesjj.liao@mediatek.com>
 <20150526075643.GF6325@pengutronix.de>
 <1432630536.15597.16.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432630536.15597.16.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 26, 2015 at 04:55:36PM +0800, James Liao wrote:
> Hi Sascha,
> 
> On Tue, 2015-05-26 at 09:56 +0200, Sascha Hauer wrote:
> > On Thu, May 21, 2015 at 03:12:54PM +0800, James Liao wrote:
> > > This adds the binding documentation for the mmsys, imgsys, vdecsys,
> > > vencsys and vencltsys controllers found on Mediatek SoCs.
> > > 
> > > index 0000000..a5b94a7
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
> > > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencltsys.txt
> > > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
> > 
> > Do these really become multiple drivers so that it's worth abstracting
> > them in the clock framework?
> 
> These clocks need to be controlled among several drivers. For example,
> vdecsys clocks will be controlled by VDEC driver (not ready yet) and
> MT8173 SMI driver [1]. That means these clocks need a mechanism to share
> between these 2 drivers. CCF share clocks by using of reference count,
> so I think it's suitable to implement these subsystem clocks.
> 
> As I know SMI driver need to access clocks among mmsys, imgsys, vdecsys,
> vencsys and vencltsys. So in this patch I added clocks of these
> subsystems into CCF.
> 
> [1]
> http://lists.infradead.org/pipermail/linux-mediatek/2015-March/000058.html

Looking at the 3.18 tree we have this:

	vdecsys: vdecsys@16000000 {
		compatible = "mediatek,mt8173-vdecsys", "syscon";
		reg = <0 0x16000000 0 0x1000>;
		#clock-cells = <1>;
	};

	larb1:larb@16010000 {
		compatible = "mediatek,mt8173-smi-larb";
		reg = <0 0x16010000 0 0x1000>;
		clocks = <&mmsys MM_SMI_COMMON>,
			 <&vdecsys VDEC_CKEN>,
			 <&vdecsys VDEC_LARB_CKEN>;
		clock-names = "larb_sub0", "larb_sub1", "larb_sub2";
	};

I believe that the larb needs the MM_SMI_COMMON clock to modify the larb
registers, but is it really necessary to enable VDEC_CKEN and
VDEC_LARB_CKEN just to set the F_SMI_MMU_EN bit in the larb?

With the above we have the situation that the vdec driver calls into the
iommu driver which then calls into the larb driver which calls back into
the vdec driver via the clk API. This seems very suspicious.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
