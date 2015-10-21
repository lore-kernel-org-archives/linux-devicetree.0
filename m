From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH RFC v2 0/2] simplefb: Add regulator handling support
Date: Wed, 21 Oct 2015 13:58:59 +0800
Message-ID: <1445407141-16459-1-git-send-email-wens@csie.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi everyone,

This is v2 of the simplefb regulator support series. This series adds
regulator claiming and enabling support for simplefb.

Sometimes the simplefb display output path consits of external conversion
chips and/or LCD drivers and backlights. These devices normally have
GPIOs to turn them on and/or bring them out of reset, and regulators
supplying power to them.

While the kernel does not touch unclaimed GPIOs, the regulator core
happily disables unused regulators. Thus we need simplefb to claim
and enable the regulators used throughout the display pipeline.

Instead of the unnamed "vinN-supply" properties, v2 supports any named
regulator supplies under its device node. It will look through its
properties, and claim any regulators by matching "*-supply", as Mark
suggested.

I've not done a generic helper in the regulator core yet, instead doing
the regulator property handling in the simplefb code for now.


Patch 1 adds the regulator properties to the DT binding.

Patch 2 adds code to the simplefb driver to claim and enable regulators.


Regards
ChenYu


Chen-Yu Tsai (2):
  dt-bindings: simplefb: Support a list of regulator supply properties
  simplefb: Claim and enable regulators

 .../bindings/video/simple-framebuffer.txt          |  13 ++-
 drivers/video/fbdev/simplefb.c                     | 122 ++++++++++++++++++++-
 2 files changed, 130 insertions(+), 5 deletions(-)

-- 
2.6.1
