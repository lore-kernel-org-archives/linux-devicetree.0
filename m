From: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6sx-udoo-neo: enable i2c-2 and i2c-4 for
 onboard sensors
Date: Mon, 16 Jul 2018 15:43:21 +0100
Message-ID: <CALeDE9N5AnQba5LirHegWgz2_3Rr6cCT_ttTUtg38OdvdegpFA@mail.gmail.com>
References: <20180713171151.24699-1-pbrobinson@gmail.com>
 <CAOMZO5B+1atjr3Ur7EGMJSEbqT8zqWdKZWNHrkyCGvgGM4nJFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5B+1atjr3Ur7EGMJSEbqT8zqWdKZWNHrkyCGvgGM4nJFg@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On Fri, Jul 13, 2018 at 7:08 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Peter,
>
> On Fri, Jul 13, 2018 at 2:11 PM, Peter Robinson <pbrobinson@gmail.com> wrote:
>
>> +&i2c4 { /* Onboard Motion sensors */
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_i2c4>;
>> +       clock-frequency = <100000>;
>> +       status = "okay";
>> +};
>
> Would it be possible to add i2c4 to the common dtsi file instead?
>
> I haven't checked the schematics, but if it is only the
> imx6sx-udoo-neo-basic.dts that does not have the i2c4 node, then
> maybe you could add i2c4 to the dtsi and disable it inside
> imx6sx-udoo-neo-basic.dts?

Enabling it to turn around and then disable it again seemed counter
intuitive to me hence the way I did, the WiFi in done that way even
though it's not on all boards and I would imagine it would cause
errors on the devices where there isn't wifi although I don't have
those model(s) to verify.

Peter
