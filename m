From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 0/8] arm64: Add initial Actions Semi S700 and
 CubieBoard7 support
Date: Thu, 7 Dec 2017 10:20:15 +0100
Message-ID: <e43387f9-60a6-129b-d0e9-dff6d0df301a@linaro.org>
References: <20171113233427.5386-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171113233427.5386-1-afaerber@suse.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
Cc: Thomas Liau <thomas.liau@actions-semi.com>, Jeff Chen <jeff.chen@actions-semi.com>, =?UTF-8?B?5byg5Lic6aOO?= <zhangdf@actions-semi.com>, =?UTF-8?B?5YiY54Kc?= <liuwei@actions-semi.com>, =?UTF-8?B?5byg5aSp55uK?= <tyzhang@actions-semi.com>, =?UTF-8?B?5qKF5Yip?= <harrymei@actions-semi.com>, support@cubietech.com, linux-kernel@vger.kernel.org, Ahha Lee <lee@cubietech.com>, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On 14/11/2017 00:34, Andreas Färber wrote:
> Hello,
> 
> This series prepares the Actions Semi S700 SoC and Cubietech CubieBoard7.
> It boots equally far as the S900 based Bubblegum-96 these patches are based on,
> i.e. into an initrd with serial and all four cores up.
> 
> v2 modifies the clocksource driver patches and adds SPS patches.
> 
> Not having succeeded to replace the bootloader on eMMC or to try
> booting from SD, the only working way I've found to boot mainline kernels
> appears to be booting into Android, then issuing "reboot bootloader". U-Boot
> is lacking the saveenv command, so it wasn't possible to change the bootdelay
> to facilitate this.

Is it possible this change fixes your issue ?

http://git.denx.de/?p=u-boot.git;a=commit;h=c9e87ba66540cf72c164674a71af43853d087ba8

> Cf. https://en.opensuse.org/HCL:CubieBoard7



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
