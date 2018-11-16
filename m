From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/2] ARM: dts: meson: add the timer interrupts and clocks
Date: Fri, 16 Nov 2018 21:42:33 +0100
Message-ID: <20181116204235.3925-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

This is a follow-up of my series "meson6_timer: dt-bindings updates"
from [0].
We were missing the interrupts for timer B, C and D. This is harmless
so far because the meson6_timer driver only implements timer A. Timer
E doesn't have any interrupt.

Additionally the timer IP block has two clock inputs. This also adds
them.

NOTE: the alias "timer_abcde" was chosen because there's a second
timer instance (F..I which are similar to A..D and J which is
similar to E).


[0] https://patchwork.kernel.org/cover/10658573/

Martin Blumenstingl (2):
  ARM: dts: meson: add the TIMER B/C/D interrupts
  ARM: dts: meson: add the clock inputs for the Meson timer

 arch/arm/boot/dts/meson.dtsi   | 7 +++++--
 arch/arm/boot/dts/meson6.dtsi  | 5 +++++
 arch/arm/boot/dts/meson8.dtsi  | 5 +++++
 arch/arm/boot/dts/meson8b.dtsi | 5 +++++
 4 files changed, 20 insertions(+), 2 deletions(-)

-- 
2.19.1
