From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH v2 15/15] arm64: defconfig: add imx8qm mek support
Date: Wed, 17 Jul 2019 08:16:21 +0000
Message-ID: <AM0PR04MB4211AF3216E3A641DA80B6C680C90@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1563290089-11085-1-git-send-email-aisheng.dong@nxp.com>
 <1563290089-11085-16-git-send-email-aisheng.dong@nxp.com>
 <CAOMZO5CTmAdxRK4FZu+Lw3WxkBzdufNJ=gE11TFSoizdYwXnbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5CTmAdxRK4FZu+Lw3WxkBzdufNJ=gE11TFSoizdYwXnbw@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Dong Aisheng <dongas86@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> From: Fabio Estevam <festevam@gmail.com>
> Sent: Wednesday, July 17, 2019 3:25 AM
> 
> Hi Dong,
> 
> On Tue, Jul 16, 2019 at 12:38 PM Dong Aisheng <aisheng.dong@nxp.com>
> wrote:
> >
> > add imx8qm mek support
> 
> The Subject and commit log does not match with the patch content.

Because mx8qm shares the most things from mx8qxp which has already
been enabled in defconfig. The only one left is pinctrl driver.
I would update the title a bit to be more specific in next version.

Regards
Aisheng
