From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
Date: Thu, 17 Jan 2019 21:03:48 +0100
Message-ID: <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
References: <20190116165236.8330-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116165236.8330-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jerome,

On Wed, Jan 16, 2019 at 5:52 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
[...]
> -               aobus: bus@ff800000 {
> -                       compatible = "simple-bus";
> -                       reg = <0x0 0xff800000 0x0 0x100000>;
are you sure about removing aobus?
in your patch "arm64: dts: meson: g12a: add pinctrl support
controllers" from [0] you're adding back an "rti" bus at the same
memory address, except that it's size is 0x1000 instead of 0x100000

I don't have any G12A datasheet so it's hard for me to ACK / NACK this
patch, here are some clues why I'm asking:
- GXM's public datasheet lists the "RTI" region at 0xC8100000 -
0xC81FFFFF, we call it "aobus" in our .dtsi
- buildroot_openlinux_kernel_4.9_fbdev_20180706/kernel/aml-4.9/arch/arm64/boot/dts/amlogic/mesong12a.dtsi
also uses an aobus node as well as an io_aobus_base sub-node for the
codec_io node (the latter is obviously not upstream)


Regards
Martin


[0] https://lore.kernel.org/patchwork/patch/1032981/
