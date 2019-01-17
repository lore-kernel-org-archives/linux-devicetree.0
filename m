From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
Date: Thu, 17 Jan 2019 21:12:20 +0100
Message-ID: <f7289814e316ad5879848fb8c379db396f615828.camel@baylibre.com>
References: <20190116165236.8330-1-jbrunet@baylibre.com>
         <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Thu, 2019-01-17 at 21:03 +0100, Martin Blumenstingl wrote:
> Hi Jerome,
> 
> On Wed, Jan 16, 2019 at 5:52 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> [...]
> > -               aobus: bus@ff800000 {
> > -                       compatible = "simple-bus";
> > -                       reg = <0x0 0xff800000 0x0 0x100000>;
> are you sure about removing aobus?
> in your patch "arm64: dts: meson: g12a: add pinctrl support
> controllers" from [0] you're adding back an "rti" bus at the same
> memory address, except that it's size is 0x1000 instead of 0x100000

Yes, I'm sure. The fact that the aobus region size is completly made up, for
all I know, is the reason 

> 
> I don't have any G12A datasheet so it's hard for me to ACK / NACK this
> patch, here are some clues why I'm asking:
> - GXM's public datasheet lists the "RTI" region at 0xC8100000 -
> 0xC81FFFFF, we call it "aobus" in our .dtsi

... RTI region which will appear once i submit the clock controller

Yes GXM (and GXBB, GXL or AXG) has the same made up region with nothing
matching in the datasheet, but it is bit late fix that now.

> - buildroot_openlinux_kernel_4.9_fbdev_20180706/kernel/aml-
> 4.9/arch/arm64/boot/dts/amlogic/mesong12a.dtsi
> also uses an aobus node as well as an io_aobus_base sub-node for the
> codec_io node (the latter is obviously not upstream)

I know, but again, it does not map to anything in the doc, and it has been the
case for several SoC.

> 
> Regards
> Martin
> 
> 
> [0] https://lore.kernel.org/patchwork/patch/1032981/
