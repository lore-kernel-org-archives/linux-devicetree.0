From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 33/54] MAINTAINERS: Add file patterns for wireless device tree bindings
Date: Mon, 23 May 2016 14:25:43 +0300
Message-ID: <87k2il9ft4.fsf@kamboji.qca.qualcomm.com>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
	<1463907991-7916-34-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-34-git-send-email-geert@linux-m68k.org> (Geert
	Uytterhoeven's message of "Sun, 22 May 2016 11:06:10 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: linux-wireless@vger.kernel.org
> ---
> Please apply this patch directly if you want to be involved in device
> tree binding documentation for your subsystem.
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a9f1138131afcf1..604d5d4230406094 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8023,6 +8023,7 @@ Q:	http://patchwork.kernel.org/project/linux-wireless/list/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers.git
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next.git
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/net/wireless/
>  F:	drivers/net/wireless/
>  
>  NETXEN (1/10) GbE SUPPORT

A good idea, thanks. I'll apply this once I open wireless-drivers-next,
sometime after the merge window closes.

-- 
Kalle Valo
