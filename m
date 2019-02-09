From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv2 0/1] PATCHv2 Odroid c1+ usb fixes
Date: Sat,  9 Feb 2019 17:54:27 +0000
Message-ID: <20190209175428.1199-1-linux.amoon@gmail.com>
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
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

>From my side this changes fix the usb power issue on usb1 ports
This is follow up on my previous patches.

Changes from prevoius patch drop the initialization of usb0 otg port.

RFC 
[0] https://patchwork.kernel.org/patch/10777359/
[1] https://patchwork.kernel.org/patch/10777369/

Patch v0
[0] https://lore.kernel.org/patchwork/patch/1031616/
[1] https://lore.kernel.org/patchwork/patch/1031617/

As per Martin's suggestion and input I have tried to fix below issue.

Fixed the phy power issue on the usb port.

# cat /sys/kernel/debug/regulator/regulator_summary
 regulator                      use open bypass  opmode voltage current     min     max
---------------------------------------------------------------------------------------
 regulator-dummy                  4    3      0 unknown     0mV     0mA     0mV     0mV
    c90c0000.usb                  1                                 0mA     0mV     0mV
    c90c0000.usb                  1                                 0mA     0mV     0mV
    VCCK                          1    1      0 unknown   860mV     0mA   860mV  1140mV
       cpu0                       0                                 0mA   860mV   860mV
 P5V0                             3    4      0 unknown  5000mV     0mA  5000mV  5000mV
    VCC1V8                        1    1      0 unknown  1800mV     0mA  1800mV  1800mV
       c1108680.adc               1                                 0mA     0mV     0mV
    VCC3V3                        1    2      0 unknown  3300mV     0mA  3300mV  3300mV
       VDD_RTC                    0    0      0 unknown   900mV     0mA   900mV   900mV
       TFLASH_VDD                 1    1      0 unknown  3300mV     0mA  3300mV  3300mV
          c1108c20.mmc:slot@1     1                                 0mA  3300mV  3400mV
    DDR_VDDC                      0    0      0 unknown  1500mV     0mA  1500mV  1500mV
    USB_VBUS                      2    1      0 unknown  5000mV     0mA  5000mV  5000mV
       phy-c1108820.phy.0         2                                 0mA     0mV     0mV
 TF_IO                            0    1      0 unknown  3300mV     0mA  1800mV  3300mV

# lsusb -t
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        |__ Port 1: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 480M
        |__ Port 2: Dev 4, If 0, Class=Mass Storage, Driver=usb-storage, 480M
        |__ Port 3: Dev 5, If 0, Class=Video, Driver=uvcvideo, 480M
        |__ Port 3: Dev 5, If 1, Class=Video, Driver=uvcvideo, 480M
        |__ Port 3: Dev 5, If 2, Class=Audio, Driver=snd-usb-audio, 480M
        |__ Port 3: Dev 5, If 3, Class=Audio, Driver=snd-usb-audio, 480M
        |__ Port 4: Dev 6, If 0, Class=Mass Storage, Driver=usb-storage, 480M

 
Now hotpluing of usb device is working on odroid c1+ boards.
TODO: need to initialize the otg usb port to accept usb device.

Any input are welcome 

Best Regards
-Anand

Anand Moon (1):
  ARM: dts: meson8b: odroidc1: fix USB power supplies for phy

 arch/arm/boot/dts/meson8b-odroidc1.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
2.20.1
