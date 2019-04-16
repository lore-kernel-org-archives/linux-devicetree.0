From: Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH v4 0/2] Add support for the Purism Librem5 devkit
Date: Tue, 16 Apr 2019 09:38:22 -0700
Message-ID: <665773559cd9449a27fc9bc40cf73792@www.akkea.ca>
References: <20190415235343.16565-1-angus@akkea.ca>
 <20190416075834.6wurd6nq4ow5woyn@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416075834.6wurd6nq4ow5woyn@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2019-04-16 00:58, Marco Felsch wrote:
> Hi Agnus,
> 
> On 19-04-15 16:53, Angus Ainslie (Purism) wrote:
>> The Librem5 devkit is based on the imx8mq from NXP. This is a default
>> devicetree to boot the board to a command prompt.
> 
> You should also provide a patch which adds the devicetree to the yaml
> file, see: Documentation/devicetree/bindings/arm/fsl.yaml.
> 

Sure, what is that yaml file for ?

Angus

> Thanks,
>   Marco
> 
>> 
>> Changes since v3:
>> 
>> Freshly sorted and pressed nodes.
>> Change the backlight to an interpolated scale.
>> Dropped i2c2.
>> Dropped devkit version number to match debian MR.
>> 
>> Changes since v2:
>> 
>> Fixed incorrect phy-supply for the fsl-fec.
>> Dropped unused regulator property.
>> Fixup Makefile for linux-next.
>> 
>> Changes since v1:
>> 
>> Dropped config file.
>> Updated the board compatible label.
>> Changed node names to follow naming conventions.
>> Added a more complete regulator hierachy.
>> Removed unused nodes.
>> Removed unknown devices.
>> Fixed comment style.
>> Dropped undocumented properties.
>> 
>> Angus Ainslie (Purism) (2):
>>   arm64: dts: fsl: librem5: Add a device tree for the Librem5 devkit
>>   dt-bindings: Add an entry for Purism SPC
>> 
>>  .../devicetree/bindings/vendor-prefixes.txt   |   1 +
>>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>>  .../dts/freescale/imx8mq-librem5-devkit.dts   | 822 
>> ++++++++++++++++++
>>  3 files changed, 824 insertions(+)
>>  create mode 100644 
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
>> 
>> --
>> 2.17.1
>> 
>> 
>> 
