From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2] arm64: dts: marvell: armada-37xx: reserve memory for
 ATF
Date: Fri, 29 Jun 2018 13:44:07 +0200
Message-ID: <20180629134407.112819d2@windsurf>
References: <20180626081701.27176-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180626081701.27176-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Victor Gu <xigu@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, 26 Jun 2018 10:17:01 +0200, Miquel Raynal wrote:
> From: Victor Gu <xigu@marvell.com>
> 
> The PSCI area should be reserved in Linux for PSCI operations such as
> suspend/resume.
> 
> Reserve 2MiB of memory which matches the area used by ATF (BL1, BL2,
> BL3x, see [1] in ATF source code). This covers all PSCI code and data
> area and is 2MiB aligned, which is required by Linux for huge pages
> handling.
> 
> Please note that this is a default setup allowing to perform PSCI
> operations with legacy bootloaders. Recent bootloaders should update the
> region size/position accordingly.
> 
> [1] plat/marvell/a3700/common/include/platform_def.h
> 
> Signed-off-by: Victor Gu <xigu@marvell.com>
> [miquel.raynal@bootlin.com: reword of commit message, comment in the DTSI]
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
