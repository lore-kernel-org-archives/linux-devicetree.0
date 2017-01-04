From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Subject: staging/fbtft: Backward Device Tree compatibility in a drm version
Date: Wed, 4 Jan 2017 18:14:57 +0100
Message-ID: <f27e5817-2f53-13cf-5009-02f11106c9d4@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: OSUOSL Drivers <devel@driverdev.osuosl.org>, DRI Development <dri-devel@lists.freedesktop.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Hi,

I'm working on a drivers/gpu/drm version of drivers/staging/fbtft which
are drivers for tiny, usually SPI connected, displays. Now I'm wondering
if I can be backwards compatible and support Device Trees written for the
fbtft drivers. The main obstacle as I understand it, is the init property
which are values to be written to the controller registers to support a
different panel with the same controller. It even has encoded values for
delays... My understanding is that this is not accepted.
It's in fact a display panel description in the form of register values
and delays.

Here is what a binding doc would look like for one of the fbtft drivers:

* Samsung S6D02A1 Framebuffer Driver

Required properties:
   - compatible: Should be "samsung,s6d02a1".

The node for this driver must be a child node of a SPI controller, hence
all mandatory properties described in ../spi/spi-bus.txt must be specified.

Optional properties:
- dc-gpios:    D/C pin used with the 4-wire 8-bit data serial interface mode
- reset-gpios:    Reset pin
- led-gpios:    Backlight control
- width:    Panel width in pixels
- height:    Panel height in pixels
- rotate:    Panel rotation in degrees counter clockwise (0,90,180,270)
- bgr:        Panel is wired as BGR565 instead of RGB565
- buswidth:    Bit width of the bus, in the case of SPI: 8 (4-wire) or 9 
(3-wire) bits.
- txbuflen:    Size of transfer buffer. Used for little-big endian 
conversion.
- debug:    Control debug output to the kernel log
- init:        Panel initialization sequence overriding the driver default.
         Values OR'ed with:
         0x1000000 - Write the following values to this register.
         0x2000000 - Delay in milliseconds

Example:
mz61581: mz61581@0{
     compatible = "samsung,s6d02a1";
     reg = <0>;
     spi-max-frequency = <128000000>;
     spi-cpol;
     spi-cpha;

     width = <320>;
     height = <480>;
     rotate = <270>;
     bgr;
     buswidth = <8>;
     txbuflen = <32768>;

     reset-gpios = <&gpio 15 0>;
     dc-gpios = <&gpio 25 0>;
     led-gpios = <&gpio 18 0>;

     init = <0x10000b0 00
         0x1000011
         0x20000ff
         0x10000b3 0x02 0x00 0x00 0x00
         0x10000c0 0x13 0x3b 0x00 0x02 0x00 0x01 0x00 0x43
         0x10000c1 0x08 0x16 0x08 0x08
         0x10000c4 0x11 0x07 0x03 0x03
         0x10000c6 0x00
         0x10000c8 0x03 0x03 0x13 0x5c 0x03 0x07 0x14 0x08 0x00 0x21 
0x08 0x14 0x07 0x53 0x0c 0x13 0x03 0x03 0x21 0x00
         0x1000035 0x00
         0x1000036 0xa0
         0x100003a 0x55
         0x1000044 0x00 0x01
         0x10000d0 0x07 0x07 0x1d 0x03
         0x10000d1 0x03 0x30 0x10
         0x10000d2 0x03 0x14 0x04
         0x1000029
         0x100002c>;

     /* This is a workaround to make sure the init sequence slows down 
and doesn't fail */
     debug = <3>;
};


Noralf.
