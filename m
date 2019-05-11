From: Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH v8 1/3] arm64: dts: fsl: librem5: Add a device tree for
 the Librem5 devkit
Date: Sat, 11 May 2019 10:48:42 -0700
Message-ID: <592c6d80582d0571bc49cfaa114adc83@www.akkea.ca>
References: <20190501225719.3257-1-angus@akkea.ca>
 <20190501225719.3257-2-angus@akkea.ca>
 <CAOMZO5APMf+iuJuqXCrMNX0Ud73iANXvEs+Y59iH+g6tuMX++Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5APMf+iuJuqXCrMNX0Ud73iANXvEs+Y59iH+g6tuMX++Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX /
 MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On 2019-05-11 08:34, Fabio Estevam wrote:
> Hi Angus,
> 
> This looks good. Only minor issues:
> 
> On Wed, May 1, 2019 at 7:57 PM Angus Ainslie (Purism) <angus@akkea.ca> 
> wrote:
>> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
>> @@ -0,0 +1,823 @@
>> +/* SPDX-License-Identifier: GPL-2.0+
> 
> This should be
> // SPDX-License-Identifier: GPL-2.0+
> 
> as pointed out by checkpatch.
> 
>> +       reg_1v8_p: regulator-1V8-P {
> 
> Maybe lowercase instead?
> 

Ok, I'll fix those 2.

>> +       wifi_pwr_en: wifi-en {
>> +               compatible = "regulator-fixed";
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&pinctrl_wifi_pwr_en>;
>> +               regulator-name = "WIFI_EN";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +               gpio = <&gpio3 5 GPIO_ACTIVE_HIGH>;
>> +               enable-active-high;
>> +               regulator-always-on;
> 
> Do you really needs all these regulators to be 'regulator-always-on'?
> 

Unfortunately yes.

>> +&i2c1 {
>> +       clock-frequency = <400000>;
> 
> Maybe you could use 100kHz instead in order to avoid the problem
> described by the following i.MX8M erratum:
> 
> e7805: I2C: When the I2C clock speed is configured for 400 kHz, the
> SCL low period violates the I2C spec of 1.3 uS min
> https://www.nxp.com/docs/en/errata/IMX8MDQLQ_1N14W.pdf
> 

I discovered this a few days ago.

https://source.puri.sm/angus.ainslie/linux-next/commit/10c9d9e55aba0e179166001b9292e37a37bfe0ea

You're right 100kHz is a better choice.

>> +&usdhc2 {
>> +       pinctrl-names = "default", "state_100mhz", "state_200mhz";
>> +       pinctrl-0 = <&pinctrl_usdhc2>;
>> +       pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
>> +       pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
>> +       bus-width = <4>;
>> +       vmmc-supply = <&reg_usdhc2_vmmc>;
>> +       power-supply = <&wifi_pwr_en>;
>> +
> 
> Unneeded blank line.

I'll fix it for the next rev.

Thanks
Angus
