From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: imx31: add device tree description of basic
 controllers
Date: Wed, 4 Jul 2018 22:05:45 -0300
Message-ID: <CAOMZO5AWr=o1xgD5m7Q6SwrXgf__aVtXTk2GHFV_CryfV4tGiQ@mail.gmail.com>
References: <20180703192934.6080-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180703192934.6080-1-vz@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Tue, Jul 3, 2018 at 4:29 PM, Vladimir Zapolskiy <vz@mleia.com> wrote:
> The changeset combines a number of essential updates to support device tree
> on Freescale i.MX31 powered boards:
> * removal of bogus RNGA registration for i.MX31 (device tree only),
> * the core controllers on the i.MX31 SoC are now properly described,
> * for reference and testing I add basic support of LogicPD MX31Lite board.
>
> There are some missing compatibles in the change 2/3, however at the moment
> I assume that either adding the values can be omitted or deferred, here is
> the exact list:
> * "fsl,imx31-pata"
> * "fsl,imx31-rtc"
> * "fsl,imx31-nand"
> * "fsl,imx31-weim"
>
> To test the changes I used a LogicPD reference board, however note that
> still I have to add a workaround to the old known issue within imx-wdt

Hopefully you and Uwe can reach an agreement on the imx31 watchdog fix :-)
