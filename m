Return-Path: <shawnguo@kernel.org>
Date: Mon, 22 Jul 2019 14:40:52 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: imx8m: Add ddr-pmu nodes
Message-ID: <20190722064051.GY3738@dragon>
References: <cover.1562230183.git.leonard.crestez@nxp.com>
 <b8aeb9caf6c2380a7c8f65b19e420e18498d5c1a.1562230183.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8aeb9caf6c2380a7c8f65b19e420e18498d5c1a.1562230183.git.leonard.crestez@nxp.com>
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Will Deacon <will@kernel.org>, Frank Li <Frank.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Jacky Bai <ping.bai@nxp.com>, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Jul 04, 2019 at 11:53:21AM +0300, Leonard Crestez wrote:
> The same ddr perfomance counter IP from 8qxp is also available on imx8m
> series so add it to dts.
> 
> Tested with `perf stat` and `memtester` on imx8mm-evk and obtained
> plausible results.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Applied, thanks.
