From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: linux-4.4-rc3/scripts/dtc/libfdt/fdt.c:88: code that relies on
 undefined behaviour ?
Date: Thu, 17 Mar 2016 17:57:50 -0500
Message-ID: <CAL_Jsq+gEpp+O_Q-k15kyyPuoQQhLVenRhhRMmQCdC_jg5-60Q@mail.gmail.com>
References: <DUB128-W60BE88653C27C6610D81059C000@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DUB128-W60BE88653C27C6610D81059C000-MsuGFMq8XAE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Binderman <dcb314-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+devicetree-compiler list

On Mon, Nov 30, 2015 at 12:02 PM, David Binderman <dcb314-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
> Hello there,
>
> [linux-4.4-rc3/scripts/dtc/libfdt/fdt.c:88]: (warning) Invalid test for overflow 'p+len<p'. Condition is always false unless there is overflow, and overflow is UB.

Upstream dtc needs to be fixed first. Patches welcome.

>
> Source code is
>
>     if (p + len < p)
>         return NULL;
>
> Suggest code rework.
>
> Regards
>
> David Binderman
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
