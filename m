From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] usb: phy-generic: Don't fail on missing gpio reset
Date: Tue, 27 Jan 2015 11:13:08 -0800
Message-ID: <19e48726b36942cfb0430fc625b41e1b@BY2FFO11FD043.protection.gbl>
References: <1422323129-20969-1-git-send-email-soren.brinkmann@xilinx.com>
 <20150127152047.GA13776@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150127152047.GA13776@saruman.tx.rr.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ola Jeppson <ola@adapteva.com>, linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-01-27 at 09:20AM -0600, Felipe Balbi wrote:
> On Mon, Jan 26, 2015 at 05:45:29PM -0800, Soren Brinkmann wrote:
> > A reset through a GPIO is optional. Don't fail probing when it is
> > missing.
> >=20
> > Reported-by: Andreas F=C3=A4rber <afaerber@suse.de>
> > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > ---
> > Hi Andreas,
> >=20
> > does this do the trick?
> >=20
> > 	Thanks,
> > 	S=C3=B6ren
> >=20
> >  drivers/usb/phy/phy-generic.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-ge=
neric.c
> > index dd05254241fb..a73d4c738f0b 100644
> > --- a/drivers/usb/phy/phy-generic.c
> > +++ b/drivers/usb/phy/phy-generic.c
> > @@ -241,10 +241,8 @@ int usb_phy_gen_create_phy(struct device *dev,=
 struct usb_phy_generic *nop,
> > =20
> >  	if (err =3D=3D -EPROBE_DEFER)
> >  		return -EPROBE_DEFER;
> > -	if (err) {
> > -		dev_err(dev, "Error requesting RESET GPIO\n");
> > -		return err;
> > -	}
> > +	if (err)
> > +		nop->gpiod_reset =3D NULL;
>=20
> there's a better patch to use gpiod_get_optional(), instead.

Great, apparently that wasn't in linux-next yesterday. I'll give it a
shot once it arrives there.

	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
