From: Vivek Unune <npcomplete13@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix usb-c on Hugsun X99 TV Box
Date: Fri, 4 Oct 2019 20:52:00 -0400
Message-ID: <20191005005200.GA11418@vivek-desktop>
References: <20190929032230.24628-1-npcomplete13@gmail.com>
 <54c67ca8-8428-48ee-9a96-e1216ba02839@gmail.com>
 <20190929234615.GA5355@vivek-desktop>
 <2223294.9I8gkMH88G@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2223294.9I8gkMH88G@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Vicente Bergas <vicencb@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, ezequiel@collabora.com, akash@openedev.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 04, 2019 at 11:45:08PM +0200, Heiko Stuebner wrote:
> Hi Vivek,
> 
> Am Montag, 30. September 2019, 01:46:15 CEST schrieb Vivek Unune:
> > On Sun, Sep 29, 2019 at 01:22:17PM +0200, Vicente Bergas wrote:
> > > On Sunday, September 29, 2019 5:22:30 AM CEST, Vivek Unune wrote:
> > > > Fix usb-c on X99 TV Box. Tested with armbian w/ kernel 5.3
> > > > 
> > > > Signed-off-by: Vivek Unune <npcomplete13@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
> > > > b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
> > > > index 0d1f5f9a0de9..c133e8d64b2a 100644
> > > > --- a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
> > > > +++ b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
> > > > @@ -644,7 +644,7 @@
> > > >  	status = "okay";
> > > >  	u2phy0_host: host-port {
> > > > -		phy-supply = <&vcc5v0_host>;
> > > > +		phy-supply = <&vcc5v0_typec>;
> > > >  		status = "okay";
> > > >  	};
> > > > @@ -712,7 +712,7 @@
> > > >  &usbdrd_dwc3_0 {
> > > >  	status = "okay";
> > > > -	dr_mode = "otg";
> > > > +	dr_mode = "host";
> > > >  };
> > > >  &usbdrd3_1 {
> > > 
> > > Hi Vivek,
> > > 
> > > which is the relationship of your patch and this commit:
> > > 
> > > e1d9149e8389f1690cdd4e4056766dd26488a0fe
> > > arm64: dts: rockchip: Fix USB3 Type-C on rk3399-sapphire
> > > 
> > > with respect to this other commit:
> > > 
> > > c09b73cfac2a9317f1104169045c519c6021aa1d
> > > usb: dwc3: don't set gadget->is_otg flag
> > > 
> > > ?
> > > 
> > > I did not test reverting e1d9149e since c09b73cf was applied.
> > > 
> > > Regards,
> > >  Vicenç.
> > > 
> > 
> > Hi Vicenç,
> > 
> > Indeed, I was motivated by e1d9149e ("arm64: dts: rockchip: Fix USB3 
> > Type-C on rk3399-sapphire"). X99 TV box showed exact same symptoms
> > with usb-c port. After applying the fix, it worked.
> > 
> > I was not aware of c09b73cf ("usb: dwc3: don't set gadget->is_otg
> >  flag") and it will be interesting to test it. This might render
> > my fix unecessary.
> 
> So I'll let this patch sit here for now.
> Once you've done the testing, can you please respond with the
> result (both positive and negative results please).
> 
> Thanks
> Heiko
> 
> 

Hi Heiko,

I tested the c09b73cf patch without modifying exsisting dts. I can confirm
that that patch doesn't work for me. No usb-c devices were recognized.

Vicenç - were you able to test it?

As soon as I apply dts patch, usb-c devices are recognized.

Thanks,

Vivek
