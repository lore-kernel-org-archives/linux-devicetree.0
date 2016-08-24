From: "Steven J. Hill" <Steven.Hill@cavium.com>
Subject: Re: [BISECTED REGRESSION] v4.8-rc: gpio-leds broken on OCTEON
Date: Wed, 24 Aug 2016 11:42:00 -0500
Message-ID: <57BDCE58.20200@cavium.com>
References: <20160823203605.GA12169@raspberrypi.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20160823203605.GA12169@raspberrypi.musicnaut.iki.fi>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, David Daney <ddaney@caviumnetworks.com>, Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>
List-Id: devicetree@vger.kernel.org

On 08/23/2016 03:36 PM, Aaro Koskinen wrote:
> Hi,
>
> gpio-leds fails to probe on OCTEON with v4.8-rc3 and when using
> arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts. Leds still
> worked with v4.7.
>
> I bisected this to:
>
> 	commit 15cc2ed6dcf91a8658e084be4e140147161819d7
> 	Author: Jon Hunter <jonathanh@nvidia.com>
> 	Date:   Mon Jun 20 14:49:18 2016 +0100
>
> 	of/irq: Mark initialised interrupt controllers as populated
>
> I have no idea how this is related to gpio-leds, except that on OCTEON
> DTBs the gpio node is also interrupt controller...
>
Hey Aaro.

It is actually two patches that cause the breakage. The other is:

    commit e55aeb6ba4e8cc3549bff1e75ea1d029324bce21
    of/irq: Mark interrupt controllers as populated before initialisation

I needed to revert both of these in order to get MMC working on our 71xx 
and 78xx boards. For our MMC, I got error messages from the MMC core of 
"Invalid POWER GPIO" until I applied the second patch. I will have a fix 
worthy of upstreaming today which will be posted today.

Steve
