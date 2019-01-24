From: frowand.list@gmail.com
Subject: [PATCH 0/2] of: unittest: minor cleanups
Date: Thu, 24 Jan 2019 15:22:12 -0800
Message-ID: <1548372134-15729-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

1) Suppress expected error message when adding unittest data to livetree.

2) While writing patch 1, noted a misleading function name.  Add comment
   to the function header warning about possible unexpected results.


Frank Rowand (2):
  of: unittest: remove report of expected error
  of: unittest: add caution to function header comment

 drivers/of/unittest.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
Frank Rowand <frank.rowand@sony.com>
