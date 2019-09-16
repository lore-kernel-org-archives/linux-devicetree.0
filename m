From: Oliver Graute <oliver.graute@gmail.com>
Subject: Re: [PATCH V3 00/15] arm64: dts: imx8: architecture improvement and
 adding imx8qm support
Date: Mon, 16 Sep 2019 13:22:28 +0200
Message-ID: <20190916112228.GE16292@optiplex>
References: <1568302252-28066-1-git-send-email-aisheng.dong@nxp.com>
 <20190913121608.GD16292@optiplex>
 <AM0PR04MB42117BD6A60E4FEA1456954080B30@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <AM0PR04MB42117BD6A60E4FEA1456954080B30@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dongas86@gmail.com" <dongas86@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 13/09/19, Aisheng Dong wrote:
> > From: Oliver Graute <oliver.graute@gmail.com>
> > Sent: Friday, September 13, 2019 8:16 PM
> > 
> > On 12/09/19, Dong Aisheng wrote:
> > > IMX SCU based platforms (e.g. MX8QM/MX8QXP) are comprised of a
> > number
> > > of SS (Subsystems), those SS may be shared between different SoCs
> > > while most of them can be reused like Devices Resources, Clocks, Power
> > domains and etc.
> > >
> > > This patch series aims to improve the MX8 architecture to comply with
> > > the HW design to save a lot of duplicated codes and benefits us a
> > > better maintainability and scalability in the future.
> > >
> > > This patch series depends on another clk new binding series:
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatc
> > >
> > hwork.kernel.org%2Fcover%2F11046287%2F&amp;data=02%7C01%7Caishen
> > g.dong
> > > %40nxp.com%7C2dffe4b2a0734c5a031408d738447876%7C686ea1d3bc2b
> > 4c6fa92cd9
> > >
> > 9c5c301635%7C0%7C1%7C637039739035971290&amp;sdata=JsAy8vUkkCp
> > n5HYh79oC
> > > vekH3SJAICg7VQnLMP01O3c%3D&amp;reserved=0
> > 
> > Thx for your update of this patch series. I'am running into the issue that my
> > linux next-20190904 unfortunately is not booting with it on my imx8QM
> > board. Kernel is just stuck during boot see below.
> > 
> > I applied your v5 of your clock binding patches series and applied this series in
> > v3. Your former two patch series worked well with next-20190716.
> > 
> > The last messages from the kernel are:
> > 
> > [    1.019208] imx-scu scu: mbox_request_channel_byname() could not
> > locate channel named "gip3"
> > [    1.027316] imx-scu scu: failed to request mbox chan gip3, ret -22
> > [    1.033480] imx-scu scu: failed to enable general irq channel: -22
> > [    1.039646] imx-scu scu: NXP i.MX SCU Initialized
> > [    1.047414] a35_clk: failed to get clock rate -22
> > [    1.058682]  lcd0-pwm0: failed to power up resource 188 ret -22
> > [    1.064314] imx-scu-clk: probe of pwm_clk failed with error -22
> > [    1.070538]  lcd0: failed to power up resource 187 ret -22
> > [    1.075690] imx-scu-clk: probe of lcd_clk failed with error -22
> > [    1.085965] mipi_csi0_core_clk: failed to attached the power domain -2
> > [    1.092359] mipi_csi0_esc_clk: failed to attached the power domain -2
> > [    1.098777] mipi_csi0_i2c0_clk: failed to attached the power domain -2
> > [    1.105278] mipi_csi0_pwm0_clk: failed to attached the power domain -2
> > [    1.115744] imx8qm-pinctrl scu:pinctrl: initialized IMX pinctrl driver
> > [    1.123923] gpio-mxc 5d080000.gpio: IRQ index 1 not found
> > [    1.130276] gpio-mxc 5d090000.gpio: IRQ index 1 not found
> > 
> > I see similar messages also with your older working patches, only the last two
> > lines are new errors.
> > 
> 
> Those warnings are because we are still missing some domains added into the
> pd driver support, it does not block the booting.
> 
> But I did miss to send another power domain patch to avoid gate of console domain
> which may result in the console hang.

Thx. This patch indeed solved my problem. So now its booting with
next-20190904 and your patch series.

Best regards,

Oliver
