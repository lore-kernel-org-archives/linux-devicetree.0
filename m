From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: pinctrl: Add Broadcom Capri pinctrl driver
Date: Fri, 11 Oct 2013 10:14:29 +0200
Message-ID: <CACRpkdarPC+LxAAezT2LRiz=Y2RduUsb75YYHUgq7HqePzkD3Q@mail.gmail.com>
References: <1380846199-12829-1-git-send-email-syin@broadcom.com>
	<1380846199-12829-4-git-send-email-syin@broadcom.com>
	<CACRpkdZah4fFuJL2Vh5JmbBCgnekg8MKqMWHzeheOx3N1Kzwng@mail.gmail.com>
	<051069C10411E24D9749790C498526FA1BE027EA@SJEXCHMB12.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <051069C10411E24D9749790C498526FA1BE027EA-HXj2mutaA2pgyiERVvb/1Jr/X4hKkxxPpWgKQ6/u3Fg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 11, 2013 at 1:48 AM, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:

>>> +static const struct capri_cfg_param capri_pinconf_params[] = {
>>> +       {"brcm,hysteresis",     CAPRI_PINCONF_PARAM_HYST},
>>> +       {"brcm,pull",           CAPRI_PINCONF_PARAM_PULL},
>>> +       {"brcm,slew",           CAPRI_PINCONF_PARAM_SLEW},
>>> +       {"brcm,input_dis",      CAPRI_PINCONF_PARAM_INPUT_DIS},
>>> +       {"brcm,drive_str",      CAPRI_PINCONF_PARAM_DRV_STR},
>>> +       {"brcm,pull_up_str",    CAPRI_PINCONF_PARAM_PULL_UP_STR},
>>> +       {"brcm,mode",           CAPRI_PINCONF_PARAM_MODE},
>>> +};
>>
>>As well as all this stuff...
>
> OK.  Will see if I can find something suitable for "input disable" and "mode"

Let's discuss this. What exactly does "input disable" and "mode"
mean, in electrical terms?

When you come down to what actually happens it may turn out that
"input disable" is PIN_CONFIG_OUTPUT, which implicitly turns
off input does it not?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
