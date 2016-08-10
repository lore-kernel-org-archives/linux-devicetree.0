From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [v10 PATCH 0/5] Rockchip Type-C and DisplayPort driver
Date: Wed, 10 Aug 2016 09:37:00 +0900
Message-ID: <57AA772C.1010303@samsung.com>
References: <CGME20160809233518epcas1p3f9f022aa8f96317795c91479d6758a3a@epcas1p3.samsung.com>
 <1470785557-21974-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1470785557-21974-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "cpgs (cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org)" <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On 2016년 08월 10일 08:32, Chris Zhong wrote:
> Hi all
> 
> This series patch is for rockchip Type-C phy and DisplayPort controller
> driver.
> 
> The USB Type-C PHY is designed to support the USB3 and DP applications.
> The PHY basically has two main components: USB3 and DisplyPort. USB3
> operates in SuperSpeed mode and the DP can operate at RBR, HBR and HBR2
> data rates. The Type-C cable orientation detection and Power Delivery
> (PD) is accomplished using a PD PHY or a exernal PD chip.
> 
> The DP controller is compliant with DisplayPort Specification,
> Version 1.3, This IP is compatible with the rockchip type-c PHY IP.
> There is a uCPU in DP controller, it need a firmware to work, please
> put the firmware file[0] to /lib/firmware/rockchip/dptx.bin. The uCPU
> in charge of aux communication and link training, the host use mailbox
> to communicate with the ucpu.
> 
> The DP contoller has register a notification with extcon API, to get the
> alt mode from PD, the PD driver need call the devm_extcon_dev_allocate
> to create a extcon device and use extcon_set_state to notify DP
> controller. And call extcon_set_cable_property to set orientation.
> 
> About the DP audio, cdn-dp registered 2 DAIs: 0 is I2S, 1 is SPDIF.
> We can reference them in simple-card.
> 
> This series is based on Mark Yao's branch[1] and Chanwoo Choi's
> extcon-next branch[2], and the clk patch[3].
> 
> I test this patches on the rk3399-evb board, with a fusb302 driver,
> this branch has no rk3399.dtsi, so the patch about dts is not included
> in this series.
> 
>>From V9, the Type-C PHY is split into two PHYs: DP and USB3. The PHY
> will be init, no matter which PHY be power_on. The DP module will
> enter A2 mode (standby mode) after phy_init, if DP PHY is powered on,
> the DP module will enter to A0 mode(running mode). Then if DP PHY is
> powered off, DP module will back to A2 mode. If everything is
> un-plugged, phy will be deinit.
> 
> [0]
> https://patchwork.kernel.org/patch/9249693/
> [1]
> https://github.com/markyzq/kernel-drm-rockchip/tree/drm-rockchip-next-2016-05-23
> [2]
> https://git.kernel.org/cgit/linux/kernel/git/chanwoo/extcon.git/log/?h=extcon-test
> - extcon: Add the extcon_type to gather each connector into five category
> - extcon: Add the support for extcon property according to extcon type
> - extcon: Add the support for the capability of each property
> - extcon: Rename the extcon_set/get_state() to maintain the function naming
> pattern
> - extcon: Add the synchronization extcon APIs to support the notification
> - extcon: Add EXTCON_DISP_DP and the property for USB Type-C

The extcon patches are merged on extcon-next branch.
So, you can check them on both extcon git and linux-next git repo.

[snip]

Regards,
Chanwoo Choi

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
