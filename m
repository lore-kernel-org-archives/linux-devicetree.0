From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 07/18] watchdog: orion: Handle IRQ
Date: Sun, 26 Jan 2014 10:14:46 -0300
Message-ID: <20140126131445.GA14713@localhost>
References: <1390431915-5115-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390431915-5115-8-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140126090412.37f4932f@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140126090412.37f4932f@skate>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 26, 2014 at 09:04:12AM +0100, Thomas Petazzoni wrote:
> Dear Ezequiel Garcia,
>=20
> On Wed, 22 Jan 2014 20:05:04 -0300, Ezequiel Garcia wrote:
> > DT-enabled where an irqchip driver for the brigde interrupt control=
ler is
> > available can handle the watchdog IRQ properly. Therefore, we reque=
st
> > the interruption and add a dummy handler that merely calls panic().
>=20
> I don't quiite understand the first sentence of this commit log, and
> the commit title looks wrong. Maybe a bad copy/paste or something?
>=20

Hm... yes it doesn't look right. It should read:

"DT-enabled platforms, where the irqchip driver for the brigde interrup=
t
controller is available, can handle the watchdog IRQ properly. Therefor=
e,
we request the interrupt and add a dummy handler that merely calls pani=
c()".

I guess we can re-phrase it be a bit more readable.

Why does th commit title looks wrong? By requesting the IRQ we are
"handling it", no?

> >=20
> > This is done in order to have an initial 'ack' of the interruption,
>=20
> interruption -> interrupt
>=20

Right.

--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
