From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] checkpatch: struct of_device_id should usually be const
Date: Wed, 10 Sep 2014 00:23:17 -0700
Message-ID: <1410333797.24028.29.camel@joe-AO725>
References: <1410333346-29062-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410333346-29062-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-09-10 at 09:15 +0200, Uwe Kleine-K=F6nig wrote:
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -4941,6 +4941,7 @@ sub process {
>  				mtrr_ops|
>  				neigh_ops|
>  				nlmsvc_binding|
> +				of_device_id|
>  				pci_raw_ops|
>  				pipe_buf_operations|
>  				platform_hibernation_ops|

=46ine by me, there are ~1200 or so const uses.

There are also ~350 of these that are not const.

Are most all of those supposed to be const?

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
