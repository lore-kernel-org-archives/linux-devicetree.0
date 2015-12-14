From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 3/4] ARM: dts: rockchip: add eFuse node for rk3066a SoCs
Date: Mon, 14 Dec 2015 14:06:06 +0100
Message-ID: <3368238.OTPIyEf9PI@diego>
References: <1447227272-1728-1-git-send-email-wxt@rock-chips.com> <1447227272-1728-4-git-send-email-wxt@rock-chips.com> <566E926E.7090903@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <566E926E.7090903@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Caesar Wang <wxt@rock-chips.com>, linux-rockchip@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi srini,

Am Montag, 14. Dezember 2015, 09:57:02 schrieb Srinivas Kandagatla:
> Heiko,
> 
> Can you take the DT patches in this series via your tree.
> 
> I picked up nvmem patches from this series.

yep that was my plan ... just needed to wait for the nvmem parts to be picked.


Thanks for the notifying me :-)
Heiko


> 
> thanks,
> srini
> 
> On 11/11/15 07:34, Caesar Wang wrote:
> > This patch add the eFuse dt node for rk3066a SoCs.
> > 
> > Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> > ---
> > 
> >   arch/arm/boot/dts/rk3066a.dtsi | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/rk3066a.dtsi
> > b/arch/arm/boot/dts/rk3066a.dtsi index 946f187..f61bb8a 100644
> > --- a/arch/arm/boot/dts/rk3066a.dtsi
> > +++ b/arch/arm/boot/dts/rk3066a.dtsi
> > @@ -153,6 +153,19 @@
> > 
> >   		clock-names = "timer", "pclk";
> >   	
> >   	};
> > 
> > +	efuse: efuse@20010000 {
> > +		compatible = "rockchip,rockchip-efuse";
> > +		reg = <0x20010000 0x4000>;
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		clocks = <&cru PCLK_EFUSE>;
> > +		clock-names = "pclk_efuse";
> > +
> > +		cpu_leakage: cpu_leakage {
> > +			reg = <0x17 0x1>;
> > +		};
> > +	};
> > +
> > 
> >   	timer@20038000 {
> >   	
> >   		compatible = "snps,dw-apb-timer-osc";
> >   		reg = <0x20038000 0x100>;
