From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC/PATCH 1/1] mtd: nand: =?utf-8?Q?A?=
 =?utf-8?Q?dd_a_devicetree_binding_for_ECC_strength_and_ECC_step_size?=
 =?utf-8?B?w6c=?=
Date: Wed, 12 Feb 2014 14:32:22 -0300
Message-ID: <20140212173221.GA2964@localhost>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1389960820-18696-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140212080014.GC3500@norris-Latitude-E6410>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140212080014.GC3500@norris-Latitude-E6410>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Pekon Gupta <pekon-l0cyMroinI0@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 12, 2014 at 12:00:14AM -0800, Brian Norris wrote:
> Hi Ezequiel,
>=20
> On Fri, Jan 17, 2014 at 09:13:40AM -0300, Ezequiel Garcia wrote:
> > Some flashes can only be properly accessed when the ECC mode is
> > specified, and a way to describe such mode is required.
> >=20
> > Such ECC mode is completely driver-specific so instead of having on=
e binding
> > per compatible-string, let's add generic ECC strength and ECC step =
size.
> > Driver's can choose the appropriate ECC mode, based on this specifi=
cation.
> >=20
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mtd/nand.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Docum=
entation/devicetree/bindings/mtd/nand.txt
> > index 03855c8..683a310 100644
> > --- a/Documentation/devicetree/bindings/mtd/nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> > @@ -3,5 +3,9 @@
> >  - nand-ecc-mode : String, operation mode of the NAND ecc mode.
> >    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_o=
ob_first",
> >    "soft_bch".
> > +- nand-ecc-strength : integer ECC required strength.
> > +- nand-ecc-size : integer step size associated to the ECC strength=
=2E
>=20
> Probably should be nand-ecc-step-size, to be clearer.
>=20

No problem.

> > +  The exact meaning of the ECC strength and ECC size parameters is=
 completely
> > +  driver-specific.
>=20
> I think we can be much more specific than this. We need to at least
> describe how the strength and size are related, and we need to mentio=
n
> how this represents the ECC scheme to use, rather than the minimum
> requirement of the flash.
>=20
> I'd say something like this. Feel free to improve it, but it covers t=
he
> gist of what I think we can say in a generic document:
>=20
>  - nand-ecc-strength: integer representing the number of bits to corr=
ect
>    per ECC step
>  - nand-ecc-step-size: integer representing the number of data bytes
>    that are covered by a single ECC step
>=20
>    Together, the ECC strength and step size define the correction
>    capability, so that we say we will correct "X bit errors per Y
>    bytes". The interpretation of these parameters is
>    implementation-defined, but they often have ramifications on the
>    formation, interpretation, and placement of correction metadata on
>    the flash. Not all implementations must support all possible
>    combinations. Implementations are encouraged to further define the
>    value(s) they support.
>=20

Much better, thanks!
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
