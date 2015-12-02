From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 net-next 0/2] ravb: More compatibility strings
Date: Wed,  2 Dec 2015 14:58:31 +0900
Message-ID: <1449035913-9129-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, linux-sh@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

this short series adds generic gen2 and gen3, and soc-specific
compatibility strings for the missing gen2 SoCs.

Key Changes in v2:
* Include "rcar-" in generic bindings

Simon Horman (2):
  ravb: add fallback compatibility strings
  ravb: add device tree support for r8a779[123]

 Documentation/devicetree/bindings/net/renesas,ravb.txt | 12 +++++++++++-
 drivers/net/ethernet/renesas/ravb_main.c               |  2 ++
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.1.4
