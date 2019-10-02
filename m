From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 4/4] dt-bindings: iio: adc: ad7192: Add binding
 documentation for AD7192
Date: Wed, 2 Oct 2019 09:44:09 -0500
Message-ID: <CAL_Jsq+08qOpx_jpfvEh3LKtU4Bb7nuAdPF3OfvUn4EwZPn4Uw@mail.gmail.com>
References: <20190902130831.23057-1-mircea.caprioru@analog.com>
 <20190902130831.23057-4-mircea.caprioru@analog.com> <20190903172937.GA15494@bogus>
 <20190908112907.6d9b8370@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190908112907.6d9b8370@archlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Mircea Caprioru <mircea.caprioru@analog.com>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, Stefan Popa <stefan.popa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 8, 2019 at 5:29 AM Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Tue, 3 Sep 2019 18:29:37 +0100
> Rob Herring <robh@kernel.org> wrote:
>
> > On Mon, 2 Sep 2019 16:08:31 +0300, Mircea Caprioru wrote:
> > > This patch add device tree binding documentation for AD7192 adc in YAML
> > > format.
> > >
> > > Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
> It seems that I messed up before and didn't actually revert the v3 patch.
>
> I'll roll a small fix patch to bring the tree inline with this and send out to the
> list.
>
> Sorry about this. One of many things that went wrong in that last pull request!

This still has dtc and schema errors:

 DTC     Documentation/devicetree/bindings/iio/adc/adi,ad7192.example.dt.yaml
Documentation/devicetree/bindings/iio/adc/adi,ad7192.example.dts:20.13-23:
Warning (reg_format): /example-0/spi0/adc@0:reg: property has invalid
length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/iio/adc/adi,ad7192.example.dt.yaml:
Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/iio/adc/adi,ad7192.example.dt.yaml:
Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/iio/adc/adi,ad7192.example.dt.yaml:
Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/iio/adc/adi,ad7192.example.dts:18.17-36.15:
Warning (avoid_default_addr_size): /example-0/spi0/adc@0: Relying on
default #address-cells value
Documentation/devicetree/bindings/iio/adc/adi,ad7192.example.dts:18.17-36.15:
Warning (avoid_default_addr_size): /example-0/spi0/adc@0: Relying on
default #size-cells value
  CHECK   Documentation/devicetree/bindings/iio/adc/adi,ad7192.example.dt.yaml
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/iio/adc/adi,ad7192.example.dt.yaml:
adc@0: avdd-supply:0: 'avdd' was expected
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/iio/adc/adi,ad7192.example.dt.yaml:
adc@0: dvdd-supply:0: 'dvdd' was expected
