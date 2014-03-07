From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/7] Watchdog support for Armada 375/38x SoC
Date: Thu, 6 Mar 2014 21:13:46 -0300
Message-ID: <20140307001346.GB13690@arch.cereza>
References: <1393949244-5011-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393949244-5011-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mar 04, Ezequiel Garcia wrote:
> Here's a new patchset adding support for watchdog on Armada 375 and
> Armada 38x SoCs. Regarding the previous patchset, this time we're han=
dling
> the SoCs differences in the watchdog driver itself.
>=20
> The new Armada 375/385 SoCs have two registers for the watchdog RSTOU=
T:
>=20
>  1. It has a dedicated register (similar to the one in A370/XP)
>  2. Also has a bit in a shared RSTOUT register.
>=20
> Therefore, in order to support this two-folded RSTOUT, we extend the =
'reg'
> property in the watchdog devicetree and require a new pair of cells t=
o specify
> the shared RSTOUT.
>=20
> On the driver side, we need to implement per-SoC stop() and enabled()
> functions. Such somewhat complex infrastructure is needed to ensure t=
he driver
> performs proper reset of the watchdog timer, by masking and disabling=
 the
> RSTOUT before the interrupt is enabled.
>=20

JasonG: How does this look now?

Any chance someone gives a Tested-by on Dove/Kirkwood?
--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
