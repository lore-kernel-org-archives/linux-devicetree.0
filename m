From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: dtx_diff, redirects stderror to /dev/null
Date: Tue, 19 Jul 2016 15:19:45 -0500
Message-ID: <CAL_JsqK7v_9Lko17u4aqT99MiLoJkJAdJN3PiuLJf-1rppBs9Q@mail.gmail.com>
References: <1468943648-5778-1-git-send-email-gaurav.minocha.os@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468943648-5778-1-git-send-email-gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 19, 2016 at 10:54 AM, Gaurav Minocha
<gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> scripts/dtc/dtx_diff searches CONFIG_DTC=y in .config,
> but it doesn't checks whether the file exists or not.
>
> So, this patch redirects the error in grep to /dev/null
>
> Tested script with and without .config file.
>
>>/scripts/dtc/dtx_diff test.dts
>
> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

I have not applied any of these yet. Please squash all 3 into the
first commit and resend.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
