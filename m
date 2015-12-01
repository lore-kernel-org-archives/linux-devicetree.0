From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/2 net-next] ravb: More compat strings
Date: Tue,  1 Dec 2015 16:43:01 +0900
Message-ID: <1448955783-22806-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, linux-sh@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

this short series adds generic gen2 and gen3, and soc-specific compat strings
for the missing gen2 SoCs.

Simon Horman (2):
  ravb: Add fallback compatibility strings
  ravb: Add device tree support for r8a779[123]

 Documentation/devicetree/bindings/net/renesas,ravb.txt | 14 ++++++++++++--
 drivers/net/ethernet/renesas/ravb_main.c               |  2 ++
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.1.4
