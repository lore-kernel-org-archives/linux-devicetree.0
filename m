From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 0/2] ARM: dts: stm32: update rtc st,syscfg
Date: Wed, 9 May 2018 17:18:12 +0200
Message-ID: <1525879094-19562-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

With the lastest STM32 RTC driver updates, it is mandatory to define
pwrcfg control register and DBP (Disable Backup Protection) bit through
st,syscfg property. This patchset updates RTC nodes on stm32f429 and
stm32f746 accordingly.

Amelie Delaunay (2):
  ARM: dts: stm32: update rtc st,syscfg property on stm32f429
  ARM: dts: stm32: update rtc st,syscfg property on stm32f746

 arch/arm/boot/dts/stm32f429.dtsi | 2 +-
 arch/arm/boot/dts/stm32f746.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4
