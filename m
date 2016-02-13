From: Duc Dang <dhdang@apm.com>
Subject: [PATCH v6 0/3] mailbox: Add APM X-Gene platform mailbox driver
Date: Fri, 12 Feb 2016 19:39:25 -0800
Message-ID: <cover.1455333720.git.dhdang@apm.com>
References: <CANLsYkxPnFCuJLyKsHnXKdbvAwNurtgQgJ-WF+bD26+8EjkfJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CANLsYkxPnFCuJLyKsHnXKdbvAwNurtgQgJ-WF+bD26+8EjkfJw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, Duc Dang <dhdang@apm.com>, patches@apm.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

APM X-Gene SoC has a mailbox controller that provides
communication mechanism for X-Gene Arm64 cores to communicate
with X-Gene SoC's Cortex M3 (SLIMpro) processor.

X-Gene mailbox controller provides 8 mailbox channels, with
each channel has a dedicated interrupt line.

Changes since v5:
	- Add more description into SlimPRO
	mailbox data structure

Changes since v4:
        - Rebase over v4.5-rc1
        - Fix section mismatch warning during compiling
        - Correctly print channel number when there is
        no IRQ for that channel
        - Change node name to mailbox@10540000
	- Correct the number of IRQs in documentation

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
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |  14 +
 drivers/mailbox/Kconfig                            |   9 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/mailbox-xgene-slimpro.c            | 284 +++++++++++++++++++++
 5 files changed, 344 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/xgene-slimpro-mailbox.txt
 create mode 100644 drivers/mailbox/mailbox-xgene-slimpro.c

-- 
1.9.1
