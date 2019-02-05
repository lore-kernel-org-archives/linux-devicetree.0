From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH 0/2] Fix espressobin ethernet support on mainline u-boot
Date: Wed, 06 Feb 2019 00:22:58 +0100
Message-ID: <87ef8l95wt.fsf@FE-laptop>
References: <20190128200728.17747-1-repk@triplefau.lt>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190128200728.17747-1-repk@triplefau.lt>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, Remi Pommarel <repk@triplefau.lt>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Remi,
 
 On lun., janv. 28 2019, Remi Pommarel <repk@triplefau.lt> wrote:

> This patchset fixes ethernet and mv88e6341 switch support on espressobin
> board when bootloader does not initialize needed registers.
>
> This patchset should be applied along with pinctrl fixes from [1] which
> have been merged in next branch of linux-pinctrl tree.
>
> [1] https://lkml.org/lkml/2018/12/21/507
>
> Remi Pommarel (2):
>   arm64: dts: armada-3720-espressobin: Configure RGMII and SMI pins
>   arm64: dts: armada-3720-espressobin: Set mv88e6341 cpu port as
>     RGMII-ID
>

Both patches applied to mvebu/dt64

Thanks,

Gregory

>  arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts | 7 +++++++
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi            | 5 +++++
>  2 files changed, 12 insertions(+)
>
> -- 
> 2.20.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
