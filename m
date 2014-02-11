From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC/PATCH 1/1] mtd: nand: Add a devicetree binding for ECC
 strength and ECC step size
Date: Tue, 11 Feb 2014 11:19:15 -0300
Message-ID: <20140211141914.GC23150@localhost>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1389960820-18696-2-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389960820-18696-2-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Pekon Gupta <pekon-l0cyMroinI0@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 17, 2014 at 09:13:40AM -0300, Ezequiel Garcia wrote:
> Some flashes can only be properly accessed when the ECC mode is
> specified, and a way to describe such mode is required.
>=20
> Such ECC mode is completely driver-specific so instead of having one =
binding
> per compatible-string, let's add generic ECC strength and ECC step si=
ze.
> Driver's can choose the appropriate ECC mode, based on this specifica=
tion.
>=20
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documen=
tation/devicetree/bindings/mtd/nand.txt
> index 03855c8..683a310 100644
> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> @@ -3,5 +3,9 @@
>  - nand-ecc-mode : String, operation mode of the NAND ecc mode.
>    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob=
_first",
>    "soft_bch".
> +- nand-ecc-strength : integer ECC required strength.
> +- nand-ecc-size : integer step size associated to the ECC strength.
> +  The exact meaning of the ECC strength and ECC size parameters is c=
ompletely
> +  driver-specific.
>  - nand-bus-width : 8 or 16 bus width if not present 8
>  - nand-on-flash-bbt: boolean to enable on flash bbt option if not pr=
esent false
> --=20
> 1.8.1.5
>=20

Brian, do you agree (as MTD maintainer) with this new binding?

Can we get any Acks from a devicetree binding maintainer? Grant has alr=
eady
given his (informal) approval [1], but I'd rather have a formal ack fro=
m
binding maintainer.

Once this binding gets accepted, I'll submit an of_helper patch, and a =
patch
for pxa3xx-nand to use it.

[1] http://www.spinics.net/lists/devicetree/msg20534.html
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
