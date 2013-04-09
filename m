From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 0/5] i.MX53 TVE clock patches
Date: Tue, 9 Apr 2013 20:49:16 +0800
Message-ID: <20130409124914.GH5044@S2101-09.ap.freescale.net>
References: <1365432383-7787-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1365432383-7787-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree-discuss@lists.ozlabs.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 08, 2013 at 04:46:18PM +0200, Philipp Zabel wrote:
> Hi,
> 
> the first two are just cleanups, the following three patches are changes
> to the i.MX53 clock tree that are necessary to use the TVEv2 module as
> VGA output on the Freescale i.MX53-QSB or TQ MBa53 boards.
> 
> regards
> Philipp
> 
> ---
>  Documentation/devicetree/bindings/clock/imx5-clock.txt |  1 -
>  arch/arm/mach-imx/clk-imx51-imx53.c                    | 17 ++++++++---------
>  2 files changed, 8 insertions(+), 10 deletions(-)

All 5 patches applied, thanks.
