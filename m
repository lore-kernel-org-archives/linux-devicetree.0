From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [BISECTED REGRESSION] v4.8-rc: gpio-leds broken on OCTEON
Date: Tue, 23 Aug 2016 23:36:05 +0300
Message-ID: <20160823203605.GA12169@raspberrypi.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney@caviumnetworks.com>, Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>
List-Id: devicetree@vger.kernel.org

Hi,

gpio-leds fails to probe on OCTEON with v4.8-rc3 and when using
arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts. Leds still
worked with v4.7.

I bisected this to:

	commit 15cc2ed6dcf91a8658e084be4e140147161819d7
	Author: Jon Hunter <jonathanh@nvidia.com>
	Date:   Mon Jun 20 14:49:18 2016 +0100

	of/irq: Mark initialised interrupt controllers as populated

I have no idea how this is related to gpio-leds, except that on OCTEON
DTBs the gpio node is also interrupt controller...

Any ideas?

A.
