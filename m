From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V3 09/10] dts: fsl: add imx7ulp evk support
Date: Thu, 1 Nov 2018 13:01:00 -0300
Message-ID: <CAOMZO5CSLC+Pntt=Y5MaOD_=Va__v+KSgQ2kNSizVJt3i829dg@mail.gmail.com>
References: <1540996688-23681-1-git-send-email-aisheng.dong@nxp.com>
 <1540996688-23681-10-git-send-email-aisheng.dong@nxp.com>
 <CAOMZO5AZejEAHeB0hQ9T5U2ZJ7MXK=BYm8jY+yyZjbDHo4utGA@mail.gmail.com>
 <CAOMZO5CGsVYX_xYud_JDTikWAR6guW8-pfPhsBTG7MFbjdUtiw@mail.gmail.com>
 <VI1PR04MB422271C6CA5F7E000BFDE1A580CE0@VI1PR04MB4222.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <VI1PR04MB422271C6CA5F7E000BFDE1A580CE0@VI1PR04MB4222.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Dong Aisheng <dongas86@gmail.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 1, 2018 at 12:53 PM A.s. Dong <aisheng.dong@nxp.com> wrote:

> Can you tell which version were you looking at?
> From my version SPF-29163_A1, it's populated by default.

Mine is sch-29163-b and it shows both micro SD card and eMMC on the schematics.

On my board I see only the micro SD card populated, not the eMMC.

Also, if you are describing the eMMC then why do you pass the card
detect property and only 4 data lines?

SD0_nRST is only connected to the eMMC card.

eMMC does not have card detect signal and it uses 8 data lines, so
clearly there is something inconsistent in your dts.

What exactly do you want to describe: the SD card or the eMMC?
