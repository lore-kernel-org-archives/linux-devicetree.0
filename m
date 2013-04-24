From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/7] ARM: i.MX53: dts: add Ka-Ro tx53
Date: Wed, 24 Apr 2013 19:57:54 +0800
Message-ID: <20130424115753.GB2736@S2101-09.ap.freescale.net>
References: <1366796486-10641-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1366796486-10641-1-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 24, 2013 at 11:41:19AM +0200, Steffen Trumtrar wrote:
> Hi!
> 
> This series adds a dtsi for the Ka-Ro TX53 System-On-Module and all necessary
> pinctrls that are not already in the imx53.dtsi.
> I tested this on 3.9-rc8 with a custom baseboard, but rebased everything to
> Shawns imx/dt-3.11, which I presume is the correct base for future dts.
> 
> Regards,
> Steffen
> 
> Steffen Trumtrar (7):
>   ARM: i.MX53: add audmux pinctrl
>   ARM: i.MX53: add csi pinctrl
>   ARM: i.MX53: add ecspi pinctrl
>   ARM: i.MX53: add pwm2 pinctrl
>   ARM: i.MX53: add uart1 pinctrl
>   ARM: i.MX53: add uart2 pinctrl
>   ARM: dts: add Ka-Ro tx53 devicetree

All applied, thanks.
