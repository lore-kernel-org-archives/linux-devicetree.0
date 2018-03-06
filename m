From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: i.MX25: define SSI FIFO depth
Date: Tue, 6 Mar 2018 19:04:31 -0300
Message-ID: <CAOMZO5DAxDixb-mkTefd39bo6qeyNrdqd0ZxSmCUDYtKSdNrZg@mail.gmail.com>
References: <1520373499-13623-1-git-send-email-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520373499-13623-1-git-send-email-martin@kaiser.cx>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kaiser <martin@kaiser.cx>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 6, 2018 at 6:58 PM, Martin Kaiser <martin@kaiser.cx> wrote:
> According to the i.MX25 reference manuals, each SSI has four FIFOs. All
> of those FIFOs can store up to 15 entries.
>
> The fsl_ssi driver's internal default for the FIFO depth in 8. Set our
> non-default FIFO depth explicitly in the Device Tree.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
