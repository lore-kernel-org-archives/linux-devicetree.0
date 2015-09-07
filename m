From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun4i: Add dts file for the
 pov protab2-ips9 tablet
Date: Mon, 07 Sep 2015 10:49:02 +0300
Message-ID: <1441612142.14422.34.camel@plaes.org>
References: <1441441319-10658-1-git-send-email-hdegoede@redhat.com>
	 <20150906163023.GR31584@lukather> <55ED3739.609@redhat.com>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDJLTBEBXENBB4MCWWXQKGQEO2JYB4Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <55ED3739.609-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-09-07 at 09:05 +0200, Hans de Goede wrote:
> Hi,
>=20
> On 06-09-15 18:30, Maxime Ripard wrote:
> > On Sat, Sep 05, 2015 at 10:21:59AM +0200, Hans de Goede wrote:
> > > The Point of View protab2-ips9 is a tablet with a 9" ips 1024x768
> > > lcd screen,
> > > microsd slot, headphones, mini hdmi, mini usb b and power barrel
> > > connectors.
> > >=20
> > > It uses a rtl8188cus usb wifi chip and a RDA 5875Y bluetooth chip
> > > attached
> > > to uart2. It has a bma250 accelerometer attached to i2c1 addr
> > > 0x18.
> > >=20

[...]
> >=20
> > What is connected on i2c1 ? Just the camera sensor? or it has some
> > other devices there?
>=20
> The bma250 accelerometer sits there, and the kernel already has a
> driver
> for it. That driver needs to have devicetree binding support added,
> and
> then we should be able to use the accelerometer.

bma250 already has devicetree support. It is used in Gemei G9 tablet
(sun4i-gemei-g9.dts).

P=C3=A4ikest,
Priit :)

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
