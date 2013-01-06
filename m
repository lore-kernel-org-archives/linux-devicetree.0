From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: sunxi: Add pinctrl driver for Allwinner SoCs
Date: Mon, 7 Jan 2013 00:46:10 +0100
Message-ID: <CACRpkdYpnfWmo15vtUsvPobhFO3_wvYgaa04Mpa6QjWx2h+ezA@mail.gmail.com>
References: <1355948295-19680-1-git-send-email-maxime.ripard@free-electrons.com>
 <1355948295-19680-2-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355948295-19680-2-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alejandro Mery <amery-7FTFmhZxc5Q@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 19, 2012 at 9:18 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> The Allwinner SoCs have an IP module that handle both the muxing and the
> GPIOs.

Sorry for very slow review :-( :-(

>  include/linux/pinctrl/pinconf-generic.h            |    1 +

Can you break this into a separate patch and rebase it?

It does not apply anymore after v3.8...

> diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
> index 4f0abb9..5f5968d 100644
> --- a/include/linux/pinctrl/pinconf-generic.h
> +++ b/include/linux/pinctrl/pinconf-generic.h
> @@ -74,6 +74,7 @@ enum pin_config_param {
>         PIN_CONFIG_DRIVE_PUSH_PULL,
>         PIN_CONFIG_DRIVE_OPEN_DRAIN,
>         PIN_CONFIG_DRIVE_OPEN_SOURCE,
> +       PIN_CONFIG_DRIVE_CURRENT,
>         PIN_CONFIG_INPUT_SCHMITT,
>         PIN_CONFIG_INPUT_DEBOUNCE,
>         PIN_CONFIG_POWER_SOURCE,

Above the definitions there is some kerneldoc and that is where this has to be
defined.

You also have to defines what the argument to this parameter is.

I think it should be renamed PIN_CONFIG_DRIVE_STRENGTH and the
argument should be the number of drivers stages.

These things are constructed with totem-pole-like outputs and the number
of totempoles define the drive strength, usually it will be something like

1 = 2mA
2 = 4mA
3 = 6mA
4 = 8mA

or similar, as you see 2 mA for each added driver stage. The driver can
convert to any internal representation...

Yours,
Linus Walleij
