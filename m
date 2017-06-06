From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 4/6] dt-bindings: display: stm32: remove
 st-display-subsystem parent node requirement
Date: Tue, 6 Jun 2017 10:02:45 +0200
Message-ID: <0e3438c7-2a8d-fda8-ef07-017ddd881955@baylibre.com>
References: <1496414235-20098-1-git-send-email-philippe.cornu@st.com>
 <1496414235-20098-5-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496414235-20098-5-git-send-email-philippe.cornu-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Yao <mark.yao@rock-chips.>
Cc: Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Philippe,

On 06/02/2017 04:37 PM, Philippe CORNU wrote:
> There is no need anymore to have a "st-display-subsystem" parent node
> in the device tree for the ltdc.
> 
> Signed-off-by: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/display/st,stm32-ltdc.txt | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
> index 8e14769..90a8459 100644
> --- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
> +++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
> @@ -1,7 +1,6 @@
>  * STMicroelectronics STM32 lcd-tft display controller
>  
>  - ltdc: lcd-tft display controller host
> -  must be a sub-node of st-display-subsystem

Please fix alignment here.

>    Required properties:
>    - compatible: "st,stm32-ltdc"
>    - reg: Physical base address of the IP registers and length of memory mapped region.
> 

Apart from that :
Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
