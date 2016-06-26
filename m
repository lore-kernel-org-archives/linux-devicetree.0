From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 0/2] devicetree overlay small fixes
Date: Sun, 26 Jun 2016 22:11:57 +0200
Message-ID: <cover.1466971467.git.hramrach@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Michal Suchanek <hramrach@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello,

while testing overlay loading I found some issues with applying the overlay.

I sent these like a year ago already. One was since fixed but two still apply.

Thanks

Michal

Michal Suchanek (2):
  of: overlay: add resolver error prints
  of: fdt: mark unflattened tree as detached

 drivers/of/fdt.c      | 12 +++++++++---
 drivers/of/resolver.c |  6 ++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.8.1
