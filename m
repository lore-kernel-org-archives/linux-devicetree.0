From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mq: Fix boot from eMMC
Date: Fri, 25 Jan 2019 10:39:23 -0200
Message-ID: <CAOMZO5CLdyP6ZHLqOrcDSq4CV3vjt1aYsesyCf7hb-8e0BuNvg@mail.gmail.com>
References: <20190122165546.11712-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190122165546.11712-1-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, abailon@baylibre.com, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Carlo,

On Tue, Jan 22, 2019 at 2:57 PM Carlo Caione <ccaione@baylibre.com> wrote:
>
> The boot from eMMC is currently broken on the NXP i.MX8MQ EVK board.
> When trying to boot from eMMC it fails with:
>
> ...
> [    1.271938] mmc1: Tuning failed, falling back to fixed sampling clock
> [    1.287429] print_req_error: I/O error, dev mmcblk1, sector 1 flags 0
> [    1.306833] mmc1: Tuning failed, falling back to fixed sampling clock
> [    1.322325] print_req_error: I/O error, dev mmcblk1, sector 2 flags 0
> [    1.329559] Buffer I/O error on dev mmcblk1, logical block 0, async page read
> [    1.336714]  mmcblk1: unable to read partition table
> ...
>
> The problem is the result of a partial misconfiguration of the pins and
> the missing assigned clock rate.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Thanks for the fix.

It would be nice to add a Fixes tag so that it can reach 5.0-rc.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
