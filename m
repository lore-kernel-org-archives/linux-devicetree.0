From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6q-icore-mipi: Use 1.5 version of i.Core
 MX6
Date: Fri, 20 Jul 2018 16:10:22 -0300
Message-ID: <CAOMZO5B-X48v9-YmeLd91TZf7-+p1w3hKdXZvrnq0gn3yFxPuQ@mail.gmail.com>
References: <1532081765-29910-1-git-send-email-jacopo@jmondi.org>
 <1532081765-29910-3-git-send-email-jacopo@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1532081765-29910-3-git-send-email-jacopo@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Russell King - ARM Linux <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 20, 2018 at 7:16 AM, Jacopo Mondi <jacopo@jmondi.org> wrote:
> The "EDIMM STARTER KIT i.Core 1.5 MIPI Evaluation" is based on the 1.5 version
> of the i.Core MX6 cpu module. The 1.5 version differs from the original one for
> a few details, including the ethernet PHY interface clock provider.
>
> With this commit, the ethernet interface works properly:
> SMSC LAN8710/LAN8720 2188000.ethernet-1:00: attached PHY driver
>
> While before using the 1.5 version, ethernet failed to startup do to un-clocked
> PHY interface:
> fec 2188000.ethernet eth0: could not attach to PHY
>
> Fixes: commit 3fe088357731 ("ARM: dts: imx6q: Add Engicam i.CoreM6 1.5 Quad/Dual MIPI starter kit support")

Nit: the "commit" word should be removed from the Fixes line.

>

Also, no need to add a blank line after the Fixes tag.

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
