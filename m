From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 06/15] watchdog: orion: Remove unneeded BRIDGE_CAUSE
 clear
Date: Thu, 23 Jan 2014 08:54:33 -0300
Message-ID: <20140123115432.GC6065@localhost>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390295561-3466-7-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140121233537.GS18269@obsidianresearch.com>
 <20140122164904.GB27273@localhost>
 <20140122173417.GT18269@obsidianresearch.com>
 <52E02AB6.7040104@gmail.com>
 <20140122205213.GW18269@obsidianresearch.com>
 <52E0591E.6030009@gmail.com>
 <20140123111049.GB6065@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140123111049.GB6065@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Sebastian,

On Thu, Jan 23, 2014 at 08:10:49AM -0300, Ezequiel Garcia wrote:
> On Thu, Jan 23, 2014 at 12:49:50AM +0100, Sebastian Hesselbarth wrote=
:
> [..]
> > > Notice that Ezequiel has added an IRQ handler that just calls pan=
ic,
> > > so a spurious interrupt call is VERY VERY BAD.
> >=20
> > And I understand that he now clears watchdog's register before
> > requesting an irq. All that is missing is bridge_irq driver clearin=
g
> > CAUSE register after masking all irqs, right?
> >=20
>=20
> Are you sure clearing the CAUSE register after masking the IRQs will =
be enough?
>=20
> AFAICS, until now nobody unmasks the watchdog IRQ (at least the orion=
_wdt
> driver didn't request the interruption) but *still* the CAUSE registe=
r is set
> upon watchdog expiration. So I would guessed a masked interrupt still=
 raises a
> bit in the CAUSE register.
>=20

Let me add some real information instead of my speculations. Taken from
the Kirkwood specification:

Table 136: Mbus-L to Mbus Bridge Interrupt Mask Register
Offset:		0x00020114
=46ield: 		Mask
Type/InitVal: 	RW 0x0
Description:	There is a mask bit per each cause bit. Mask only affects =
the
		assertion of interrupt pins. It does not affect the setting of
		bits in the Cause register.

So I guess this is why Jason has been insisting with the introduction o=
f
the irq_startup.

(Just for reference, the little patch I attached yesterday proved to wo=
rk here.)
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
