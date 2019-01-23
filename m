From: Anand Moon <linux.amoon@gmail.com>
Subject: [RFCv1 0/3] Odroid c1+ usb fixs
Date: Wed, 23 Jan 2019 15:12:06 +0000
Message-ID: <20190123151209.2080-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

This is follow up on my previous patches.

[0] https://lore.kernel.org/patchwork/patch/1031616/
[1] https://lore.kernel.org/patchwork/patch/1031617/

As per Martin's suggestion and input I have tried to fix below issue.

Fixed the phy power issue on the usb port.
# cat /sys/kernel/debug/regulator/regulator_summary
    USB_VBUS                      4    2      0 unknown  5000mV     0mA  5000mV  5000mV
       phy-c1108820.phy.1         2                                 0mA     0mV     0mV
       phy-c1108800.phy.0         2                                 0mA     0mV     0mV

Fixed the OTG phy warning and initilizaion of usb0_phy 
# lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        |__ Port 1: Dev 5, If 0, Class=Mass Storage, Driver=usb-storage, 480M
        |__ Port 2: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 480M
        |__ Port 3: Dev 4, If 1, Class=Video, Driver=uvcvideo, 480M
        |__ Port 3: Dev 4, If 2, Class=Audio, Driver=snd-usb-audio, 480M
        |__ Port 3: Dev 4, If 0, Class=Video, Driver=uvcvideo, 480M
        |__ Port 3: Dev 4, If 3, Class=Audio, Driver=snd-usb-audio, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
 
Now hotpluing of usb device is working on odroid c1+ boards.
TODO: need to initialize the otg usb port to accept usb device.

Any input are welcome 

Best Regards
-Anand

Anand Moon (3):
  phy: meson8b-usb2: Enable otg phy controller on Meson8b SoCs
  ARM: dts: meson8b: odroidc1: fix USB power supplies for phy
  ARM: dts: meson8b: odroidc1: enable the OTG capable USB controller

 arch/arm/boot/dts/meson8b-odroidc1.dts | 27 ++++++++++++++++++++++++++
 drivers/phy/amlogic/phy-meson8b-usb2.c | 15 ++++++++++++++
 2 files changed, 42 insertions(+)

-- 
2.20.1
