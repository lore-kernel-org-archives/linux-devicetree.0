From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH] ARM: imx: add HDMI support for SolidRun HummingBoard and
 Cubox-i
Date: Thu, 8 May 2014 15:02:04 +0800
Message-ID: <20140508070203.GC2798@dragon>
References: <E1Wb5br-0002ZE-T3@rmk-PC.arm.linux.org.uk>
 <20140419054134.GV2523@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140419054134.GV2523@dragon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, arm@kernel.org, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 19, 2014 at 01:41:35PM +0800, Shawn Guo wrote:
> On Fri, Apr 18, 2014 at 11:01:27AM +0100, Russell King wrote:
> > Add the HDMI DT configuration for the SolidRun HummingBoard and Cubox-i.
> > 
> > Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> > ---
> >  arch/arm/boot/dts/imx6dl-hummingboard.dts | 28 ++++++++++++++++++++++++++++
> >  arch/arm/boot/dts/imx6qdl-cubox-i.dtsi    | 28 ++++++++++++++++++++++++++++
> >  2 files changed, 56 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/imx6dl-hummingboard.dts b/arch/arm/boot/dts/imx6dl-hummingboard.dts
> > index 5bfae54fb780..d3095f58bf7b 100644
> > --- a/arch/arm/boot/dts/imx6dl-hummingboard.dts
> > +++ b/arch/arm/boot/dts/imx6dl-hummingboard.dts
> > @@ -67,6 +67,14 @@
> >  	status = "okay";
> >  };
> >  
> > +&hdmi {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_hummingboard_hdmi>;
> > +	ddc-i2c-bus = <&i2c2>;
> > +	status = "okay";
> > +	crtcs = <&ipu1 0>;
> 
> The 'crtcs' should be dropped now, right?

Dropped the crtcs line and applied the patch, thanks.

Shawn
