From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v1 1/1] ARM: dts: rockchip: set crypto default disabled on rk3288
Date: Sun, 01 Sep 2019 01:04:31 +0200
Message-ID: <3345609.Z0LLm6LDBC@phil>
References: <20190827071439.14767-1-zhangzj@rock-chips.com> <4806912.UyKsYhR33o@phil> <3b9cbffa-291e-fc95-bce6-5b24f5fd860d@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3b9cbffa-291e-fc95-bce6-5b24f5fd860d@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Elon Zhang <zhangzj@rock-chips.com>
Cc: mark.rutland@arm.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Elon,

Am Donnerstag, 29. August 2019, 13:31:00 CEST schrieb Elon Zhang:
> On 8/27/2019 22:28, Heiko Stuebner wrote:
> > Am Dienstag, 27. August 2019, 09:14:39 CEST schrieb Elon Zhang:
> >> Not every board needs to enable crypto node, so the node should
> >> be set default disabled in rk3288.dtsi and enabled in specific
> >> board dts file.
> > Can you give a bit more rationale here? There would need to be a very
> > specific reason because of the following:
> >
> > The crypto module is not wired to some board-specific components,
> > so its usability does not depend on the specific board at all.
> > Instead every board can just use it out of the box and the devicetree
> > is supposed to describe the hardware and is _not_ meant as a space
> > for user configuration.
> 
> Right for almost all normal hardware modules but the crypto module was 
> designed
> 
> for secure world. As a result,  the crypto module will become 
> inaccessible for linux kernel if secure world enable it.
> 
> We plan to enable the crypto module in secure world so we should set 
> crypto module default disabled in linux kernel.

ok ... I'm halfway convinced ;-) .

The big thing I want to see is that secure setting in the actual firmware.
Aka right now you probably have that in your Rockchip-specific ATF fork
and I really want to see the relevant change for public uboot or ATF.

I don't necessarily require it to be fully merged before taking this, but
I really want to see the change either on a mailing list or atf gerrit
instance [that makes the crypto engine secure only].

Rationale behind this is that we don't care very much about private stuff
that the general ecosystem doesn't benefit from.


Thanks
Heiko


> > So in fact the status property should probably go away completely from
> > the crypto node, as it's usable out of the box in all cases.
> >
> >
> > Heiko
> >
> >
> >
> >> Signed-off-by: Elon Zhang <zhangzj@rock-chips.com>
> >> ---
> >>   arch/arm/boot/dts/rk3288.dtsi | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> >> index cc893e154fe5..d509aa24177c 100644
> >> --- a/arch/arm/boot/dts/rk3288.dtsi
> >> +++ b/arch/arm/boot/dts/rk3288.dtsi
> >> @@ -984,7 +984,7 @@
> >>   		clock-names = "aclk", "hclk", "sclk", "apb_pclk";
> >>   		resets = <&cru SRST_CRYPTO>;
> >>   		reset-names = "crypto-rst";
> >> -		status = "okay";
> >> +		status = "disabled";
> >>   	};
> >>   
> >>   	iep_mmu: iommu@ff900800 {
> >>
> >
> >
> >
> >
> >
> >
> 
> 
> 
