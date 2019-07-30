From: Richard Tresidder <rtresidd@electromag.com.au>
Subject: [RESEND v2 0/2] power/supply/sbs-battery: Add ability to force load a battery via the devicetree
Date: Tue, 30 Jul 2019 18:10:02 +0800
Message-ID: <1564481404-39505-1-git-send-email-rtresidd@electromag.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, rtresidd@electromag.com.au, kstewart@linuxfoundation.org, gregkh@linuxfoundation.org, tglx@linutronix.de, rfontana@redhat.com, allison@lohutok.net, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the ability to force load a hot pluggable battery during boot where
there is no gpio detect method available and the module is statically
built. Normal polling will then occur on that battery when it is inserted.

Richard Tresidder (2):
  dt-binding docs: sbs_sbs-battery: Addition of force_load binding
  power/supply/sbs-battery: Add ability to force load a battery via the
    devicetree

 Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt | 4 +++-
 drivers/power/supply/sbs-battery.c                                 | 6 +++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
1.8.3.1
