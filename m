From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 0/9] Watchdog support for Armada 375/38x SoC
Date: Mon, 17 Mar 2014 17:47:06 -0300
Message-ID: <20140317204706.GB1118@arch.cereza>
References: <1394907484-26002-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <532748C2.9030009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <532748C2.9030009-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mar 17, Sebastian Hesselbarth wrote:
> On 03/15/2014 07:17 PM, Ezequiel Garcia wrote:
> >Fourth round of the patchset adding support for watchdog on Armada 3=
75 and
> >Armada 38x SoCs.
> >
> >The new Armada 375/385 SoCs have two registers for the watchdog RSTO=
UT:
> >
> >  1. It has a dedicated register (similar to the one in A370/XP)
> >  2. Also has a bit in a shared RSTOUT register.
> >
> >Therefore, in order to support this two-folded RSTOUT, we extend the=
 'reg'
> >property in the watchdog devicetree and require a new pair of cells =
to specify
> >the shared RSTOUT.
> >
> >On the driver side, we need to implement per-SoC stop() and enabled(=
)
> >functions. Such somewhat complex infrastructure is needed to ensure =
the driver
> >performs proper reset of the watchdog timer, by masking and disablin=
g the
> >RSTOUT before the interrupt is enabled.
> >
> >I've pushed a branch so people can test this easily, e.g. ensuring
> >no regressions on Dove, Kirkwood and A370/XP:
>=20
> Ezequiel,
>=20
> Although, I just saw below that you actually already tested on Dove,
> you can add my
>=20
> Tested-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20

Great, thanks!
--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
