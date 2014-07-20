From: Nick Krause <xerofoify@gmail.com>
Subject: Edma.c: Fix Mes
Date: Sun, 20 Jul 2014 00:27:37 -0400
Message-ID: <CAPDOMVhd-mfNfT+DbHWbzQA8sb3xpqW6a0WEuTTeCGyK8+kRNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, robh+dt@kernel.org, nsekhar@ti.com, peter.ujfalusi@ti.com, joelf@ti.com, vinod.koul@intel.com, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

Hey Russell and others,
Sorry to bug you again but I have a fix questions before I clean up
the fix mes in this file.
Is edma_clean_channel needed or is edma_stop good enough?  And do  we
CCERR.BIT(16)
need to write this bit or not?
Cheers Nick
