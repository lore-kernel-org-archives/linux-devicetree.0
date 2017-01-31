From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: display: move ANX7814 and SiI8620 bridge bindings
Date: Tue, 31 Jan 2017 11:54:17 -0600
Message-ID: <20170131175417.20486-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Archit Taneja <architt@codeaurora.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

A few bindings snuck into bindings/video/bridge since consolidating
everything under bindings/display/bridge/. Move them to the correct
spot.

Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Archit Taneja <architt@codeaurora.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---

I plan to apply this to my tree.

Rob

 Documentation/devicetree/bindings/{video => display}/bridge/anx7814.txt   | 0
 .../devicetree/bindings/{video => display}/bridge/sil-sii8620.txt         | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{video => display}/bridge/anx7814.txt (100%)
 rename Documentation/devicetree/bindings/{video => display}/bridge/sil-sii8620.txt (100%)

diff --git a/Documentation/devicetree/bindings/video/bridge/anx7814.txt b/Documentation/devicetree/bindings/display/bridge/anx7814.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/bridge/anx7814.txt
rename to Documentation/devicetree/bindings/display/bridge/anx7814.txt
diff --git a/Documentation/devicetree/bindings/video/bridge/sil-sii8620.txt b/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/bridge/sil-sii8620.txt
rename to Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
-- 
2.10.1
