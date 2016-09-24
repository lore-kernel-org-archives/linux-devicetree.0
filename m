From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Sat, 24 Sep 2016 19:41:33 +0100
Message-ID: <20160924184133.seh6v6eayt7hwgue@sirena.org.uk>
References: <20160906190524.GB79728@google.com>
 <20160912185633.GH27946@sirena.org.uk>
 <20160913172140.GC62872@google.com>
 <20160915143945.GJ27974@sirena.org.uk>
 <20160915180223.GE62872@google.com>
 <20160916163253.GA10189@sirena.org.uk>
 <CAD=FV=U2bi7GEA3Tq4vpzqF8J2hpgN-Vq4Jv=PnaGYhA3Z6vGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a3vqyyjcebjbbbrb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=U2bi7GEA3Tq4vpzqF8J2hpgN-Vq4Jv=PnaGYhA3Z6vGg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Brian Norris <briannorris@chromium.org>, Javier Martinez Canillas <javier@dowhile0.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--a3vqyyjcebjbbbrb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 19, 2016 at 11:39:24AM -0700, Doug Anderson wrote:
> On Fri, Sep 16, 2016 at 9:32 AM, Mark Brown <broonie@kernel.org> wrote:

> > So the PWM is just configuring this external regulator chip (which
> > doesn't seem to be described in DT...) and that's just incredibly bad at
> > coping with voltage changes?  It does sound rather like we ought to be
> > representing this chip directly in case it needs other workarounds.

> I'm not 100% sure you can blame the regulator chip.  What we describe
> in the device tree as a "PWM Regulator" is actually:

> 1. Some discreet buck regulator whose output voltage is configured by
> adjusting an input voltage.  AKA: the buck regulator has "3" inputs:
> vin, vout, config.  You put a certain voltage on the "config" pin and
> that controls the value that comes out of "vout".

> 2. A network of resistors, capacitors, and inductors that take the
> output of a PWM and filter / smooth it enough that it can be a good
> config input to the discreet buck.

Ugh, right.  So you're using the PWM regulator output voltage as an
input to this other regulator.  TBH that sounds even more like this
other regulator should be represented in DT as the consumer of the PWM
regulator, the PWM regulator is not actually producing the voltages
claimed directly.

> The actual behavior of the PWM regulator depends as much (or more) on
> what values you have for the resistors, capacitors, and inductors than
> it does on the actual buck.  ...so two people using the same discreet
> buck might have very different behaviors in terms of rise time and how
> much they are impacted by the over voltage protection.

Right, these are properties of the PWM regulator.  But for some reason
the DCDC is still incapable of understanding it's own transitions and
flags out of spec too easily?  That isn't really a sign of high quality,
but then this does seem like the DCDC is really intended for a fixed
voltage application and is being abused in this system design to scale
dynamically so really it's a badly concieved hardware design I suppose.

--a3vqyyjcebjbbbrb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJX5sjdAAoJECTWi3JdVIfQRzYH/11IgDlrwrIutbkVFrloZ1q3
qSLXQ0fvDeZHD0WKEI7Vfj9HcBuvOSu5cqO25XB/xSEvEU8PHQRUJvrTUJ9gTByb
m5ro6GMXPAVrKCfvsbEOLA7dx8zZsWlOQAf0GYQAIhT8dlqMWT3umDPBhWU8CvQm
s4KevB26a7HZb8ZMZHpT5BQPpNGhwWxWgsv4Hux7BUj9/B3BWiMCMRE96dYXLdUR
wdI/s37NCdrdsulHsDjvo7574TRl3xHITqP9qLx7pmCWcRa4Naf1OgnOIayhyTG1
eIC+Zk0dJfk4V+cDsWtn5T/HLuw+0OqrrggQDLLMucujA+pCWCbTQcz7Pmy5fNM=
=Ri36
-----END PGP SIGNATURE-----

--a3vqyyjcebjbbbrb--
