From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx53-qsb-common: fix FEC pinmux config
Date: Sun, 29 Jan 2017 10:05:56 +0800
Message-ID: <20170129020554.GG5662@dragon>
References: <20170125052548.27402-1-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170125052548.27402-1-linux-kernel-dev@beckhoff.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel-dev@beckhoff.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Patrick Bruenn <p.bruenn@beckhoff.com>, trini@konsulko.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, sbabic@denx.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 25, 2017 at 06:25:48AM +0100, linux-kernel-dev@beckhoff.com wrote:
> From: Patrick Bruenn <p.bruenn@beckhoff.com>
> 
> The pinmux configuration in device tree was different from manual
> muxing in <u-boot>/board/freescale/mx53loco/mx53loco.c
> All pins were configured as NO_PAD_CTL(1 << 31), which was fine as the
> bootloader already did the correct pinmuxing for us.
> But recently u-boot is migrating to reuse device tree files from the
> kernel tree, so it seems to be better to have the correct pinmuxing in
> our files, too.
> 
> Signed-off-by: Patrick Bruenn <p.bruenn@beckhoff.com>

Applied, thanks.
