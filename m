From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH V2 6/8] dts: imx: add common imx7ulp dtsi support
Date: Thu, 25 Oct 2018 16:54:57 +0000
Message-ID: <AM0PR04MB42113E80FC62AE9B1D72ADA580F70@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1540295058-26090-1-git-send-email-aisheng.dong@nxp.com>
 <1540295058-26090-7-git-send-email-aisheng.dong@nxp.com>
 <CAOMZO5ArziSkimJvKMFPR-RZwWywLmzjpmvAFT9fB0fp_J_YZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5ArziSkimJvKMFPR-RZwWywLmzjpmvAFT9fB0fp_J_YZw@mail.gmail.com>
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
To: Fabio Estevam <festevam@gmail.com>
Cc: "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Dong Aisheng <dongas86@gmail.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Fabio Estevam [mailto:festevam@gmail.com]
> Sent: Friday, October 26, 2018 12:44 AM
[...]
> On Tue, Oct 23, 2018 at 8:55 AM A.s. Dong <aisheng.dong@nxp.com> wrote:
> 
> > +               gpio_ptc: gpio@40ae0000 {
> > +                       compatible = "fsl,vf610-gpio";
> 
> This should be:
> 
> compatible = "fsl,imx7ulp-gpio", "fsl,vf610-gpio";

That's true.
Thanks for reminder.

Regards
Dong Aisheng
