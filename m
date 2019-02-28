From: Paul Cercueil <paul@crapouillou.net>
Subject: [5.2][PATCH 0/3] Ingenic JZ47xx KMS driver
Date: Thu, 28 Feb 2019 19:07:53 -0300
Message-ID: <20190228220756.20262-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

This is a first attempt at a KMS driver for the JZ47xx MIPS SoCs by
Ingenic. It is aimed to replace the aging jz4740-fb driver.

The driver will later be updated with new features (overlays, TV-out
etc.), that's why I didn't go with the simple/tiny DRM driver.

The driver has been tested on the Ben Nanonote (JZ4740) and the
RetroMini RS-90 (JZ4725B) handheld gaming console.

Greetings,
-Paul
