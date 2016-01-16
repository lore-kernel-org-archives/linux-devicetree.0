From: Duc Dang <dhdang@apm.com>
Subject: [PATCH v4 0/3] mailbox: Add APM X-Gene platform mailbox driver
Date: Fri, 15 Jan 2016 18:57:16 -0800
Message-ID: <cover.1452912126.git.dhdang@apm.com>
References: <CABb+yY2zHycEmsVvp8OFwpJ1PZgrEPpV-oOe56wgFJ=EE0nTcg@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABb+yY2zHycEmsVvp8OFwpJ1PZgrEPpV-oOe56wgFJ=EE0nTcg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patches@apm.com, Duc Dang <dhdang@apm.com>
List-Id: devicetree@vger.kernel.org

APM X-Gene SoC has a mailbox controller that provides
communication mechanism for X-Gene Arm64 cores to communicate
with X-Gene SoC's Cortex M3 (SLIMpro) processor.

X-Gene mailbox controller provides 8 mailbox channels, with
each channel has a dedicated interrupt line.

Changes since v3:
        - Rebase over v4.4
        - Remove 'id' in slimpro_mbox_chan structure
        - Remove functions that are only called once
        and fold them into the other callers
        - Remove void* pointer type cast
        - Relax the number of mailbox IRQs condition
	- Fix error and address comment in documentation
	(xgene-slimpro-mailbox.txt)

Changes since v2:
        - Rebase Feng's patch set over v4.3-rc5
        - Remove uneccessary 'inline' in function definition
        - Use module_platform_driver instead of subsys_initcall
        - Minor coding stype clean up

Changes since v1:
        - Add ACPI support
        - Use defines for reg offset

Duc Dang (3):
  mailbox: Add support for APM X-Gene platform mailbox driver
  Documentation: mailbox: Add APM X-Gene SLIMpro mailbox dts
    documentation
  arm64: dts: mailbox device tree node for APM X-Gene platform.

 .../bindings/mailbox/xgene-slimpro-mailbox.txt     |  35 +++
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |  14 ++
 drivers/mailbox/Kconfig                            |   9 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/mailbox-xgene-slimpro.c            | 265 +++++++++++++++++++++
 5 files changed, 325 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/xgene-slimpro-mailbox.txt
 create mode 100644 drivers/mailbox/mailbox-xgene-slimpro.c

-- 
1.9.1
