Return-Path: <SRS0=+NEg=TK=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH v2 08/15] usb: renesas_usbhs: move flags macros
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-9-chris.brandt@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c57f8a55-ef94-5b28-9345-88805de52ed1@cogentembedded.com>
Date: Fri, 10 May 2019 11:41:38 +0300
MIME-Version: 1.0
In-Reply-To: <20190509201142.10543-9-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 09.05.2019 23:11, Chris Brandt wrote:

> Move flags macros to header file so they can be used by other files.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>   drivers/usb/renesas_usbhs/common.c |  7 -------
>   drivers/usb/renesas_usbhs/common.h | 10 ++++++++++
>   2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> index 249fbee97f3f..efb26ffd9809 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -44,13 +44,6 @@
>    */
>   
>   
> -#define USBHSF_RUNTIME_PWCTRL	(1 << 0)
> -
> -/* status */
> -#define usbhsc_flags_init(p)   do {(p)->flags = 0; } while (0)
> -#define usbhsc_flags_set(p, b) ((p)->flags |=  (b))
> -#define usbhsc_flags_clr(p, b) ((p)->flags &= ~(b))
> -#define usbhsc_flags_has(p, b) ((p)->flags &   (b))
>   

    Why leave 3 empty lines?

>   /*
>    * platform call back
[...]

MBR, Sergei
