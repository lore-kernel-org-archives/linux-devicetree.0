From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Query on DT overlay support.
Date: Thu, 23 Mar 2017 13:32:24 -0500
Message-ID: <CAL_JsqL97FvXKc4ZjG5B28tpe=9CvvSY9+zgE7iN8moOz2OHVQ@mail.gmail.com>
References: <C89496FEAE474D468F30D558A9468D9F26D7986C@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C89496FEAE474D468F30D558A9468D9F26D7986C-4lKfpRxZ5enZMOc0yg5rMog+Gb3gawCHQz34XiSyOiE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nava kishore Manne <nava.manne-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Srinivas Goud <sgoud-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 23, 2017 at 8:22 AM, Nava kishore Manne
<nava.manne-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
>
>
>                 This mail is regarding the DT overlay support in the Linux
> kernel
>
>                 I am able to make the device-tree overlay work out of box by
> using my own dtc complier (I mean I used the dtc compiler
>
>                 Available here
> http://www.embedded-things.com/bbb/patching-the-device-tree-compiler-for-ubuntu/
> )
>
>                 When can I expect the same changes in the scripts/dtc in
> mainline????
>
>                 In case of any support needed for testing I can help on
> testing the same I works in Xilinx and we had a lot of combinations to test
> overlay J

It's already there. Landed in 4.11.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
