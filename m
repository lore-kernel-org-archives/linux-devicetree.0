From: Stefan Schaeckeler <schaecsn@gmx.net>
Subject: [PATCH 0/2] Add support for the Aspeed AST2500 SoC EDAC driver.
Date: Sun, 16 Dec 2018 22:01:55 -0800
Message-ID: <1545026517-64069-1-git-send-email-schaecsn@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-edac@vger.kernel.org
Cc: Stefan M Schaeckeler <schaecsn@gmx.net>
List-Id: devicetree@vger.kernel.org

From: Stefan M Schaeckeler <schaecsn@gmx.net>

Add support for the Aspeed AST2500 SoC EDAC driver.

Note, I only have access to AST2500 hardware and documentation. The AST2500
documentation explicitly states that the sdram controller is not backward
compatible with AST2400 and hence this driver is not supporting it.

Best, Stefan


Stefan M Schaeckeler (2):
  EDAC: Add Aspeed AST2500 EDAC driver
  dt-bindings: edac: Aspeed AST2500

 .../bindings/edac/aspeed-sdram-edac.txt       |  34 ++
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |   7 +
 drivers/edac/Kconfig                          |   7 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/aspeed_edac.c                    | 457 ++++++++++++++++++
 6 files changed, 512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt
 create mode 100644 drivers/edac/aspeed_edac.c

-- 
2.19.1
