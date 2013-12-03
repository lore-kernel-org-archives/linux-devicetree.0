From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 14/36] mtd: st_spi_fsm: Add device-tree binding documentation
Date: Tue, 3 Dec 2013 13:22:37 +0100
Message-ID: <CACRpkdYdW+p4-sDNCr8L75YB+e6agiQfvfEX5V+wCs4iZUaKSQ@mail.gmail.com>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
	<1385727565-25794-15-git-send-email-lee.jones@linaro.org>
	<CACRpkdaWXBchz78Yby11VpveBDtn6FrmupS=cnNYhvHgFJsBUw@mail.gmail.com>
	<20131202110304.GB31626@lee--X1>
	<CACRpkdb8=RRsNRKe4Nbefu2BJ4xHakmNjxFC1gwLea=bAmOz-A@mail.gmail.com>
	<20131203113156.GB12031@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131203113156.GB12031@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, angus.clark-qxv4g6HH51o@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 3, 2013 at 12:31 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, 03 Dec 2013, Linus Walleij wrote:

>> So it can be in <linux/mfd/my-sysconfig-regs.h> as
>> a
>>
>> #define MY_SYSCON_V1_BOOT_DEV_REG 0x958
>> #define MY_SYSCON_V1_BOOT_DEV_SPI 0x1a
>>
>> The kernel should know which SoC is in use and
>> act apropriately right?
>
> And this have lots of machine_is() calls everywhere?

No need for Mr. Everywhere to know about the SoC.

There are other ways to achieve this. arch/arm/mach-foo
always knows which ASIC it is running on, and it can do
various things:

- Add device tree fragments/overlays (OK high-tech, but
  we're getting to this, inevitably)

- Selectively add AUXDATA, which is absolutely OK if
  we can do autoprobing of hardware IMO.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
