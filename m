From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH] of: Add prompt for OF_OVERLAY config
Date: Sun, 15 Feb 2015 21:00:08 +0100
Message-ID: <1424030408.9418.106.camel@x220>
References: <1424013767-25522-1-git-send-email-matwey@sai.msu.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424013767-25522-1-git-send-email-matwey@sai.msu.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: "Matwey V. Kornilov" <matwey@sai.msu.ru>
Cc: grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 2015-02-15 at 18:22 +0300, Matwey V. Kornilov wrote:
> Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
> ---
>  drivers/of/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index b5e0c87..fdca685 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -85,7 +85,7 @@ config OF_RESOLVE
>  	bool
>  
>  config OF_OVERLAY
> -	bool
> +	bool "Device Tree overlays"
>  	depends on OF
>  	select OF_DYNAMIC
>  	select OF_RESOLVE

Is this a bugfix (for the bug that OF_OVERLAY can't yet actually be set
to 'y') or not? Perhaps a commit explanation would have answered that
question.

By the way, "depends on OF" is superfluous (the enclosing menu already
depends on OF).


Paul Bolle
