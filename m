From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/7] Watchdog support for Armada 375/38x SoC
Date: Wed, 12 Mar 2014 18:12:43 -0300
Message-ID: <20140312211243.GA1853@arch.cereza>
References: <1393949244-5011-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140307001346.GB13690@arch.cereza>
 <20140311214525.GA3564@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140311214525.GA3564-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mar 11, Jason Gunthorpe wrote:
> On Thu, Mar 06, 2014 at 09:13:46PM -0300, Ezequiel Garcia wrote:
>=20
> > > On the driver side, we need to implement per-SoC stop() and enabl=
ed()
> > > functions. Such somewhat complex infrastructure is needed to ensu=
re the driver
> > > performs proper reset of the watchdog timer, by masking and disab=
ling the
> > > RSTOUT before the interrupt is enabled.
>=20
> > JasonG: How does this look now?
>=20
> A cursory look seems reasonable..
>=20

Good.

> > Any chance someone gives a Tested-by on Dove/Kirkwood?
>=20
> If you have a git I can pull I can try it here.
>=20

I've just posted a v3 for this series together with a branch:

https://github.com/MISL-EBU-System-SW/mainline-public/tree/wdt_a385_a37=
5_v3

Thanks!
--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
