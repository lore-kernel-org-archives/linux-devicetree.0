From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Fri, 13 Feb 2009 08:36:48 -1000
Message-ID: <4995BDC0.3040806@firmworks.com>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>	<200902131206.42427.paul@codesourcery.com>	<87ocx6pkol.fsf@pike.pond.sub.org>	<200902131333.47141.paul@codesourcery.com>
	<871vu2pgq7.fsf@pike.pond.sub.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <871vu2pgq7.fsf-A7mx1g9ivIOttUaS3K59qNi2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Here is an IEEE1275 device tree for a OLPC system, which is close enough 
to a PC.

** /

ec-name                  PQ2E21
ec-version               00000054
serial-number            SHF73300042
board-revision-int       00000c18
model                    C1
dma-ranges               07000000 09000000
banner-name              OLPC C1
architecture             OLPC
#size-cells              00000001
#address-cells           00000001

** /cpus

#size-cells              00000000
#address-cells           00000001
name                     cpus

** /cpus/cpu@0

clock-frequency          19d42455
model                    AMD,Geode LX
reg                      00000000
device_type              cpu
name                     cpu

** /flash@fff00000

#address-cells           00000001
reg                      fff00000 00100000
name                     flash

** /memory@0

reg                      00000000 10000000
available                0efca000 00010000
                         0ef80000 00048000
                         00100000 0eb00000
                         00002000 0009e000
name                     memory

** /pci/usb@f,5

assigned-addresses       82007d10 00000000 fe01b000 00000000 00000100
reg                      00007d00 00000000 00000000 00000000 00000000
                         02007d10 00000000 00000000 00000000 00000100
#size-cells              00000000
#address-cells           00000002
name                     usb
device_type              ehci
66mhz-capable
devsel-speed             00000001
class-code               000c0320
subsystem-vendor-id      00001022
subsystem-id             00002095
interrupts               00000004
max-latency              00000000
min-grant                00000000
revision-id              00000002
device-id                00002095
vendor-id                00001022


** /pci/usb@f,4

assigned-addresses       82007c10 00000000 fe01a000 00000000 00001000
reg                      00007c00 00000000 00000000 00000000 00000000
                         02007c10 00000000 00000000 00000000 00001000
#size-cells              00000000
#address-cells           00000002
name                     usb
device_type              ohci
66mhz-capable
devsel-speed             00000001
class-code               000c0310
subsystem-vendor-id      00001022
subsystem-id             00002094
interrupts               00000004
max-latency              00000000
min-grant                00000000
revision-id              00000002
device-id                00002094
vendor-id                00001022


** /pci/audio@f,3

assigned-addresses       81007b10 00000000 00001480 00000000 00000080
reg                      00007b00 00000000 00000000 00000000 00000000
                         01007b10 00000000 00000000 00000000 00000080
compatible               AD1888
                         AC97,CODEC
output-encoding-types    16bit-LE-signed-linear
input-encoding-types     16bit-LE-signed-linear
sample-frame-size        00000010
sample-precisions        00000010
#output-channels         00000002
#input-channels          00000001
device_type              sound
name                     audio
66mhz-capable
fast-back-to-back
devsel-speed             00000001
class-code               00040100
subsystem-vendor-id      00001022
subsystem-id             00002093
interrupts               00000002
max-latency              00000000
min-grant                00000000
revision-id              00000001
device-id                00002093
vendor-id                00001022


** /pci/camera@c,2

assigned-addresses       82006210 00000000 fe028000 00000000 00004000
reg                      00006200 00000000 00000000 00000000 00000000
                         02006210 00000000 00000000 00000000 00004000
sensor                   OV7670
compatible               olpc,camera
device_type              camera
model                    olpc,camera
name                     camera
66mhz-capable
fast-back-to-back
devsel-speed             00000001
class-code               00040001
subsystem-vendor-id      000011ab
subsystem-id             00004100
interrupts               00000001
max-latency              00000008
min-grant                00000008
revision-id              00000010
device-id                00004102
vendor-id                000011ab


** /pci/sd@c,1

assigned-addresses       81006110 00000000 fe024000 00000000 00004000
reg                      00006100 00000000 00000000 00000000 00000100
                         01006110 00000000 00000000 00000000 00004000
compatible               sdhci
#size-cells              00000000
#address-cells           00000000
name                     sd
66mhz-capable
fast-back-to-back
devsel-speed             00000001
class-code               00080501
subsystem-vendor-id      000011ab
subsystem-id             00004100
interrupts               00000001
max-latency              00000008
min-grant                00000008
revision-id              00000010
device-id                00004101
vendor-id                000011ab


** /pci/nandflash@c

assigned-addresses       82006010 00000000 fe020000 00000000 00004000
reg                      00006000 00000000 00000000 00000000 00000000
                         02006010 00000000 00000000 00000000 00004000
compatible               olpc,cafenand
model                    olpc,cafenand
name                     nandflash
66mhz-capable
fast-back-to-back
devsel-speed             00000001
class-code               00050101
subsystem-vendor-id      000011ab
subsystem-id             00004100
interrupts               00000001
max-latency              00000008
min-grant                00000008
revision-id              00000010
device-id                00004100
vendor-id                000011ab


** /pci/pci1022,2082@1,2

assigned-addresses       82000a10 00000000 fe010000 00000000 00004000
reg                      00000a00 00000000 00000000 00000000 00000000
                         02000a10 00000000 00000000 00000000 00004000
compatible               pci1022,2082
                         pci1022,2082
                         pciclass,101000
name                     pci1022,2082
66mhz-capable
fast-back-to-back
devsel-speed             00000001
class-code               00101000
subsystem-vendor-id      00001022
subsystem-id             00002082
interrupts               00000001
max-latency              00000000
min-grant                00000000
revision-id              00000000
device-id                00002082
vendor-id                00001022


** /pci/host@1

assigned-addresses       81000810 00000000 0000ac1c 00000000 00000004
power-consumption        00 00 00 00 01 7d 78 40
reg                      00000800 00000000 00000000 00000000 00000000
                         01000810 00000000 00000000 00000000 00000004
compatible               pci1022,2080
                         pci1022,2080
                         pciclass,060000
name                     host
66mhz-capable
devsel-speed             00000001
class-code               00060000
subsystem-vendor-id      00001022
subsystem-id             00002080
max-latency              00000000
min-grant                00000000
revision-id              00000021
device-id                00002080
vendor-id                00001022


** /pci/display@1,1

compatible               pci1022,2081
                         pci1022,2081
                         pciclass,030000
66mhz-capable
devsel-speed             00000001
class-code               00030000
subsystem-vendor-id      00001022
subsystem-id             00002081
interrupts               00000001
max-latency              00000000
min-grant                00000000
revision-id              00000000
device-id                00002081
vendor-id                00001022
address                  fd000000
linebytes                00000960
depth                    00000010
height                   00000384
width                    000004b0
assigned-addresses       82000910 00000000 fd000000 00000000 00800000
                         82000914 00000000 fe000000 00000000 00004000
                         82000918 00000000 fe004000 00000000 00004000
                         8200091c 00000000 fe008000 00000000 00004000
                         82000920 00000000 fe00c000 00000000 00004000
iso6429-1983-colors
character-set            ISO8859-1
device_type              display
reg                      00000900 00000000 00000000 00000000 00000100
                         02000910 00000000 00000000 00000000 00800000
                         02000914 00000000 00000000 00000000 00004000
                         02000918 00000000 00000000 00000000 00004000
                         0200091c 00000000 00000000 00000000 00004000
                         02000920 00000000 00000000 00000000 00004000
name                     display


** /pci/isa@f

assigned-addresses       81007810 00000000 000018b0 00000000 00000000
                         81007814 00000000 00001000 00000000 00000000
                         81007818 00000000 00001800 00000000 00000000
                         8100781c 00000000 00001880 00000000 00000000
                         81007820 00000000 00001400 00000000 00000000
                         81007824 00000000 00001840 00000000 00000000
66mhz-capable
fast-back-to-back
devsel-speed             00000001
class-code               00060100
subsystem-vendor-id      00001022
subsystem-id             00002090
max-latency              00000000
min-grant                00000000
revision-id              00000003
device-id                00002090
vendor-id                00001022
interrupt-parent         ff867a98
#interrupt-cells         00000002
ranges                   00000000 00000000 02000000 00000000 00000000 
01000000
                         00000001 00000000 01000000 00000000 00000000 
00010000
clock-frequency          007ea5e0
reg                      00007800 00000000 00000000 00000000 00000000
#size-cells              00000001
#address-cells           00000002
device_type              isa
name                     isa


** /pci/usb@f,5/wlan@0,0

device_type              wireless-network
configuration#           00000001
bulk-in-size             00000200
bulk-in-pipe             00000003
bulk-out-size            00000200
bulk-out-pipe            00000002
serial$
device$                  MARVELL Wireless Device
vendor$                  Marvell
compatible               usb1286,2001.3107
                         usb1286,2001
                         usbif1286,classff.ff.ff
                         usbif1286,classff.ff
                         usbif1286,classff
                         usbif,classff.ff.ff
                         usbif,classff.ff
                         usbif,classff
                         usb,device
vendor-id                00001286
device-id                00002001
release                  00003107
name                     wlan
class                    000000ff
subclass                 000000ff
protocol                 000000ff
high-speed
assigned-address         00000001
reg                      00000000 00000000
#size-cells              00000000
#address-cells           00000001


** /pci/sd@c,1/disk

device_type              block
iconname                 sdmmc
name                     disk


** /pci/isa@f/rtc@i70

status                   okay
century                  00000032
alarm_month              0000003e
alarm_day                0000003d
device#                  00000002
interrupts               00000008
                         00000000
reg                      00000001 00000070 00000002
compatible               pnpPNP,b00
device_type              rtc
name                     rtc


** /pci/isa@f/8042@i60

#size-cells              00000000
#address-cells           00000001
reg                      00000001 00000060 00000001
                         00000001 00000064 00000001
compatible               ps2-keyboard-controller
                         INTC,80c42
device_type              8042
name                     8042
model                    INTC,80c42
interrupts               00000001
                         00000003
                         0000000c
                         00000003


** /pci/isa@f/serial@i3f8

reg                      00000001 000003f8 00000008
compatible               pnpPNP,501
device_type              serial
name                     serial
clock-frequency          001c2000
interrupts               00000004
                         00000003


** /pci/isa@f/timer@i40

interrupts               00000000
                         00000003
reg                      00000001 00000040 00000004
                         00000001 00000061 00000001
compatible               pnpPNP,100
device_type              timer
name                     timer


** /pci/isa@f/interrupt-controller@i20

reg                      00000001 00000020 00000002
                         00000001 000000a0 00000002
                         00000001 000004d0 00000002
compatible               pnpPNP,0
device_type              interrupt-controller
name                     interrupt-controller
#address-cells           00000000
#interrupt-cells         00000002
interrupt-controller


** /pci/isa@f/dma-controller@i00

reg                      00000001 00000000 00000010
                         00000001 00000080 00000020
                         00000001 000000c0 00000020
                         00000001 00000481 0000000f
compatible               pnpPNP,200
device_type              dma-controller
name                     dma-controller


** /pci/isa@f/8042@i60/mouse@aux

reg                      00000001
compatible               pnpPNP,f03
device_type              mouse
name                     mouse


** /pci/isa@f/8042@i60/keyboard@kbd

language                 EN
keyboard-type            us
reg                      00000000
device_type              keyboard
compatible               pnpPNP,303
name                     keyboard
