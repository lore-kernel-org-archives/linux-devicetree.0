From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun4i: Add dts file for the
 pov protab2-ips9 tablet
Date: Tue, 22 Sep 2015 17:02:42 +0200
Message-ID: <20150922150242.GF4684@lukather>
References: <1441441319-10658-1-git-send-email-hdegoede@redhat.com>
 <20150906163023.GR31584@lukather>
 <55ED3739.609@redhat.com>
 <20150907205603.GX31584@lukather>
 <55EE9230.70209@redhat.com>
 <20150913152224.GU9885@lukather>
 <55F5B370.7040203@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y2iEq3umNAphk7dm"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBHW3QWYAKGQEIF3PEDY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55F5B370.7040203-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Y2iEq3umNAphk7dm
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sun, Sep 13, 2015 at 07:33:36PM +0200, Hans de Goede wrote:
> >Anyway. In both cases, the regulator really shouldn't be drifting
> >along like this.
> 
> Right which is why I've added the always-on property.

Which is exactly what I meant by drifting along: that regulator will
never be associated to the i2c bus, and will always be enabled even
though the i2c bus might not even be accessible in the first place
(driver not selected, compiled as a module and not loaded yet), which
is just as bad.

> >If the i2c bus needs a regulator to be operationaly,
> >then we can just add an optional bus-supply property or something to
> >give that to the i2c driver so that it can enable it when needed.
> 
> I agree that that would be sensible if this regulator were tied to
> the pull-ups, but I've my doubts that it is. We've not seen anything
> similar on any other allwinner tablet, other then ChenYu-s Ippo-q8-v5
> tablet.
> 
> This tablet is sort of a high-end tablet (with a nice ips screen) and
> such it also uses a different (better) sensor for its frontcam, a
> gc2015 rather then the usual gc0308. I believe that this is the
> culprit.
> 
> Which would make modelling this as some sort of i2c-bus power-supply
> wrong, and I've checked and none of the existing i2c bindings under
> Documentation/devicetree/bindings/i2c contain such a thing, so we
> would be the first and we will likely have a hard time selling a
> binding for this upstream, esp. since we do not know what exactly
> is going on.

Well, strictly speaking, it is a supply needed to get the bus to
work. We should really try to avoid having always-on for regulators,
especially for devices that are already represented in the DT.

> So all in all I strongly believe that just setting always-on
> on the regulator in question is the best solution.

It's a hack we can avoid.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--Y2iEq3umNAphk7dm--
