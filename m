From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 1/2] doc/devicetree: Add Aspeed VIC bindings
Date: Tue, 10 May 2016 08:04:40 +1000
Message-ID: <1462831480.20290.120.camel@kernel.crashing.org>
References: <1462797239-14765-1-git-send-email-joel@jms.id.au>
	 <1462797239-14765-2-git-send-email-joel@jms.id.au>
	 <20160509152003.GA13842@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160509152003.GA13842@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2016-05-09 at 16:20 +0100, Mark Rutland wrote:
>=C2=A0
> Generally we steer clear of this kind of bitmap encoding in DT.
>=20
> Is this actually necessary? What does htis gain us?
>=20
> Why can we not just register with the full set of possible
> interrupts?

Trying to remember why I did that ... I think it has to do with
supporting multiple SoCs that have different possible sources...

There might also be a case of some sources routed to the internal
coldfire microcontroller or the LPC bus instead of the ARM but I'm not
100% certain.

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
