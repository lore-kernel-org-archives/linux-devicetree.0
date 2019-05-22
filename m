Return-Path: <SRS0=RGXl=TW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:4453 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfEVFfq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 May 2019 01:35:46 -0400
From: Puneet Saxena <puneets@nvidia.com>
Subject: [PATCH] ignore disabled memory-region nodes
Date: Wed, 22 May 2019 11:05:52 +0530
Message-ID: <1558503353-13179-1-git-send-email-puneets@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: pantelis.antoniou@konsulko.com, frowand.list@gmail.com, devicetree@vger.kernel.org
Cc: treding@nvidia.com, vdumpa@nvidia.com, snikam@nvidia.com, Puneet Saxena <puneets@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

While parsing "memory-region" node lists if a node
is "disabled", parsing halts. Therefore the nodes whoes
"status" is "okay" or "ok" are not parsed.

The change ignore disabled nodes in the memory-region
nodes list and continues to initialize the rest of
enabled nodes.

Krishna Reddy (1):
  of: resered-memory: ignore disabled memory-region nodes

 drivers/of/of_reserved_mem.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.7.4
