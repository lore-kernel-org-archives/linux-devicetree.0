From: Kuldeep Singh <kuldeep.singh@nxp.com>
Subject: RE: [EXT] Re: [PATCH] arm64: dts: ls1012a: Add QSPI support for
 ls1012a
Date: Thu, 23 May 2019 09:19:59 +0000
Message-ID: <AM0PR0402MB3556C556ADC2EEF1117CC880E0010@AM0PR0402MB3556.eurprd04.prod.outlook.com>
References: <20190516114807.30817-1-kuldeep.singh@nxp.com>
 <20190523084340.GM9261@dragon>
 <d3605699-24ea-a071-93da-1c04c7e40f1b@kontron.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <d3605699-24ea-a071-93da-1c04c7e40f1b@kontron.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Schrempf Frieder <frieder.schrempf@kontron.de>, Shawn Guo <shawnguo@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, Ashish Kumar <ashish.kumar@nxp.com>, "broonie@kernel.org" <broonie@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn and Frieder,

> -----Original Message-----
> From: Schrempf Frieder [mailto:frieder.schrempf@kontron.de]
> Sent: Thursday, May 23, 2019 2:31 PM
> To: Shawn Guo <shawnguo@kernel.org>; Kuldeep Singh
> <kuldeep.singh@nxp.com>
> Cc: devicetree@vger.kernel.org; bbrezillon@kernel.org; Ashish Kumar
> <ashish.kumar@nxp.com>; broonie@kernel.org; linux-
> mtd@lists.infradead.org; linux-arm-kernel@lists.infradead.org
> Subject: [EXT] Re: [PATCH] arm64: dts: ls1012a: Add QSPI support for ls1012a
> 
> Caution: EXT Email
> 
> On 23.05.19 10:43, Shawn Guo wrote:
> > On Thu, May 16, 2019 at 11:47:04AM +0000, Kuldeep Singh wrote:
> >> QSPI support is added for kernel version greater than 5.0 and
> >> supports quad mode defined by TX-WIDTH = <4>, RX-WIDTH = <4>
> >>
> >> RDB/QDS has one 64MB flash from SPANSION(s25fs512s)
> >>
> >> Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> >> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> >> ---
> >> Dependency on
> >>
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpat
> >>
> chwork.ozlabs.org%2Fpatch%2F1100471%2F&amp;data=02%7C01%7Ckuldee
> p.sin
> >>
> gh%40nxp.com%7C5f9556e9b9b943c5568608d6df5d2e40%7C686ea1d3bc2b4
> c6fa92
> >>
> cd99c5c301635%7C0%7C0%7C636941988633482881&amp;sdata=Pj4XNJHmhK
> HtBrzg
> >> eC%2BNA7Lkl3BDEdL1uEVqAnoPcS8%3D&amp;reserved=0
> >> Dependency on
> >>
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpat
> >>
> chwork.ozlabs.org%2Fpatch%2F1100472%2F&amp;data=02%7C01%7Ckuldee
> p.sin
> >>
> gh%40nxp.com%7C5f9556e9b9b943c5568608d6df5d2e40%7C686ea1d3bc2b4
> c6fa92
> >>
> cd99c5c301635%7C0%7C0%7C636941988633482881&amp;sdata=zZ4jCpNyxQl
> CL6uU
> >> PK8LG%2BVV8jWOCBg45ZrGoqT3gnU%3D&amp;reserved=0
> >>
> >>   .../arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts | 15
> +++++++++++++++
> >>   .../arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts | 15
> +++++++++++++++
> >>   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts | 15
> +++++++++++++++
> >>   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts | 15
> +++++++++++++++
> >>   arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi    | 15
> +++++++++++++++
> >>   5 files changed, 75 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
> >> b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
> >> index f90c040fd5e8..8826278b37bf 100644
> >> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
> >> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
> >> @@ -61,6 +61,21 @@
> >>      status = "okay";
> >>   };
> >>
> >> +&qspi {
> >
> > Please sort these labeling nodes alphabetically.  That said, &qspi
> > should go after &i2c0.

Ok, will update in next version

> >
> >> +    status = "okay";
> >> +
> >> +    qflash0: flash@0 {
> >> +            compatible = "spansion,m25p80", "jedec,spi-nor";
> >> +            #address-cells = <1>;
> >> +            #size-cells = <1>;
> >> +            m25p,fast-read;
> >> +            spi-max-frequency = <20000000>;
> >> +            spi-rx-bus-width = <4>;
> >> +            spi-tx-bus-width = <4>;
> >> +            reg = <0>;
> >> +    };
> >> +};
> >> +
> >>   &i2c0 {
> >>      status = "okay";
> >>
> >> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
> >> b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
> >> index 8749634c55ee..0246e8c97628 100644
> >> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
> >> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
> >> @@ -20,6 +20,21 @@
> >>      status = "okay";
> >>   };
> >>
> >> +&qspi {
> >> +    status = "okay";
> >> +
> >> +    qflash0: flash@0 {
> >> +            compatible = "spansion,m25p80", "jedec,spi-nor";
> >> +            #address-cells = <1>;
> >> +            #size-cells = <1>;
> >> +            m25p,fast-read;
> >> +            spi-max-frequency = <20000000>;
> >> +            spi-rx-bus-width = <4>;
> >> +            spi-tx-bus-width = <4>;
> >> +            reg = <0>;
> >> +    };
> >> +};
> >> +
> >>   &i2c0 {
> >>      status = "okay";
> >>   };
> >> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
> >> b/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
> >> index 2fb1cb1f7d8f..c304fa20c1c9 100644
> >> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
> >> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
> >> @@ -90,6 +90,21 @@
> >>      };
> >>   };
> >>
> >> +&qspi {
> >> +    status = "okay";
> >> +
> >> +    qflash0: flash@0 {
> >> +            compatible = "spansion,m25p80", "jedec,spi-nor";
> >> +            #address-cells = <1>;
> >> +            #size-cells = <1>;
> >> +            m25p,fast-read;
> >> +            spi-max-frequency = <20000000>;
> >> +            spi-rx-bus-width = <4>;
> >> +            spi-tx-bus-width = <4>;
> >> +            reg = <0>;
> >> +    };
> >> +};
> >> +
> >>   &duart0 {
> >>      status = "okay";
> >>   };
> >> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts
> >> b/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts
> >> index 5edb1e137a52..6017e9cfe40a 100644
> >> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts
> >> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts
> >> @@ -38,3 +38,18 @@
> >>   &sata {
> >>      status = "okay";
> >>   };
> >> +
> >> +&qspi {
> >> +    status = "okay";
> >> +
> >> +    qflash0: flash@0  {
> >> +            compatible = "spansion,m25p80", "jedec,spi-nor";
> >> +            #address-cells = <1>;
> >> +            #size-cells = <1>;
> >> +            m25p,fast-read;
> >> +            spi-max-frequency = <20000000>;
> >> +            spi-rx-bus-width = <4>;
> >> +            spi-tx-bus-width = <4>;
> >> +            reg = <0>;
> >> +    };
> >> +};
> >> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> >> b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> >> index ec6257a5b251..268268c6a149 100644
> >> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> >> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> >> @@ -350,6 +350,21 @@
> >>                      status = "disabled";
> >>              };
> >>
> >> +            qspi: spi@1550000 {
> >
> > Please sort node with unit-address in that address.  That said, it
> > should go before esdhc@1560000.

Ok

> >
> >> +                    compatible = "fsl,ls1021a-qspi", "fsl,ls1012a-qspi";
> >> +                    #address-cells = <1>;
> >> +                    #size-cells = <0>;
> >> +                    reg = <0x0 0x1550000 0x0 0x10000>,
> >> +                            <0x0 0x40000000 0x0 0x10000000>;
> >> +                    reg-names = "QuadSPI", "QuadSPI-memory";
> >> +                    interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> >> +                    clock-names = "qspi_en", "qspi";
> >> +                    clocks = <&clockgen 4 1>, <&clockgen 4 1>;
> >> +                    big-endian;
> >> +                    fsl,qspi-has-second-chip;
> >
> > Undocumented property?
> 
> Both properties, "fsl,qspi-has-second-chip" and "big-endian" are deprecated.

Will remove both in next version
> 
> See:
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.ke
> rnel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2
> Fcommit%2F%3Fid%3D78df30808961cd32f0517c7469886386b0680852&amp;d
> ata=02%7C01%7Ckuldeep.singh%40nxp.com%7C5f9556e9b9b943c5568608d6
> df5d2e40%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6369419886
> 33482881&amp;sdata=CDxhRylo%2FLO2rHtEUu5DhtFiBr%2BWFRQl0%2BJFVJ
> T7y%2B0%3D&amp;reserved=0
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
