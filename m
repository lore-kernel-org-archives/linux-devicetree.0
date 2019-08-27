From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH 02/13] MIPS: Loongson64: Sepreate loongson2ef/loongson64
 code
Date: Wed, 28 Aug 2019 01:05:07 +0300
Message-ID: <20190827220506.GK30291@darkstar.musicnaut.iki.fi>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20190827085302.5197-3-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190827085302.5197-3-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Aug 27, 2019 at 04:52:51PM +0800, Jiaxun Yang wrote:
> As later model of GSx64 family processors including 2-series-soc have
> similar design with initial loongson3a while loongson2e/f seems less
> identical, we seprate loongson2e/f support code out of mach-loongson64
                ^^^^^^^

separate (typo in patch title as well)

> to make our life easier.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

[...]

> +config MACH_LOONGSON2EF

You need to update lemote2f_defconfig with his patch.

A.
