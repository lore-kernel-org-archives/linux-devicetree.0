From: Joshua Clayton <stillcompiling@gmail.com>
Subject: [RFC] New of_io_release_and_unmap()
Date: Wed, 25 Feb 2015 11:20:41 -0800
Message-ID: <cover.1424889345.git.stillcompiling@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joshua Clayton <stillcompiling@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello folks,
I notice that io_request_and_map has no inverse.
I would like to add a new function to undo what it does.

Joshua Clayton (1):
  of/address: Add of_io_release_and_unmap()

 drivers/of/address.c       | 29 +++++++++++++++++++++++++++++
 include/linux/of_address.h |  2 ++
 2 files changed, 31 insertions(+)

-- 
2.1.0
