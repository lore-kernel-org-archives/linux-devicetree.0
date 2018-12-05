From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx6ul: Correct mask for GIC PPI interrupts
Date: Wed, 5 Dec 2018 12:14:05 +0800
Message-ID: <20181205041404.GM3987@dragon>
References: <1543858820-3354-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1543858820-3354-1-git-send-email-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, marc.zyngier@arm.com, liviu.dudau@arm.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 03, 2018 at 03:40:19PM -0200, Fabio Estevam wrote:
> The GIC_CPU_MASK_SIMPLE() macro should take as its argument the actual
> number of CPU cores the interrupt controller is wired to.
> 
> i.MX6UL contains a single Cortex-A7, hence the second interrupt specifier
> cell for Private Peripheral Interrupts should use "GIC_CPU_MASK_SIMPLE(1)".
> 
> Tested on a imx6ul-evk.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Dropped RFC patches (shouldn't be applied at all, sorry), and applied
these two.

Shawn
