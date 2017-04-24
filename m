From: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/4] dt-bindings: mtd: make partitions doc a bit more generic
Date: Mon, 24 Apr 2017 17:28:54 +0200
Message-ID: <CAOiHx=mHvuWM8Ww1+GD621c1AgAU0BNoGG-=1BgRxEVnTj8wLQ@mail.gmail.com>
References: <20170420135731.13272-2-zajec5@gmail.com> <20170424124120.31613-1-zajec5@gmail.com>
 <20170424124120.31613-2-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170424124120.31613-2-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 24 April 2017 at 14:41, Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
> From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Currently the only documented partitioning is "fixed-partitions" but
> there are more methods in use that we may want to support in the future.
> Mention them and make it clear Fixed Partitions are just a single case.
>
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> This is based on Brian's patch:
> [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding
>
> V1: Dropped "Section B: On-Flash Partition Tables" with Google's FMAP as =
this
>     patchset doesn't add that new parser.
> V2: Add "We currently only document a binding for fixed layouts." part
> ---
>  .../devicetree/bindings/mtd/partition.txt          | 30 ++++++++++++++++=
+-----
>  1 file changed, 24 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Docume=
ntation/devicetree/bindings/mtd/partition.txt
> index 81a224da63be..b5de311b967a 100644
> --- a/Documentation/devicetree/bindings/mtd/partition.txt
> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> @@ -1,29 +1,47 @@
> -Representing flash partitions in devicetree
> +Flash partitions in device tree
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>
> -Partitions can be represented by sub-nodes of an mtd device. This can be=
 used
> +Flash devices can be partitioned into one or more functional ranges (e.g=
. "boot
> +code", "nvram", "kernel").
> +
> +Different devices may be partitioned in a different ways. Some may use a=
 fixed
> +flash layout set at production time. Some may use on-flash table that de=
scribes
> +the geometry and naming/purpose of each functional region. It is also po=
ssible
> +to see these methods mixed.
> +
> +To assist system software in locating partitions, we provide a binding t=
o
> +describe which method is used for a given flash.

Since patch 3 adds specifying methods through the compatible of the
partitions subnode, maybe we should document that here? Something
along

"To assist system software in locating partitions, we allow describing
which method is used for a given flash device. To describe the method
there should be a subnode of the flash device that is named
'partitions'. It must have a 'compatible' property, which is used to
identify the method to use."


Regards
Jonas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
