From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 0/3] firmware: of: populate /firmware/ node during init
Date: Fri, 11 Aug 2017 14:30:34 +0100
Message-ID: <1502458237-1683-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Gross <andy.gross@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Rob, Arnd,

Recently Rob pointed to place SCMI device node under /firmware/ node
and when I did that, I observed I had to populate the node first to
get scmi node populated. Some research showed qcom_scm and optee drivers
handle it in their own ways. This small series is to make it generic
so that all the users of /firmware/ node need not repeat the same.

Sudeep Holla (3):
  firmware: of: populate /firmware/ node during init
  firmware: qcom_scm: drop redandant of_platform_populate
  drivers: tee: rework optee_driver_{init,exit} to use platform device

 drivers/firmware/Makefile   |  1 +
 drivers/firmware/of.c       | 34 +++++++++++++++++++++
 drivers/firmware/qcom_scm.c | 24 ---------------
 drivers/tee/optee/core.c    | 74 +++++++++++++++------------------------------
 4 files changed, 60 insertions(+), 73 deletions(-)
 create mode 100644 drivers/firmware/of.c

-- 
2.7.4
