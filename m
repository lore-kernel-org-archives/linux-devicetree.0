From: Aaro Koskinen <aaro.koskinen@nokia.com>
Subject: [BISECTED REGRESSION] v4.8-rc: DT/OCTEON driver probing broken
Date: Tue, 16 Aug 2016 18:00:57 +0300
Message-ID: <20160816150056.GD18731@ak-desktop.emea.nsn-net.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>
Cc: linux-kernel@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>
List-Id: devicetree@vger.kernel.org

Hi,

Commit 44a7185c2ae6 ("of/platform: Add common method to populate default
bus") added new arch_initcall of_platform_default_populate_init() that
will be called before device_initcall octeon_publish_devices(). Now the
of_platform_bus_probe() called in octeon_publish_devices() is apparently
doing nothing:

[   52.331353] calling  octeon_publish_devices+0x0/0x14 @ 1
[   52.331358] OF: of_platform_bus_probe()
[   52.331362] OF:  starting at: /
[   52.331378] OF: of_platform_bus_create() - skipping /soc@0, already populated
[   52.331394] initcall octeon_publish_devices+0x0/0x14 returned 0 after 29 usecs

This also means that USB etc. won't get probed.

Any ideas what would be the proper fix for this? Changing
octeon_publish_devices() to arch_initcall seems to work but that may be
a bit hackish... Also, there might be also other MIPS boards affected
(arch/mips/netlogic/xlp/dt.c, arch/mips/mti-malta/malta-dt.c).

A.
