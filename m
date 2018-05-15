Return-Path: <SRS0=7rgC=IC=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH/RFC v3 3/4] usb: gadget: udc: renesas_usb3: use usb role
 switch API
Date: Tue, 15 May 2018 08:32:04 +0000
Message-ID: <OSBPR01MB229381ADBD47012167FEF5DBD8930@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1526289360-3997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526289360-3997-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180515075428.6fvkwv2tz6v7cnyj@verge.net.au>
 <OSBPR01MB2293EFC5FD518ECDD612ABDFD8930@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <20180515080342.wksfk5qpazv4l3rs@verge.net.au>
In-Reply-To: <20180515080342.wksfk5qpazv4l3rs@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon-san,

> From: Simon Horman, Sent: Tuesday, May 15, 2018 5:04 PM
>=20
> On Tue, May 15, 2018 at 08:02:00AM +0000, Yoshihiro Shimoda wrote:
> > Hi Simon-san,
> >
> > Thank you for your review!
> >
> > > From: Simon Horman, Sent: Tuesday, May 15, 2018 4:54 PM
> > > On Mon, May 14, 2018 at 06:15:59PM +0900, Yoshihiro Shimoda wrote:
> > <snip>
> > > >  static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)
> > > >  {
> > > > -	_usb3_set_mode(usb3, host);
> > > > +	if (usb3->role_sw)
> > > > +		usb_role_switch_set_role(usb3->role_sw, host ?
> > > > +					 USB_ROLE_HOST : USB_ROLE_DEVICE);
> > > > +	else
> > > > +		_usb3_set_mode(usb3, host);
> > > >  }
> > > >
> > > >  static void usb3_vbus_out(struct renesas_usb3 *usb3, bool enable)
> > > > @@ -672,8 +676,8 @@ static void usb3_mode_config(struct renesas_usb=
3 *usb3, bool host, bool a_dev)
> > > >  {
> > > >  	unsigned long flags;
> > > >
> > > > -	spin_lock_irqsave(&usb3->lock, flags);
> > > >  	usb3_set_mode(usb3, host);
> > > > +	spin_lock_irqsave(&usb3->lock, flags);
> > >
> > > Hi Shimoda-san,
> > >
> > > could you clarify why moving this lock is safe?
> >
> > The usb3_set_mode() is possible to call usb_role_switch_set_role() API
> > and usb_role_switch_set_role() calls mutex_lock().
> > So, this moving this lock (especially avoiding irqsave) needs.
>=20
> Thanks, that make sense.
>=20
> But usb3_set_mode() may also call _usb3_set_mode().
> It is safe to call _usb3_set_mode() without holding the lock?

Thank you for the pointed out. I am thinking it is possible to be
unsafe without holding the lock. So, I'd like to improve this patch somehow
(for example: Add new usb role switch APIs without mutex).

Best regards,
Yoshihiro Shimoda
