From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH v4 0/2] mailbox: introduce STMicroelectronics STM32 IPCC driver
Date: Thu, 12 Apr 2018 08:47:39 +0200
Message-ID: <1523515661-8318-1-git-send-email-fabien.dessenne@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jassi Brar <jassisinghbrar@gmail.com>, Ludovic Barre <ludovic.barre@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-Id: devicetree@vger.kernel.org

The STMicroelectronics STM32 Inter-Processor Communication Controller
(IPCC) is used for communicating data between two processors.
It provides a non blocking signaling mechanism to post and retrieve
communication data in an atomic way.

Changes since v4:
- add Rob's 'Reviewed-by' in dt bindings

Changes since v3:
- update after Jassi Brar review: remove 'driver.owner'

Changes since v2:
- update bindings and driver according to Rob's comments:
    - change compatible property to "st,stm32mp1-ipcc"
    - change "st,proc_id" property to "st,proc-id"
    - define all interrupts as mandatory

Fabien Dessenne (2):
  dt-bindings: mailbox: add STMicroelectronics STM32 IPCC binding
  mailbox: add STMicroelectronics STM32 IPCC driver

 .../devicetree/bindings/mailbox/stm32-ipcc.txt     |  47 +++
 drivers/mailbox/Kconfig                            |   8 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/stm32-ipcc.c                       | 402 +++++++++++++++++++++
 4 files changed, 459 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt
 create mode 100644 drivers/mailbox/stm32-ipcc.c

-- 
2.7.4
