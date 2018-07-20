From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: imx6qdl: Add Engicam i.Core 1.5 MX6
Date: Fri, 20 Jul 2018 16:07:50 -0300
Message-ID: <CAOMZO5B=pR7UMdd4-zymKm27jM9a=qb6u5zXjOahAxguoQ3kbg@mail.gmail.com>
References: <1532081765-29910-1-git-send-email-jacopo@jmondi.org>
 <1532081765-29910-2-git-send-email-jacopo@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1532081765-29910-2-git-send-email-jacopo@jmondi.org>
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
> The 1.5 version of Engicam's i.Core MX6 CPU module features a different clock
> provider for the ethernet's PHY interface. Adjust the FEC ptp clock to
> reference CLK_ENET_REF clock source, and set SION bit of
> MX6QDL_PAD_GPIO_16__ENET_REF_CLK to adjust the input path of that pin.
>
> The newly introduced imx6ql-icore-1.5.dtsi allows to collect in a single
> place differences between version '1.0' and '1.5' of the module.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
