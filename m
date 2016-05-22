From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 45/54] MAINTAINERS: Add file patterns for staging iio
 device tree bindings
Date: Sun, 22 May 2016 20:42:08 +0100
Message-ID: <9b7f6db5-2acb-5093-d30f-2eebee796abc@kernel.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
 <1463907991-7916-46-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-46-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 22/05/16 10:06, Geert Uytterhoeven wrote:
> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: linux-iio@vger.kernel.org
Applied - thanks.

Jonathan
> ---
> Please apply this patch directly if you want to be involved in device
> tree binding documentation for your subsystem.
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f11355314880838b..5c96827ea93d5d7c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10867,6 +10867,7 @@ STAGING - INDUSTRIAL IO
>  M:	Jonathan Cameron <jic23@kernel.org>
>  L:	linux-iio@vger.kernel.org
>  S:	Odd Fixes
> +F:	Documentation/devicetree/bindings/staging/iio/
>  F:	drivers/staging/iio/
>  
>  STAGING - LIRC (LINUX INFRARED REMOTE CONTROL) DRIVERS
> 
