From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv3 0/2] Odroid c2 usb fixs
Date: Tue, 29 Jan 2019 10:25:19 +0000
Message-ID: <20190129102521.4141-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

This is follow up on my previous patches.
Changes rebase on mainline: 5.0-rc4

[0] https://lore.kernel.org/patchwork/patch/1031243/
[1] https://lore.kernel.org/patchwork/patch/1031243/

changes depend on phy patch

[2] https://patchwork.kernel.org/patch/10777359/

As per Martin's suggestion and input I have tried to fix below issue.

Fixed the phy power issue on the usb port.
# cat /sys/kernel/debug/regulator/regulator_summary
 regulator                      use open bypass  opmode voltage current     min     max
---------------------------------------------------------------------------------------
 regulator-dummy                  5    4      0 unknown     0mV     0mA     0mV     0mV
    c9100000.usb                  1                                 0mA     0mV     0mV
    c9100000.usb                  1                                 0mA     0mV     0mV
    c9000000.usb                  1                                 0mA     0mV     0mV
    c9000000.usb                  1                                 0mA     0mV     0mV
 P5V0                             1    1      0 unknown  5000mV     0mA  5000mV  5000mV
    USB_OTG_PWR                   4    2      0 unknown  5000mV     0mA  5000mV  5000mV
       phy-c0000020.phy.1         2                                 0mA     0mV     0mV
       phy-c0000000.phy.0         2                                 0mA     0mV     0mV

#  lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        |__ Port 1: Dev 4, If 0, Class=Mass Storage, Driver=usb-storage, 480M
        |__ Port 3: Dev 3, If 0, Class=Video, Driver=uvcvideo, 480M
        |__ Port 3: Dev 3, If 1, Class=Video, Driver=uvcvideo, 480M
        |__ Port 3: Dev 3, If 2, Class=Audio, Driver=, 480M
        |__ Port 3: Dev 3, If 3, Class=Audio, Driver=, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M

Now hotpluing of usb device is working on odroid c2 boards.
TODO: need to initialize the otg usb port to accept usb device.

Any input are welcome

Best Regards
-Anand

Anand Moon (2):
  ARM64: dts: meson-gxbb-odroidc2: Fix usb phy reset warning
  ARM64: dts: meson-gxbb-odroidc2: Fix usb phy regulator power failed
    warning

 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.20.1
