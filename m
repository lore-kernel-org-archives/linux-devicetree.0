From: Silvio Fricke <silvio.fricke@gmail.com>
Subject: [PATCH] stmpe_ts: add usage of threshold function
Date: Mon, 11 May 2015 13:08:37 +0200
Message-ID: <cover.1431338701.git.silvio.fricke@gmail.com>
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: Silvio Fricke <silvio.fricke@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

This patch adds treshold functionality for the stmpe811 touchscreen controller.

Please review, comment or include it to your repository.

Best regards,
Silvio

Silvio Fricke (1):
  Input: stmpe-ts: add chip threshold function

 .../bindings/input/touchscreen/stmpe.txt           |  3 ++
 drivers/input/touchscreen/stmpe-ts.c               | 38 +++++++++++++++-------
 include/linux/mfd/stmpe.h                          |  1 +
 3 files changed, 31 insertions(+), 11 deletions(-)

-- 
2.4.0

