From: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH 0/6] nvmem: sunxi_sid: native format and A83T/H5 support
Date: Thu, 21 Mar 2019 17:06:24 +0800
Message-ID: <CAGb2v65MEF8VNx3SZkBfO2x6=vPb6kuFmO+yJyyR1qZbXD8EwQ@mail.gmail.com>
References: <20190318073354.12151-1-wens@kernel.org> <437873bb-26c5-a451-0a4e-5d846b05244a@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <437873bb-26c5-a451-0a4e-5d846b05244a@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 20, 2019 at 10:25 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
> On 18/03/2019 07:33, Chen-Yu Tsai wrote:
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > Hi everyone,
> >
> > This series converts the sunxi_sid driver to read out data in native
> > endianness for all Allwinner SoCs. It was already the case for the H3,
> > which used a different read-out method. The endianness for this hardware
> > was found to be either native or little endian [1], based on the data
> > layout for the thermal sensor calibration data stored within. Some SoCs
> > have either 1 or 3 sensors, and calibration data for each sensor is 2
> > bytes wide, with data for 2 sensors packed into 1 word.
> >
> > The first three patches do some clean-up and improvements of the code
> > overall. The fourth patch converts the driver to reading out data in
> > native endianness. The fifth adds support for the A83T and H5. These
> > two were already listed in the device tree bindings. The last patch
> > adds a device node for it on H3 and H5.
> >
> > Please have a look.
> >
> > Regards
> > ChenYu
> >
> > [1] https://lkml.org/lkml/2019/2/18/134
> >
> > Chen-Yu Tsai (6):
> >    nvmem: sunxi_sid: Read out SID for randomness without looping
> >    nvmem: sunxi_sid: Optimize register read-out method
> >    nvmem: sunxi_sid: Dynamically allocate nvmem_config structure
> >    nvmem: sunxi_sid: Read out data in native format
> >    nvmem: sunxi_sid: Support SID on A83T and H5
> >    ARM: dts: sunxi: h3/h5: Add device node for SID
> >
> Applied all the nvmem patches except DTS patch to nvmem next

Thanks. Merged the DTS patch with Maxime's ack for 5.2.

ChenYu
