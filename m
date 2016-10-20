From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH] mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs
Date: Thu, 20 Oct 2016 11:32:08 +0200
Message-ID: <d675d2e6-c7fe-37a4-16ca-278f78e1f158@kaod.org>
References: <1476723427-13243-1-git-send-email-clg@kaod.org>
 <20161018163913.7z337iyc53atp4yd@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20161018163913.7z337iyc53atp4yd@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Milton Miller <miltonm@us.ibm.com>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Joel Stanley <joel@jms.id.au>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On 10/18/2016 06:39 PM, Rob Herring wrote:
> On Mon, Oct 17, 2016 at 06:57:07PM +0200, C=E9dric Le Goater wrote:
>> This driver adds mtd support for spi-nor attached to either or both of
>> the Firmware Memory Controller or the SPI Flash Controller (AST2400
>> only).
>>
>> The SMC controllers on the Aspeed AST2500 SoC are very similar to the
>> ones found on the AST2400. The differences are on the number of
>> supported flash modules and their default mappings in the SoC address
>> space.
>>
>> The Aspeed AST2500 has one SPI controller for the BMC firmware and two
>> for the host firmware. All controllers have now the same set of
>> registers compatible with the AST2400 FMC controller and the legacy
>> 'SMC' controller is fully gone.
>>
>> Based on previous work from Milton D. Miller II <miltonm@us.ibm.com>
>>
>> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
>> ---
>>  .../devicetree/bindings/mtd/aspeed-smc.txt         |  86 +++
>>  drivers/mtd/spi-nor/Kconfig                        |  12 +
>>  drivers/mtd/spi-nor/Makefile                       |   1 +
>>  drivers/mtd/spi-nor/aspeed-smc.c                   | 746 ++++++++++++++=
+++++++
>>  4 files changed, 845 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
>>  create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt b/Docu=
mentation/devicetree/bindings/mtd/aspeed-smc.txt
>> new file mode 100644
>> index 000000000000..f6bfa7761205
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
>> @@ -0,0 +1,86 @@
>> +* Aspeed Static Memory controller
>> +* Aspeed SPI Flash Controller
>> +
>> +The Static memory controller in the ast2400 supports 5 chip selects each
>> +can be attached to NAND, parallel NOR, or SPI NOR attached flash.  The
>> +Firmware Memory Controller in the ast2500 supports 3 chip selects, two =
of
>> +which are always in SPI-NOR mode and the third can be SPI-NOR or parall=
el
>> +flash.  The SPI flash controller in the ast2400 supports one of 2 chip
>> +selects selected by pinmux.  The two SPI flash controllers in the ast25=
00
>> +each support two chip selects.
>> +
>> +Required properties:
>> +  - compatible : Should be one of
>> +	"aspeed,ast2400-fmc" for the AST2400 Static Memory Controller
>> +	"aspeed,ast2400-smc" for the AST2400 SPI Flash Controller
>> +	"aspeed,ast2500-fmc" for the AST2500 Firmware SPI Memory Controller
>> +	"aspeed,ast2500-smc" for the AST2500 SPI Flash Controllers
>> +  - reg : the first contains the control register location and length,
>> +          the second contains the memory window mapping address and len=
gth
>> +  - clocks : The APB clock input to the controller
>> +  - #address-cells : must be 1 corresponding to chip select child bindi=
ng
>> +  - #size-cells : must be 0 corresponding to chip select child binding
>> +
>> +Optional properties:
>> +  - aspeed,fmc-has-dma : controller supports DMA transfers
> =

> The compatible should imply this.

yes you are right. this is the case for the *fmc.

> =

>> +  - interrupts : Should contain the interrupt for the dma device if an =
fmc
>> +
>> +Child node required properties:
> =

> Need to say what the child nodes are.

yes again. the child node definitions really need more care. will do in v2.

Thanks for the review,

C. =



> =

>> +  - reg : must contain chip select number in first cell of address, must
>> +	  be 1 tuple long
>> +  - compatible : may contain "vendor,part", must include "jedec,spi-nor"
>> +		when attached to SPI flash (see spi-nor.txt binding).
>> +
>> +Child node optional properties:
>> +  - label           - (optional) name to assign to mtd, default os assi=
gned
>> +
>> +Child node optional properties for SPI mode (may be ignored):
>> +  - spi-max-frequency - (optional) max frequency of spi bus
>> +  - spi-cpol        - (optional) Empty property indicating device requi=
res
>> +			inverse clock polarity (CPOL) mode (boolean)
>> +  - spi-cpha        - (optional) Empty property indicating device requi=
res
>> +			shifted clock phase (CPHA) mode (boolean)
>> +  - spi-tx-bus-width - (optional) The bus width(number of data wires) t=
hat
>> +                        used for MOSI. Defaults to 1 if not present.
>> +  - spi-rx-bus-width - (optional) The bus width(number of data wires) t=
hat
>> +                        used for MOSI. Defaults to 1 if not present.
>> +
>> +Grandchild node optional properties:
>> + - see mtd/partiton.txt for partitioning bindings and mtd naming
>> +
>> +
>> +Example:
>> +
>> +fmc: fmc@1e620000 {
>> +	compatible =3D "aspeed,ast2400-fmc";
>> +	reg =3D < 0x1e620000 0x94
>> +		0x20000000 0x02000000
>> +		0x22000000 0x02000000 >;
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <0>;
>> +	flash@0 {
>> +		reg =3D < 0 >;
>> +		compatible =3D "jedec,spi-nor" ;
>> +		label =3D "bmc";
> =

> label isn't really a defined property here. Belongs in jedec,spi-nor =

> binding if you want to add it.
> =

>> +		/* spi-max-frequency =3D <>; */
>> +		/* m25p,fast-read; */
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <1>;
>> +		boot@0 {
> =

> Use the newer style with all partitions under a 'partitions' node.
> =

>> +			label =3D "boot-loader";
>> +			reg =3D < 0 0x8000 >
> =

> Missing ';'
> =

>> +		}
>> +		image@8000 {
>> +			label =3D "kernel-image";
>> +			reg =3D < 0x8000 0x1f8000 >
> =

> ditto
> =

>> +		}
>> +	};
>> +	flash@1 {
>> +		reg =3D < 1 >;
>> +		compatible =3D "jedec,spi-nor" ;
>> +		label =3D "alt";
>> +		/* spi-max-frequency =3D <>; */
>> +		status =3D "fail";
>> +		/* m25p,fast-read; */
>> +	};
>> +};
> =

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> =



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
