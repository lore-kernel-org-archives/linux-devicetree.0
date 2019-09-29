From: Vivek Unune <npcomplete13@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix usb-c on Hugsun X99 TV Box
Date: Sun, 29 Sep 2019 19:46:15 -0400
Message-ID: <20190929234615.GA5355@vivek-desktop>
References: <20190929032230.24628-1-npcomplete13@gmail.com>
 <54c67ca8-8428-48ee-9a96-e1216ba02839@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <54c67ca8-8428-48ee-9a96-e1216ba02839@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vicente Bergas <vicencb@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, heiko@sntech.de, Felipe Balbi <felipe.balbi@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, akash@openedev.com, ezequiel@collabora.com, linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 29, 2019 at 01:22:17PM +0200, Vicente Bergas wrote:
> On Sunday, September 29, 2019 5:22:30 AM CEST, Vivek Unune wrote:
> > Fix usb-c on X99 TV Box. Tested with armbian w/ kernel 5.3
> > =

> > Signed-off-by: Vivek Unune <npcomplete13@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > =

> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
> > b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
> > index 0d1f5f9a0de9..c133e8d64b2a 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
> > @@ -644,7 +644,7 @@
> >  	status =3D "okay";
> >  	u2phy0_host: host-port {
> > -		phy-supply =3D <&vcc5v0_host>;
> > +		phy-supply =3D <&vcc5v0_typec>;
> >  		status =3D "okay";
> >  	};
> > @@ -712,7 +712,7 @@
> >  &usbdrd_dwc3_0 {
> >  	status =3D "okay";
> > -	dr_mode =3D "otg";
> > +	dr_mode =3D "host";
> >  };
> >  &usbdrd3_1 {
> =

> Hi Vivek,
> =

> which is the relationship of your patch and this commit:
> =

> e1d9149e8389f1690cdd4e4056766dd26488a0fe
> arm64: dts: rockchip: Fix USB3 Type-C on rk3399-sapphire
> =

> with respect to this other commit:
> =

> c09b73cfac2a9317f1104169045c519c6021aa1d
> usb: dwc3: don't set gadget->is_otg flag
> =

> ?
> =

> I did not test reverting e1d9149e since c09b73cf was applied.
> =

> Regards,
>  Vicen=E7.
> =


Hi Vicen=E7,

Indeed, I was motivated by e1d9149e ("arm64: dts: rockchip: Fix USB3 =

Type-C on rk3399-sapphire"). X99 TV box showed exact same symptoms
with usb-c port. After applying the fix, it worked.

I was not aware of c09b73cf ("usb: dwc3: don't set gadget->is_otg
 flag") and it will be interesting to test it. This might render
my fix unecessary.

Thanks,

Vivek
