From: Markus Mayer <code@mmayer.net>
Subject: [PATCH 0/2] memory: brcmstb: dpfe: skip downloading firmware
Date: Mon,  2 Oct 2017 16:13:45 -0700
Message-ID: <20171002231347.8671-1-code@mmayer.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>
Cc: Markus Mayer <mmayer@broadcom.com>, Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, Device Tree List <devicetree@vger.kernel.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Markus Mayer <mmayer@broadcom.com>

This series lets the DPFE driver skip the DPFE firmware download if the
DCPU is already running. If it's running by the time Linux comes up, it
means the boot loader already downloaded the DPFE firmware.

Markus Mayer (2):
  memory: brcmstb: dpfe: introduce is_dcpu_enabled()
  memory: brcmstb: dpfe: skip downloading firmware when possible

 drivers/memory/brcmstb_dpfe.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

-- 
2.7.4
