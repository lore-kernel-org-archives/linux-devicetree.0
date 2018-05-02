From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v5 14/26] ARM: shmobile: defconfig: Enable RENESAS_WDT_GEN
Date: Wed, 2 May 2018 11:38:21 +0200
Message-ID: <20180502093821.m276vxqixob47e4p@verge.net.au>
References: <1518457475-4480-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1518457475-4480-15-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1518457475-4480-15-git-send-email-fabrizio.castro@bp.renesas.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Wim Van Sebroeck <wim@iguana.be>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das@bp.renesas.com>, Stephen Boyd <sboyd@codeaurora.org>, Guenter Roeck <linux@roeck-us.net>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 12, 2018 at 05:44:23PM +0000, Fabrizio Castro wrote:
> R-Car Gen2 and RZ/G1 platforms come with a watchdog IP, therefore enable
> its driver by default.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied.
