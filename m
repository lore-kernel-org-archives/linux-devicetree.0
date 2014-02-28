From: Florian Vaussard <florian.vaussard@epfl.ch>
Subject: [PATCH v2 0/2] checkpatch: fixes for vendor compatible check
Date: Fri, 28 Feb 2014 17:25:40 +0100
Message-ID: <1393604742-14317-1-git-send-email-florian.vaussard@epfl.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Since v1 [1]:
- Add check for vendors with '-', as suggested by Joe Perches

Regards,
Florian

[1] http://thread.gmane.org/gmane.linux.drivers.devicetree/63770


Florian Vaussard (2):
  checkpatch: check vendor compatible with dashes
  checkpatch: fix spurious vendor compatible warnings

 scripts/checkpatch.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.8.5.3
