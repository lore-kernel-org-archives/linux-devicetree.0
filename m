From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: fsl: Fix improperly quoted stdout-path values
Date: Tue, 30 Oct 2018 16:25:28 -0300
Message-ID: <CAOMZO5BHnzYWPQ4NJmcFUe8NjPYyCR9HEUj2-wJ22zx9g7j=gg@mail.gmail.com>
References: <20181030190802.20722-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181030190802.20722-1-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Stefan Agner <stefan@agner.ch>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 30, 2018 at 4:08 PM Rob Herring <robh@kernel.org> wrote:
>
> A quoted label reference doesn't expand to the node path and is taken as
> a literal string. Dropping the quotes can fix this unless the baudrate
> string is appended in which case we have to use the alias.
>
> At least on VF610, the problem was masked by setting the console in
> bootargs. Use the alias syntax with baudrate parameter so we can drop
> setting the console in bootargs.
>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
