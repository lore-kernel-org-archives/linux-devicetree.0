From: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3] arm64: dts: rk3399: add support for firefly-rk3399
 board
Date: Thu, 13 Apr 2017 12:00:19 +0800
Message-ID: <6d1eb0cc-fe3b-a483-123c-8558096c0846@rock-chips.com>
References: <1491796213-4115-1-git-send-email-kever.yang@rock-chips.com>
 <1642127.PiTFsmK4zh@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1642127.PiTFsmK4zh@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Liang Chen <cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,


On 04/12/2017 09:29 PM, Heiko Stuebner wrote:
> Hi Kever,
>
> Am Montag, 10. April 2017, 11:50:13 CEST schrieb Kever Yang:
>> Firefly-rk3399 is a bord from T-Firefly, you can find detail about
>> it here:
>> http://en.t-firefly.com/en/firenow/Firefly_RK3399/
>>
>> This patch add basic node for the board and make it able to bring
>> up.
>>
>> Peripheral works:
>> - usb hub which connect to ehci controller;
>> - UART2 debug
>> - eMMC
>> - PCIe
>>
>> Not work:
>> - USB 3.0 HOST, type-C port
>> - sdio, sd-card
>>
>> Not test for other peripheral:
>> - HDMI
>> - Ethernet
>> - OPTICAL
>> - WiFi/BT
>> - MIPI CSI/DSI
>> - IR
>> - EDP/DP
>>
>> Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> applied for 4.13, as we're a bit late for 4.12, with the following changes:

Thanks for your help, I'm not familiar with the devices status on upstream
because not working on kernel upstream for a long time.
> - commit subject
> - dropped status from backlight (as there is no disabled common node
>    and it's specific to the firefly itself)
> - quite some reordering of properties
> - reordered regulator nodes per their addresses: 0x1b < 0x40
> - dropped obsolete regulator-compatible properties
> - fixed gpio-irq on the mpu6500
> - dropped out-of-tree orientation properties of mpu6500
>    --> please provide the optional "mount-matrix" in a follow-up patch
>        see bindings/iio/imu/inv_mpu6050.txt

Maybe we can drop this mpu6050 node first? I can't find binding file for it.
> - dropped rockchip,i2s-broken-burst-len;
>    That change never made it into the mainline kernel
> - fixed pcie pinctrl indentation
> - dropped wireless-bluetooth uart-gpios pinctrl
> - dropped supports-emmc property
>
> Please try to be a bit more careful when porting stuff from device kernels
> with respect to properties not found in the mainline kernel and please
> also double-check in [0] that I didn't break anything.

I have test this patch on my firefly-rk3399, it works fine with pwm2 
regulator
init in U-Boot.

Thanks,
- Kever
>
>
> Thanks
> Heiko
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=495a3c891a696b62465d71b1a125e3424352028b
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
