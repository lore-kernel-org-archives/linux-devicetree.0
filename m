From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/1] Drivers: USB: DA8xx MUSB: added DT support
Date: Mon, 8 Feb 2016 14:47:05 +0300
Message-ID: <56B88039.2010103@cogentembedded.com>
References: <1454693676-20211-1-git-send-email-petr@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454693676-20211-1-git-send-email-petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2/5/2016 8:34 PM, Petr Kulhavy wrote:

> TI DA8xx MUSB driver equipped with DeviceTree support.
> Tested with AM1808 board and USB2.0 (OTG) in host mode.
>
> Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
> ---
>   .../devicetree/bindings/usb/da8xx-usb.txt          |  63 ++++++++

    BTW Documentation/devicetree/bindings/submitting-patches.txt tells to 
submit the bindings in a separate patch.

>   drivers/usb/musb/da8xx.c                           | 162 +++++++++++++++++++++
>   include/linux/platform_data/usb-davinci.h          |   3 +-
>   3 files changed, 227 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt

[...]

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
