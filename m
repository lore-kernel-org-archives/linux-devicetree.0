From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH V2 2/4] arm64: dts: imx: add imx8qxp support
Date: Thu, 18 Oct 2018 02:32:49 +0000
Message-ID: <AM0PR04MB4211160A6355E226E6033B2380F80@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539527419-23613-1-git-send-email-aisheng.dong@nxp.com>
 <1539527419-23613-3-git-send-email-aisheng.dong@nxp.com>
 <CAOMZO5BEwNQy0HA80qOzm_w-c63tFK1eL+cOHNCxKYq9PHGsqw@mail.gmail.com>
 <AM0PR04MB4211ECC04FD48918E9DFBAB880FD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181018005130.GA8173@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181018005130.GA8173@bogus>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Dong Aisheng <dongas86@gmail.com>, Fabio Estevam <festevam@gmail.com>, Will Deacon <will.deacon@arm.com>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX /
 MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

[...]

> > > > +               imx8qx-pm {
> > > > +                       compatible = "fsl,scu-pd";
> > > > +                       #address-cells = <1>;
> > > > +                       #size-cells = <0>;
> > > > +
> > > > +                       pd_lsio: lsio-power-domain {
> > > > +                               #power-domain-cells = <0>;
> > > > +                               #address-cells = <1>;
> > > > +                               #size-cells = <0>;
> > > > +
> > > > +                               pd_lsio_pwm0: lsio-pwm0@191 {
> > > > +                                       reg = <191>;
> > >
> > > The number after @ is in hex, so the reg property should be 0x191.
> >
> > Thanks for the reminder.
> > The PD ID is defined in DEC. So I will change them all into HEX later manually.
> >
> > BTW, this seems like error prone and checkpatch can't report it.
> 
> checkpatch doesn't really check dts files.
> 
> But if it did would you have noticed? Because there is at least one checkpatch
> issue with your author name and S-o-b name not matching.
> 
> > And I notice many similar users in kernel with the same issue:
> > arch/arm/boot/dts/tps65910.dtsi
> > arch/arm/boot/dts/tegra124-nyan.dtsi
> > arch/arm/boot/dts/rk3288.dtsi
> 
> At least I2C and SPI are now checked by dtc. 'simple-bus' children were too,
> but silently broke and only recently got fixed in upstream dtc.
> I've not pulled that into the kernel yet, but you can build dtbs using an external
> copy of dtc. And guess what, there are *lots* of warnings.
> 

Thanks for the info. Will try it.

Regards
Dong Aisheng

> Rob
