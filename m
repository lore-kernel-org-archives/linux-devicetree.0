From: Wang Long <long.wanglong@huawei.com>
Subject: [PATCH 0/5] Update the OF unittest and some small fix
Date: Wed, 11 Mar 2015 03:37:18 +0000
Message-ID: <1426045043-128610-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gaurav.minocha.os@gmail.com, robherring2@gmail.com, robh+dt@kernel.org, pantelis.antoniou@konsulko.com, grant.likely@linaro.org
Cc: pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, peifeiyue@huawei.com, long.wanglong@huawei.com, ijc+devicetree@hellion.org.uk
List-Id: devicetree@vger.kernel.org

This series patches do some small fixes in drivers/of/unittest.c,
and update the Documenttion. 
At last, replace selftest with unittest in the c and dtsi files.

Wang Long (5):
  of/unittest: remove the duplicate of_changeset_init
  of/unittest: Fix the wrong expected value in
    of_selftest_property_string
  Documentation: update the of_selftest.txt
  Documentation: rename of_selftest.txt to of_unittest.txt
  of/unittest: replace selftest with unittest

 Documentation/devicetree/bindings/unittest.txt |  44 +-
 Documentation/devicetree/of_selftest.txt       | 197 -------
 Documentation/devicetree/of_unittest.txt       | 198 +++++++
 drivers/of/unittest-data/tests-overlay.dtsi    | 108 ++--
 drivers/of/unittest.c                          | 703 ++++++++++++-------------
 5 files changed, 625 insertions(+), 625 deletions(-)
 delete mode 100644 Documentation/devicetree/of_selftest.txt
 create mode 100644 Documentation/devicetree/of_unittest.txt

-- 
1.8.3.4
