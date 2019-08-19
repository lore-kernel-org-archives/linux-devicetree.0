From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 0/3] dt-bindings for lima support on HiKey
Date: Mon, 19 Aug 2019 23:48:37 +0000
Message-ID: <20190819234840.37786-1-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: John Stultz <john.stultz@linaro.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Peter sent a patchset out back in April to enable Lima support
on HiKey, but there's not been much action on it since since.

I've been carrying the patchset in my tree, and figured I'd send
out just these three dt-bindings changes just so hopefully they
can go in and the dependent driver changes can be more easily
pushed later on.

thanks
-john

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org


Peter Griffin (3):
  dt-bindings: gpu: mali-utgard: add hisilicon,hi6220-mali compatible
  dt-bindings: reset: hisilicon: Update compatible documentation
  dt-bindings: reset: hisilicon: Add ao reset controller

 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt  | 5 +++++
 .../devicetree/bindings/reset/hisilicon,hi6220-reset.txt   | 1 +
 include/dt-bindings/reset/hisi,hi6220-resets.h             | 7 +++++++
 3 files changed, 13 insertions(+)

-- 
2.17.1
