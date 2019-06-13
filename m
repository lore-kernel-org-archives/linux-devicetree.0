From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH V12 2/4] drivers/perf: imx_ddr: Add ddr performance
 counter support
Date: Thu, 13 Jun 2019 12:23:20 +0100
Message-ID: <20190613112320.GA18966@fuggles.cambridge.arm.com>
References: <1556736193-29411-1-git-send-email-Frank.Li@nxp.com>
 <1556736193-29411-2-git-send-email-Frank.Li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1556736193-29411-2-git-send-email-Frank.Li@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frank Li <frank.li@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 01, 2019 at 06:43:29PM +0000, Frank Li wrote:
> Add ddr performance monitor support for iMX8QXP
> 
> There are 4 counters for ddr perfomance events.
> counter 0 is dedicated for cycles.
> you choose any up to 3 no cycles events.
> 
> for example:
> 
> perf stat -a -e imx8_ddr0/read-cycles/,imx8_ddr0/write-cycles/,imx8_ddr0/precharge/ ls
> perf stat -a -e imx8_ddr0/cycles/,imx8_ddr0/read-access/,imx8_ddr0/write-access/ ls

I've pushed patches 1, 2 and 4 out with some minor tweaks to:

https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-next/perf

I'll leave the actual .dts change to go via the soc tree, since last time
I took one of those it just resulted in conflicts.

Frank, Andrey: Please could you try to run the perf fuzzer on this before
it lands in mainline? It has a good track record of finding nasty PMU driver
bugs, but it obviously requires access to hardware which implements the PMU:

http://web.eece.maine.edu/~vweaver/projects/perf_events/fuzzer/

Cheers,

Will
