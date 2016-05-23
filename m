From: Laura Abbott <labbott@redhat.com>
Subject: Re: [PATCH 01/54] MAINTAINERS: Add file patterns for ion device tree
 bindings
Date: Mon, 23 May 2016 15:48:42 -0700
Message-ID: <8c5ca549-c341-4174-3d91-c546b9802274@redhat.com>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
 <1463907991-7916-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-2-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>, devel@driverdev.osuosl.org
List-Id: devicetree@vger.kernel.org

On 05/22/2016 02:05 AM, Geert Uytterhoeven wrote:
> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Laura Abbott <labbott@redhat.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: devel@driverdev.osuosl.org
> ---
> Please apply this patch directly if you want to be involved in device
> tree binding documentation for your subsystem.
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 283f35b6be6907f5..6b4b2447589f36fa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -781,6 +781,7 @@ M:	Laura Abbott <labbott@redhat.com>
>  M:	Sumit Semwal <sumit.semwal@linaro.org>
>  L:	devel@driverdev.osuosl.org
>  S:	Supported
> +F:	Documentation/devicetree/bindings/staging/ion/
>  F:	drivers/staging/android/ion
>  F:	drivers/staging/android/uapi/ion.h
>  F:	drivers/staging/android/uapi/ion_test.h
>

This is kind of in flux but I'd rather be cc'ed if anyone tries to add
new items so

Acked-by: Laura Abbott <labbott@redhat.com>
