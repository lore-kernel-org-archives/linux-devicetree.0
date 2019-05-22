From: Puneet Saxena <puneets@nvidia.com>
Subject: [PATCH] ignore disabled memory-region nodes
Date: Wed, 22 May 2019 16:17:10 +0530
Message-ID: <1558522031-549-1-git-send-email-puneets@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pantelis.antoniou@konsulko.com, frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: treding@nvidia.com, vdumpa@nvidia.com, snikam@nvidia.com, jonathanh@nvidia.com, Puneet Saxena <puneets@nvidia.com>
List-Id: devicetree@vger.kernel.org

While parsing "memory-region" node lists if a node is
"disabled", parsing halts. Therefore the nodes whose
"status" is "okay" or "ok" are not parsed.

The change ignores disabled nodes in the memory-region
nodes list and returns 0 to continue parsing next nodes.

---
v2:
* Fixed typo in commit message.
* Used of_device_is_available to check device is disabled/enabled.

Krishna Reddy (1):
  of: reserved-memory: ignore disabled memory-region nodes

 drivers/of/of_reserved_mem.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.7.4
