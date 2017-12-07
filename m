From: Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [PATCH v2 0/2] uio: Allow to take irq bottom-half into irq_handler with additional dt-binding
Date: Thu,  7 Dec 2017 15:46:57 +0100
Message-ID: <1512658019-30279-1-git-send-email-andrey.z@gmail.com>
References: <1512572140-48009-1-git-send-email-andrey.z@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512572140-48009-1-git-send-email-andrey.z@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrey Zhizhikin <andrey.z@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch series aimed to introduce additional feature for UIO driver with
generic interrupt handler to allow IRQ bottom half to be executed in
irq_handler context rather than as threaded IRQ.

Andrey Zhizhikin (2):
  uio: Allow to take irq bottom-half into irq_handler with additional
    dt-binding
  uio: Introduce UIO driver dt-binding documentation

 .../devicetree/bindings/uio/uio-pdrv-genirq.txt    | 46 ++++++++++++++++++++++
 drivers/uio/uio_pdrv_genirq.c                      | 15 +++++++
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt

-- 
2.7.4
