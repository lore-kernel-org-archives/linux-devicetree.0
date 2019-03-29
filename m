From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
Subject: [PATCH v1 0/2] add cec pins muxing
Date: Fri, 29 Mar 2019 13:41:53 +0100
Message-ID: <1553863315-6652-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>
List-Id: devicetree@vger.kernel.org

Add cec pins muxing 

Yannick Fertré (2):
  ARM: dts: stm32: add cec pins muxing on stm32mp157
  ARM: dts: stm32: add sleep pinctrl for cec on stm32mp157c

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.7.4
