From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: [PATCH 0/2] Trivial code cleanup for DT resolver
Date: Fri, 13 Oct 2017 00:35:56 -0700
Message-ID: <20171013073558.11518-1-stephen.boyd@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Two trivial patches to the DT resolver code.

Stephen Boyd (2):
  of/resolver: Simplify to be32_add_cpu()
  of/resolver: Replace kmalloc + memcpy with kmemdup()

 drivers/of/resolver.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.14.GIT
