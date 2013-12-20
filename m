From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCHv1 0/3] Enable ISL12057 RTC chip in ReadyNAS .dts files
Date: Thu, 19 Dec 2013 22:17:20 -0500
Message-ID: <20131220031720.GC2609@titan.lakedaemon.net>
References: <cover.1387490258.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <cover.1387490258.git.arno@natisbad.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 19, 2013 at 11:01:56PM +0100, Arnaud Ebalard wrote:
> Hi Jason,
> 
> Now that support for ISL12057 RTC chip is on track for in v3.14, the
> three patches in this series simply reference the chip in NETGEAR
> ReadyNAS 102, 104 and 2120 .dts files so that the device stop booting
> in the 70's. 
> 
> Jason, can you queue those for v3.14? The patches are based on your
> mvebu/dt branch to simplify your work.
> 
> Arnaud Ebalard (3):
>   ARM: mvebu: Enable ISL12057 RTC chip in ReadyNAS 102 .dts file
>   ARM: mvebu: Enable ISL12057 RTC chip in ReadyNAS 104 .dts file
>   ARM: mvebu: Enable ISL12057 RTC chip in ReadyNAS 2120 .dts file
> 
>  arch/arm/boot/dts/armada-370-netgear-rn102.dts | 5 +++++
>  arch/arm/boot/dts/armada-370-netgear-rn104.dts | 5 +++++
>  arch/arm/boot/dts/armada-xp-netgear-rn2120.dts | 5 +++++
>  3 files changed, 15 insertions(+)

Whole series applied to mvebu/dt

thx,

Jason.
