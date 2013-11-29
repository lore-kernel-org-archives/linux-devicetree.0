From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 14/36] mtd: st_spi_fsm: Add device-tree binding documentation
Date: Fri, 29 Nov 2013 20:07:11 +0100
Message-ID: <CACRpkdaWXBchz78Yby11VpveBDtn6FrmupS=cnNYhvHgFJsBUw@mail.gmail.com>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
	<1385727565-25794-15-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385727565-25794-15-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, angus.clark-qxv4g6HH51o@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 29, 2013 at 1:19 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

Re this:

> +Optional properties:
> +  - st,syscfg          : Phandle to boot-device system configuration registers
> +  - st,boot-device-reg : Address of the aforementioned boot-device register(s)
> +  - st,boot-device-spi : Expected boot-device value if booted via this device
> +
> +Example:
> +       spifsm: spifsm@fe902000{
> +               compatible         = "st,spi-fsm";
> +               reg                =  <0xfe902000 0x1000>;
> +               reg-names          = "spi-fsm";
> +               pinctrl-0          = <&pinctrl_fsm>;
> +               st,syscfg          = <&syscfg_rear>;
> +               st,boot-device-reg = <0x958>;
> +               st,boot-device-spi = <0x1a>;

I don't think we should encode any register offsets whatsoever in device
tree but maybe that's just me. (Yes, Stephen will beat me up about
pin control single, but I consider that a special case.)

I would just put the last two things as #defines into the driver file(s)
or - if it's related to other syscfg registers and varies with SoC incarnation,
as a #define in a shared header for that syscfg thing.

The syscfg phandle is elegant though, really like that.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
