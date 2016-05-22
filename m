From: Eli Billauer <eli.billauer@gmail.com>
Subject: Re: [PATCH 54/54] MAINTAINERS: Add file patterns for xillybus device
 tree bindings
Date: Sun, 22 May 2016 12:13:59 +0300
Message-ID: <57417857.4010000@gmail.com>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
 <1463907991-7916-55-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; CHARSET=US-ASCII; format=flowed
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1463907991-7916-55-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Thanks. However I don't have a repo of my own to apply this on.

Acked-by: Eli Billauer <eli.billauer@gmail.com>

On 22/05/16 12:06, Geert Uytterhoeven wrote:
> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.
>
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>
> Cc: Eli Billauer<eli.billauer@gmail.com>
> Cc: linux-kernel@vger.kernel.org
> ---
> Please apply this patch directly if you want to be involved in device
> tree binding documentation for your subsystem.
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f580d72f412df230..d461ad734e441554 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12669,6 +12669,7 @@ XILLYBUS DRIVER
>   M:	Eli Billauer<eli.billauer@gmail.com>
>   L:	linux-kernel@vger.kernel.org
>   S:	Supported
> +F:	Documentation/devicetree/bindings/xillybus/
>   F:	drivers/char/xillybus/
>
>   XTENSA XTFPGA PLATFORM SUPPORT
>    
