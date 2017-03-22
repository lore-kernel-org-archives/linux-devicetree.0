From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 2/4] arm64: dts: rockchip: add Gru/Kevin DTS
Date: Wed, 22 Mar 2017 12:59:37 +0100
Message-ID: <2390473.XAgkTqANPY@phil>
References: <20170320235344.126298-1-briannorris@chromium.org>
 <20170320235344.126298-3-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170320235344.126298-3-briannorris@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Brian Norris <briannorris@chromium.org>
Cc: devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Chris Zhong <zyw@rock-chips.com>, Stephen Barber <smbarber@chromium.org>, linux-arm-kernel@lists.infradead.org, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Am Montag, 20. M=E4rz 2017, 16:53:42 CET schrieb Brian Norris:
> Kevin is part of a family of boards called Gru. As best as possible, the
> properties shared by the Gru family are placed in rk3399-gru.dtsi, while
> Kevin-specific bits are in rk3399-gru-kevin.dts. This does not add full
> support for the base Gru board.
> =

> Working and tested (to some extent):
>  * EC support -- including keyboard, battery, PWM, and probably more
>  * UART / console
>  * Thermal
>  * Touchscreen
>  * Touchpad
>  * Digitizer (regulator still WIP)
>  * PCIe / Wifi
>  * Bluetooth / Webcam
>  * SD card
>  * eMMC
>  * USB2 on TypeC
>    - This works much of the time, but USB3 devices may or may not detect
>      properly. Waiting on proper extcon support for USB3 over TypeC.
>    - Depends on XHCI/DWC3 fixes for ARM64 that still haven't landed
>  * Backlight
> =

> Not working:
>  * CPUFreq -- relies on special OVP support for our PWM regulator
>    circuits
>  * EC / extcon support -- and with it, USB3/TypeC/DP
>  * DRM -- won't even build on ARM64, so all display, eDP, etc. is not
>    enabled
> =

> Not tested:
>  * Audio
> =

> Signed-off-by: Brian Norris <briannorris@chromium.org>

applied for 4.12 with Enric's Tested-tag after some reordering of nodes/
properties.


Heiko
