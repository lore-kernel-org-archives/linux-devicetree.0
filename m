From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Implement the -a option to pad dtb aligned
Date: Fri, 24 Jun 2016 11:41:03 -0700
Message-ID: <576D7EBF.6000507@gmail.com>
References: <1466767161-599-1-git-send-email-timwang@asrmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466767161-599-1-git-send-email-timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wtt_usst-9Onoh4P/yGk@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Tim,

On 06/24/16 04:19, Tim Wang wrote:
> There is one condition that need cat the dtb files
> into one dtb.img which can support several boards
> use same SoC platform.
> 
> And the original dtb file size is not aligned to any base.
> This may cause "Synchronous Abort" when load from a unligned
> address on some SoC machine, such as ARM.
> 
> So this patch implement the -a <aligned number> option to
> pad zero at the end of dtb files and make the dtb size aligned
> to <aligned number>.
> 
> Then, the aligned dtbs can cat together and load without "Synchronous
> Abort".
> 
> Signed-off-by: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
> ---
>  dtc.c      |  9 ++++++++-
>  dtc.h      |  1 +
>  flattree.c | 10 ++++++++++

[ ... ]

The MAINTAINERS file is not very helpful in this case.
You need to send dtc patches to the devicetree-compiler list

  devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Subscription info is at

  http://vger.kernel.org/vger-lists.html#devicetree-compiler

After changes are made by the dtc maintainer, we pull the new
version of dtc into the Linux tree.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
