From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 8/8] drm/rockchip: dw_hdmi: add dw-hdmi support for the
 rk3328
Date: Mon, 19 Feb 2018 21:46:04 +0100
Message-ID: <6129590.ZtzF0TqO4l@phil>
References: <20180216204158.29839-1-heiko@sntech.de>
 <20180216204158.29839-9-heiko@sntech.de>
 <20180219202853.eovn6onxtk7p7f4p@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219202853.eovn6onxtk7p7f4p@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, Jose.Abreu@synopsys.com, architt@codeaurora.org, algea.cao@rock-chips.com, devicetree@vger.kernel.org, airlied@linux.ie, hjc@rock-chips.com, dri-devel@lists.freedesktop.org, kishon@ti.com, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, zhengyang@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Rob,

Am Montag, 19. Februar 2018, 21:28:53 CET schrieb Rob Herring:
> On Fri, Feb 16, 2018 at 09:41:58PM +0100, Heiko Stuebner wrote:
> > The rk3328 uses an external hdmi phy from Innosilicon which uses
> > the generic phy framework for access. Add the necessary data
> > and the compatible for it.
> > 
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  .../bindings/display/rockchip/dw_hdmi-rockchip.txt |   1 +
> >  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 106 +++++++++++++++++++++
> >  2 files changed, 107 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> > index 937bfb472e1d..39143424a474 100644
> > --- a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> > +++ b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> > @@ -13,6 +13,7 @@ Required properties:
> >  
> >  - compatible: should be one of the following:
> >  		"rockchip,rk3288-dw-hdmi"
> > +		"rockchip,rk3328-dw-hdmi"
> 
> Is Designware (Synopsys) now Innosilicon?

Nope :-) .

The rk3328 just combines the Designware dw-hdmi with an (external)
hdmi-phy from Innosilicon, where the hdmi-phy otherwise was was
integrated into the hdmi ip-block.
