From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 2/4] drivers/clocksource/moxart: Refactor enable/disable
Date: Wed, 20 Jul 2016 18:22:39 +1000
Message-ID: <1469002959.8568.102.camel@kernel.crashing.org>
References: <1462797169-14512-1-git-send-email-joel@jms.id.au>
	 <1462797169-14512-3-git-send-email-joel@jms.id.au>
	 <CACPK8XfJ2e1kr-WftidvqsoYew7LqPiNo0sw7opgh8UH=3q_3A@mail.gmail.com>
	 <20160510130414.GE14952@linaro.org>
	 <CACPK8XdK35p9rxr8et58omvQExjdri20yCq91LGocnPRYpGLQQ@mail.gmail.com>
	 <20160720081400.GA2705@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160720081400.GA2705-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-07-20 at 10:14 +0200, Daniel Lezcano wrote:
>=20
> actually I forgot to include your patchset which is no longer applyin=
g=C2=A0
> correctly and the conflicts are not trivials (easy but not trivial). =
It is a=C2=A0
> bit late to ask for a last minute pull. Sorry for that.
>=20
> Please respin and resend your patchset, I will include it in my tree=C2=
=A0
> immediately so that won't happen again. The patch 1/4 is no longer ne=
eded.
>=20
> If there is a really urgent need of this series, please let us know a=
nd=C2=A0
> Thomas can take a decision accordingly.

I think all the other bits to have basic support for the Aspeed SoC are
in except this one, so it would be nice for this to make the merge
window...

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
