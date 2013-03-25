From: Philip Avinash <avinashphilip@ti.com>
Subject: [PATCH 0/2] Update device tree binding document for pwm-tiehrpwm & pwm-tiecap
Date: Mon, 25 Mar 2013 12:34:51 +0530
Message-ID: <1364195093-1357-1-git-send-email-avinashphilip@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: thierry.reding@avionic-design.de
Cc: nsekhar@ti.com, jacmet@sunsite.dk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, davinci-linux-open-source@linux.davincidsp.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, prakash.pm@ti.com, Philip Avinash <avinashphilip@ti.com>
List-Id: devicetree@vger.kernel.org

Update device tree document of pwm-tiehrpwm & pwm-tiecap in order to reflect the
usage of similar modules in both da850 and am33xx platforms.

Philip Avinash (2):
  pwm: pwm-tiecap: Update device-tree binding document
  pwm: pwm-tiehrpwm: Update device-tree binding document

 .../devicetree/bindings/pwm/pwm-tiecap.txt         |   12 ++++++++++--
 .../devicetree/bindings/pwm/pwm-tiehrpwm.txt       |   12 ++++++++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

-- 
1.7.9.5

