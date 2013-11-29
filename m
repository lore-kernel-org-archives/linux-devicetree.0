From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of_mtd: Fix header file include guard
Date: Fri, 29 Nov 2013 00:11:13 -0800
Message-ID: <20131129081113.GA20013@norris.computersforpeace.net>
References: <52972EEE.8070704@xse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52972EEE.8070704-wIELUdCntIg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Rosenberger, Philipp" <Philipp.Rosenberger-wIELUdCntIg@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+ device tree guys

Hi Grant/Rob,

It looks like this header is technically owned by you guys. Once we hav=
e
a proper submission, should I merge this sort of change through MTD, or
do one of you want to take care of it?

Hi Philpp,

Thanks for the patch! There are a few things to fix up though.

On Thu, Nov 28, 2013 at 11:53:39AM +0000, Rosenberger, Philipp wrote:
> It seems the include guard was copied from of_net.h.

Good catch.

Note that all patches require a "Signed-off-by" line in the patch
description, to signify (among other things) that this is your work and
that you are submitting it under the GPLv2 license. See
Documentation/SubmittingPatches (esp. point 12).

> ---
>  include/linux/of_mtd.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
> index 6f10e93..cb32d9c 100644
> --- a/include/linux/of_mtd.h
> +++ b/include/linux/of_mtd.h
> @@ -7,7 +7,7 @@
>   */
>=20
>  #ifndef __LINUX_OF_MTD_H
> -#define __LINUX_OF_NET_H
> +#define __LINUX_OF_MTD_H
>=20
>  #ifdef CONFIG_OF_MTD
>=20
> -- 1.7.9.5
>=20
> XS Embedded GmbH
> Peterzeller Strasse 8
> D-78048 Villingen - Schwenningen
>=20
> Telefon +49 (7721) 4060 - 428
> Fax     +49 (7721) 4060 - 499
>=20
> www.xse.de
> Philipp.Rosenberger-wIELUdCntIg@public.gmane.org
>=20
> :::::::::: based.on.visions ::::::::::
>=20
>=20
> XS Embedded GmbH
> Gesch=E4ftsf=FChrung: Michael Maier, Rainer Oder
>=20
> Handelsregister: Amtsgericht Freiburg i.Br., HRB 705237
> Sitz der Gesellschaft: Peterzeller Strasse 8, 78048 Villingen-Schwenn=
ingen
> USt-Id Nummer: DE268786819
>=20
> Confidentiality Notice: This e-mail message, including any attachment=
s, is for the sole use of the intended recipient(s) and may contain con=
fidential and privileged information. Any unauthorized review, use, dis=
closure or distribution is prohibited. If you are not the intended reci=
pient, please contact the sender by return e-mail and destroy all copie=
s of the original message.

This confidentiality notice is incongruous with sending patches to a
public mailing list, for inclusion in an open source project. This
message (combined with a lack of a Signed-off-by) means we cannot take
your patch. Please remove this footer and resubmit, with a CC to
linux-mtd-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org and devicetree-u79uwXL29TaiAVqoAR/hOA@public.gmane.org

Thanks,
Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
