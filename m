From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: dt_to_config, use full path for dtx_diff
Date: Mon, 18 Jul 2016 17:18:03 -0500
Message-ID: <CAL_JsqKUFR4uX24rV3hoYCEEZ-osDvycM12v1ome3-R3jNORZw@mail.gmail.com>
References: <576DD6B9.2040303@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <576DD6B9.2040303-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 24, 2016 at 7:56 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>
> Do not require dtx_diff to be in $PATH.
>
> dt_to_config already needs to be run from the root directory of a kernel
> tree so use scripts/dtc/dtx_diff instead of dtx_diff.

Okay, now I get a bit further. I get this message even if I set my
.config file on the command line:

grep: ./.config: No such file or directory

The config format still doesn't make sense to me. I'm running this on
highbank.dts, and I get mostly options that are not relevant to
highbank.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
