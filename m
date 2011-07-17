From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 0/2] Add device tree support for sdhci-s3c driver
Date: Sun, 17 Jul 2011 10:21:13 +0530
Message-ID: <1310878275-1422-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: cjb@laptop.org, ben-linux@fluff.org, linux-mmc@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds basic device tree support for sdhci-s3c driver.
The changes included in this patchset are

A. A copy of the platform data is kept in the drivers private data and
   that copy is referenced for further access to platform data.
B. Some of the platform data elements are retrived from the device tree
   node. The device tree based probe support using a compatible string
   matching is also added.

Changes since v1:
* Obtain some of the platform data from device tree as suggsted by
  Grant Likely.

Thomas Abraham (2):
  mmc: sdhci-s3c: Keep a copy of platform data and use it.
  mmc: sdhci-s3c: add device tree probe support

Thomas Abraham (2):
  mmc: sdhci-s3c: Keep a copy of platform data and use it
  mmc: sdhci-s3c: add device tree probe support
