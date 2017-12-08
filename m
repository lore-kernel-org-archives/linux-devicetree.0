From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: bananapi-m64:
 Add LED device node
Date: Fri, 8 Dec 2017 10:38:55 +0100
Message-ID: <20171208093855.eyel7buw47efnq3i@flea.lan>
References: <20171201162733.23156-1-wens@csie.org>
 <20171205100511.ohxcqlrozxfgq6id@flea.lan>
 <CAGb2v64HrvHZ-o7dRb2shUBUnwziV9ZVFVEA25+nyBrN+LffpA@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yaipmt5kcfw3xuza"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBMF3VHIQKGQE4U4HMWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v64HrvHZ-o7dRb2shUBUnwziV9ZVFVEA25+nyBrN+LffpA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--yaipmt5kcfw3xuza
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Dec 05, 2017 at 09:00:37PM +0800, Chen-Yu Tsai wrote:
> On Tue, Dec 5, 2017 at 6:05 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi,
> >
> > On Sat, Dec 02, 2017 at 12:27:33AM +0800, Chen-Yu Tsai wrote:
> >> The Bananapi-M64 has 3 LEDS in red, green, and blue. These are toggled
> >> via GPIO lines, which drive transistors that control current across the
> >> LEDS. The red LED is by default on, via an additional pull-up on the
> >> control line. We consider this means that it is a power indicator.
> >> So we set the "default-on" property for it.
> >>
> >> The pingroups the GPIO lines belong to require external regulators be
> >> enabled to be able to drive the GPIO high. These regulators also have
> >> other purposes. However the pin controller does not have bindings for
> >> regulators. Here we just set them to always-on.
> >
> > I guess we should take the opportunity to do just that.
> >
> > We have been deferring this for quite some time now, this is a perfect
> > occasion to do it once and for all :)
> 
> True. But right now I don't see an elegant solution. What is the purpose
> of having the regulator tied to pinctrl / GPIO? You can't have the pinctrl
> driver asking for the regulator at probe time, as it might not be available
> or even have a cyclic dependency (because the PMIC is I2C driven, which
> needs an I2C controller, which needs the pinctrl).

Ah, right, you definitely have a circular dependency.

> If you defer fetching the regulator to a later point, you might end
> up with an inconsistent state.  Again with the I2C driven regulator
> example, what happens if the regulator core decides to turn the
> regulator off before the pinctrl side has a chance to take a
> reference and enable it?

I guess you could implement something based on the an asynchronous
regulator_get. You call regulator_get_async (or whatever) in the
pinctrl probe, and get notified as soon as it is registered so that
you can act upon it.

Anyway, this is a bit too much to ask to enable 3 LEDs... I've applied
that patch.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--yaipmt5kcfw3xuza--
