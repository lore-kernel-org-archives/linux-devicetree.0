From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC/PATCH 1/1] mtd: nand: Add a devicetree binding for ECC
 strength and ECC step size
Date: Tue, 11 Feb 2014 13:08:48 -0300
Message-ID: <20140211160847.GC24205@localhost>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1389960820-18696-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140211141914.GC23150@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA6F815@DBDE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA6F815-yXqyApvAXouIQmiDNMet8wC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Gupta, Pekon" <pekon-l0cyMroinI0@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 11, 2014 at 03:49:24PM +0000, Gupta, Pekon wrote:
> Hi Ezequiel,
>=20
> >From: Ezequiel Garcia [mailto:ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org]
> >> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Docu=
mentation/devicetree/bindings/mtd/nand.txt
> >> index 03855c8..683a310 100644
> >> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> >> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> >> @@ -3,5 +3,9 @@
> >>  - nand-ecc-mode : String, operation mode of the NAND ecc mode.
> >>    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_=
oob_first",
> >>    "soft_bch".
> >>
> Should nand-ecc-mode also be marked as <deprecated>, and but we conti=
nue
> supporting it in kernel code ?

No, I wouldn't deprecate them, as they're in use by the atmel-nand and
mxc-nand drivers.

> If yes, then what is the life-time of these <deprecated> bindings.
> I mean exactly how many kernel versions should
> continue support deprecated bindings ?
>=20

Well, if we ever decide to deprecate a DT binding, I'd say we must keep
backwards compatible forever. Yes, forever.

Or at least, until the last user dies or we can steal his board :-)
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
