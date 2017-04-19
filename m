From: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/8] i.MX7 PCIe related device tree changes
Date: Wed, 19 Apr 2017 11:28:18 -0700
Message-ID: <CANMBJr6HVp+Pe4QLRU2-fePW8_kZ4tGRELkDCdq8ihUEy901Cw@mail.gmail.com>
References: <20170413133242.5068-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170413133242.5068-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 13 April 2017 at 06:32, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Shawn, everyone:
>
> This series includes changes made to device-tree in order to support
> PCIe on i.MX7 platform. They include:
>
>      - Bringing 'anatop-enable-bit' property of ANATOP regulators back
>        and extending it to all of the HW it is applicable to
>
>      - Adding GPCv2 node for i.MX7 (which was missing, despite the
>        irqchip driver for it being in the tree for quite some time)
>
>      - Adding a PCIe node for i.MX7
>
>      - Adding GPIO expander used by PCIe and enabling PCIe node from
>        above on i.MX7 based Sabre board
>
> As usual, feedback is welcome.
>
> Thanks,
> Andrey Smrinov
>
> Andrey Smirnov (8):
>   Revert "ARM: dts: imx: Remove unexistant property"
>   ARM: dts: imx6: Specify 'anatop-enable-bit' where appropriate
>   ARM: dts: imx7s: Adjust anatop-enable-bit for 'reg_1p0d'
>   ARM: dts: imx7s: Add node for GPC
>   ARM: dts: imx7s: Mark 'gpr' compatible with i.MX6 variant
>   ARM: dts: imx7d-sdb: Add GPIO expander node
>   ARM: dts: imx7d: Add node for PCIe controller
>   ARM: dts: imx7d-sdb: Enable PCIe peripheral

FWIW:

Tested-by: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This whole series on top of v4.11-rc7, with the addition of the iMX7
GPCv2 and reset driver. Tested on a imx7d-cl-som with a CUK Killer
Doubleshot Wireless-AC 1535 wlan/bt radio using a mini pcie to m2
adapter. Confirmed that the radio was able to associate with an AP
using WPA2, and connected to multiple devices using 6lowpan over BLE.

Tyler
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
