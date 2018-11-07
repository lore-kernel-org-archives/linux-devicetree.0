From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 00/15] ARM: sunxi: Enable Broadcom-based
 Bluetooth controllers
Date: Wed,  7 Nov 2018 18:12:53 +0800
Message-ID: <20181107101308.7626-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBPXVRLPQKGQEZFPTSPI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

On many Allwinner SBCs / developer boards, there is a WiFi+BT combo
module from AMPAK. Inside is either one or two Broadcom chips, depending
on the model. This series enables the Bluetooth controllers for AMPAK
AP6210, AP6212, and AP6330 found on several boards. More will come later
as other SoCs require changes to some other parts. I did not cover the
SCO PCM connections from the controller to the SoC's I2S interface. It
seems no one is actually doing this, so I was not sure how to proceed.
Any suggestions?

I deliberately left out the netdev mailing list and Dave Miller, as the
only thing that is under net is the binding document. Maybe we should
move that out of Documentation/devicetree/bindings/net/ ?

Also, I'm not subscribed to the linux-bluetooth ML, so please CC me for
any discussions.

Patches 1 through 4 are device tree binding changes:

1 - Make the external clock name unambiguous, and add a second entry for
    the LPO clock.

2 - Add regulator supply properties for the VBAT and VDDIO power pins.

3 - Add a compatible string for BCM20702A1.

4 - Add a compatible string for BCM4330.

Patches 5 through 13 are changes to the driver, either improvements,
or updates to handle the updated device tree binding.

5 - Make the driver handle deferred probing for the external clock.

6 - Simplify clock error checking for subsequent clk API calls.

7 - Handle clock-names for the main external clock.

8 - Support a new external clock, the LPO.

9 - Support regulator supplies.

10 - Wait a small amount of time after toggling the GPIO for the device
     to settle.

11 - Add support for BCM20702A1, including its default address.

12 - Add BCM4330 compatible string to the driver.

13 - Handle default address for BCM43430A0.

14 - Enable Broadcom-based serdev Bluetooth for multiple Allwinner ARMv7
     boards.

15 - Enable Broadcom-based serdev Bluetooth for the Bananapi M64.

checkpatch reports an error for both patch 11 and patch 13:

    ERROR: space required after that close brace '}'

I followed the existing code's style. If this is undesirable, I can send
a follow-up patch fixing the entire code block.

The first 13 patches should go through the Bluetooth tree, while we, the
sunxi maintainers, will take the last 2.

Chen-Yu Tsai (14):
  dt-bindings: net: broadcom-bluetooth: Fix external clock names
  dt-bindings: net: broadcom-bluetooth: Add VBAT and VDDIO supplies
  dt-bindings: net: broadcom-bluetooth: Add BCM20702A1 compatible string
  dt-bindings: net: broadcom-bluetooth: Add BCM4330 compatible string
  Bluetooth: hci_bcm: Handle deferred probing for the clock supply
  Bluetooth: hci_bcm: Simplify clk_get error handling
  Bluetooth: hci_bcm: Use "txco" and "extclk" to get clock reference
  Bluetooth: hci_bcm: Add support for LPO clock
  Bluetooth: hci_bcm: Add support for regulator supplies
  Bluetooth: hci_bcm: Wait for device to come out of reset after power
    on
  Bluetooth: hci_bcm: Add compatible string for BCM4330
  Bluetooth: btbcm: Add default address for BCM43430A0
  ARM: dts: sunxi: Enable Broadcom-based Bluetooth for multiple boards
  arm64: dts: allwinner: a64: bananapi-m64: Add Bluetooth device node

Maxime Ripard (1):
  Bluetooth: hci_bcm: Add BCM20702A1 variant

 .../bindings/net/broadcom-bluetooth.txt       |   9 +-
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts    |  22 ++++
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts  |  18 +++
 .../boot/dts/sun8i-a83t-cubietruck-plus.dts   |  18 +++
 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts  |  14 +++
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts |  14 +++
 drivers/bluetooth/btbcm.c                     |  13 +-
 drivers/bluetooth/hci_bcm.c                   | 112 +++++++++++++++---
 8 files changed, 204 insertions(+), 16 deletions(-)

-- 
2.19.1
