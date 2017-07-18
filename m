From: <sean.wang@mediatek.com>
Subject: [PATCH v5 2/3] dt-bindings: cpufreq: move MediaTek cpufreq dt-bindings document to proper place
Date: Tue, 18 Jul 2017 14:01:44 +0800
Message-ID: <7a8d6d25d9d350c9d59f1720c8b9dcc9168ebc1e.1500355954.git.sean.wang@mediatek.com>
References: <cover.1500355954.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <cover.1500355954.git.sean.wang@mediatek.com>
Sender: linux-pm-owner@vger.kernel.org
To: rjw@rjwysocki.net, viresh.kumar@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com, jdelvare@suse.de, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

The old place is Documentation/devicetree/bindings/clock/ that would
let people hard to find how to use MediaTek cpufreq driver, so moving
it to the appropriate place as other cpufreq drivers done would be
better.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/{clock/mt8173-cpu-dvfs.txt => cpufreq/cpufreq-mediatek.txt}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{clock/mt8173-cpu-dvfs.txt => cpufreq/cpufreq-mediatek.txt} (100%)

diff --git a/Documentation/devicetree/bindings/clock/mt8173-cpu-dvfs.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
similarity index 100%
rename from Documentation/devicetree/bindings/clock/mt8173-cpu-dvfs.txt
rename to Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
-- 
2.7.4
