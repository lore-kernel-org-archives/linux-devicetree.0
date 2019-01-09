From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: h3: Add ethernet0 alias to
 Beelink X2
Date: Wed, 9 Jan 2019 11:20:49 +0100
Message-ID: <20190109102049.npk77pxtxru4tcyb@flea>
References: <20190108191840.16007-1-jernej.skrabec@siol.net>
 <20190109101228.alsaaw6s57dbapfe@flea>
 <CAGb2v64QM9gyPTtpw0C0fpANW5R9DEsWFSDA_tJPYhdgF_FAhQ@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mkj2k5z2j34krmbx"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBNMW27QQKGQEAFEGWPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v64QM9gyPTtpw0C0fpANW5R9DEsWFSDA_tJPYhdgF_FAhQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--mkj2k5z2j34krmbx
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Jan 09, 2019 at 06:13:24PM +0800, Chen-Yu Tsai wrote:
> On Wed, Jan 9, 2019 at 6:12 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > On Tue, Jan 08, 2019 at 08:18:40PM +0100, Jernej Skrabec wrote:
> > > Because "ethernet0" alias is missing, U-Boot doesn't generate board
> > > specific MAC address. Effect of this is random MAC address every boot
> > > and thus new IP address is assigned to the board.
> > >
> > > Fix this by adding alias.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> >
> > Applied, thanks!
> > Maxime
> 
> Might we add a fixes tag, so the patch gets backported?

It's done, thanks for the suggestion!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--mkj2k5z2j34krmbx--
