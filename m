From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: [PATCH 0/2] ARC: [plat-hsdk]: GMAC DT Bindings Improvements
Date: Mon, 20 May 2019 15:43:11 +0200
Message-ID: <cover.1558359611.git.joabreu@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>
List-Id: devicetree@vger.kernel.org

Add two missing bindings.

Cc: Joao Pinto <jpinto@synopsys.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>

Jose Abreu (2):
  ARC: [plat-hsdk]: Add missing multicast filter bins number to GMAC
    node
  ARC: [plat-hsdk]: Add missing FIFO size entry in GMAC node

 arch/arc/boot/dts/hsdk.dts | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.7.4
