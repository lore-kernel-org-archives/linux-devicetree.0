From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] pinctrl: phandle entries will be applied sequentially
Date: Wed, 9 Oct 2013 14:45:29 +0100
Message-ID: <20131009134529.GH25034@n2100.arm.linux.org.uk>
References: <1381297324-19006-1-git-send-email-shawn.guo@linaro.org> <CACRpkdazPK6SNg9PdWCrjB8nwho1rCueumJWAN=STXdN1zNnMA@mail.gmail.com> <20131009124425.GG25034@n2100.arm.linux.org.uk> <CACRpkda3J4cCTnFaQFrmZ=box6EeJ8WQZpuQpi2p_BFX+W2vuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda3J4cCTnFaQFrmZ=box6EeJ8WQZpuQpi2p_BFX+W2vuw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 09, 2013 at 03:09:21PM +0200, Linus Walleij wrote:
> It's more like the pin control core is passing the array of settings
> to the driver and the behaviour is specified per-driver.
> 
> So that is from the kernels point of view, no matter whether
> device tree is used or not. A specific driver may instill specific
> behaviour - sequential or not.

Right, so that means doing this:

                        pinctrl_usdhc1_1: usdhc1grp-1 {
                                fsl,pins = <
...
                                        MX6QDL_PAD_SD1_DAT3__SD1_DATA3 0x17059
...
                                >;
                        };

                        pinctrl_usdhc1_1_dat3cd: usdhc1grp-3 {
                                fsl,pins = <
                                        MX6QDL_PAD_SD1_DAT3__SD1_DATA3 0x13059
                                >;
                        };

and then:

	pinctrl-0 = <&pinctrl_usdhc1_1 &pinctrl_usdhc1_1_dat3cd>;

can result in either "MX6QDL_PAD_SD1_DAT3__SD1_DATA3 0x17059" or
"MX6QDL_PAD_SD1_DAT3__SD1_DATA3 0x13059" being the final configuration
for that pin.

What that means is that for any pinctrl setting, pins to be configured
must be mentioned exactly once and once only.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
