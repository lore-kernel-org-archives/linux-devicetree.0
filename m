From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/4] Allow to specify an ECC scheme through DT
Date: Mon, 14 Apr 2014 11:56:22 -0300
Message-ID: <20140414145622.GA9294@arch>
References: <1395401690-25221-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140401100417.GI27979@kw.sim.vm.gnt>
 <20140403151941.GA21114@arch.cereza>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140403151941.GA21114-nAQHv47ARr+vIlHkl8J1cg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Guinot <simon.guinot-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Simon Guinot <sguinot-D+JDLXUtGQkAvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Apr 03, Ezequiel Garcia wrote:
> On Apr 01, Simon Guinot wrote:
> > On Fri, Mar 21, 2014 at 08:34:46AM -0300, Ezequiel Garcia wrote:
> > > Now that we have agreed on the ECC devicetree binding, here's a p=
atchset
> > > that makes pxa3xx-nand driver use it.
> > >=20
> > > This work is required on platforms where the flash device reports=
 a required
> > > ECC strength, but that are capable of handling a stronger one. Si=
mon Guinot
> > > reported a situation where the vendor provided a bootloader confi=
gured with
> > > a stronger than required ECC scheme. Without this patches, such a=
 situation
> > > would require a hack to make the driver use a specific ECC scheme=
=2E
> > >=20
> > > (Simon: it would be great if you can confirm this allows you to r=
emove any hacks).
> >=20
> > Hi Ezequiel,
> >=20
> > I confirm this allows me to configure the ECC strength and step siz=
e
> > from DT.
> >=20
> > Tested-by: Simon Guinot <simon.guinot-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>
> >=20
>=20
> Thanks a lot for the test.
>=20
> Brian, any comments?

Any chance this can be applied?
--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
