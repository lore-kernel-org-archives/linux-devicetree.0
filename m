From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 4/9] pinctrl: sunxi: add support for the
 Allwinner H6 main pin controller
Date: Fri, 16 Mar 2018 17:07:28 +0000
Message-ID: <a74d898f-7047-eebf-027e-106c40be2b9d@arm.com>
References: <20180316140215.28663-1-icenowy@aosc.io>
 <20180316140215.28663-5-icenowy@aosc.io>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBYXTV7KQKGQERW4VYSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180316140215.28663-5-icenowy-h8G6r0blFSE@public.gmane.org>
Content-Language: en-GB
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 16/03/18 14:02, Icenowy Zheng wrote:
> The Allwinner H6 SoC has two pin controllers, one main controller
> (called CPUX-PORT in user manual) and one controller in CPUs power
> domain (called CPUS-PORT in user manual).
> 
> This commit introduces support for the main pin controller on H6.
> 
> The pin bank A and B are not wired out and hidden from the SoC's
> documents, however it's shown that the "ATE" (an AC200 chip
> co-packaged with the H6 die) is connected to the main SoC die via these
> pin banks. The information about these banks is just copied from the BSP
> pinctrl driver, but re-formatted to fit the mainline pinctrl driver
> format. The GPIO functions are dropped, as they're impossible to use --
> except a GPIO&IRQ only pin (PB20) which might be the IRQ of ATE.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

As mentioned before, I checked every single pin against the manual and
this looks correct to me.

Reviewed-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Thanks!
Andre.
