From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/8] MIPS: DTS: CI20: Set BCH clock to 200 MHz
Date: Fri, 18 Jan 2019 11:15:14 -0300
Message-ID: <1547820914.1909.1@crapouillou.net>
References: <20190118010634.27399-1-paul@crapouillou.net>
        <20190118090736.6f1283bd@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118090736.6f1283bd@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Jan 18, 2019 at 5:07 AM, Boris Brezillon 
<bbrezillon@kernel.org> wrote:
> Hi Paul,
> 
> On Thu, 17 Jan 2019 22:06:27 -0300
> Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>> 
> wrote:
> 
>>  This is currently done inside the jz4780-bch driver, but it really
>>  should be done here instead.
>> 
> 
> I disagree with that statement. If it's a per-SoC constraint then you
> can select the appropriate rate based on the compatible in the driver.
> If the clock rate depends on the NAND chip it probably means it's used
> to generate the RE/WE pulse and should depend on the NAND timings
> passed to ->setup_data_interface(). In either case, this should not be
> specified in the DT.

Alright, I'll drop the patch.

> Regards,
> 
> Boris
> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net 
>> <mailto:paul@crapouillou.net>>
>>  ---
>>   arch/mips/boot/dts/ingenic/ci20.dts | 3 +++
>>   1 file changed, 3 insertions(+)
>> 
>>  diff --git a/arch/mips/boot/dts/ingenic/ci20.dts 
>> b/arch/mips/boot/dts/ingenic/ci20.dts
>>  index 50cff3cbcc6d..aa892ec54d0a 100644
>>  --- a/arch/mips/boot/dts/ingenic/ci20.dts
>>  +++ b/arch/mips/boot/dts/ingenic/ci20.dts
>>  @@ -111,6 +111,9 @@
>>   		pinctrl-names = "default";
>>   		pinctrl-0 = <&pins_nemc>;
>> 
>>  +		assigned-clocks = <&cgu JZ4780_CLK_BCH>;
>>  +		assigned-clock-rates = <200000000>;
>>  +
>>   		nand@1 {
>>   			reg = <1>;
>> 
> 
