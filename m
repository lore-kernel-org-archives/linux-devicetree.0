From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sr-som: fix AR8035 phy interface mode
Date: Wed, 19 Jun 2019 20:06:49 -0300
Message-ID: <CAOMZO5BfbGoh6N42xsv2WBz3cHot8VOqa-4rx0Y8YczC2Xzz0g@mail.gmail.com>
References: <E1hdjBO-0007Yt-9M@rmk-PC.armlinux.org.uk>
 <20190619223727.zgfypqxg7bpxtduh@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190619223727.zgfypqxg7bpxtduh@shell.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Russell,

On Wed, Jun 19, 2019 at 7:37 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Wed, Jun 19, 2019 at 11:35:58PM +0100, Russell King wrote:
> > A change to the AT803x driver fixed the handling of the phy interface
> > mode, but this breaks all platforms that use "rgmii" as the mode in
> > their DT.  Fix the Solidrun platforms.
> >
> > Fixes: 6d4cd041f0af ("net: phy: at803x: disable delay only for RGMII mode")
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
>
> Note that without this, SolidRun Hummingboard and Cubox-i platforms
> have no working ethernet with at least 5.1 kernels, which is a
> regression.

Commit 0672d22a1924 ("ARM: dts: imx: Fix the AR803X phy-mode") fixes
this issue in mainline and it has already been applied to the 5.1
stable tree as well.

Thanks
