From: Joe Perches <joe@perches.com>
Subject: [PATCH] gps6507x.txt: Remove executable bits
Date: Fri, 12 Jul 2013 10:31:47 -0700
Message-ID: <1373650307.2614.10.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: "Vishwanathrao Badarkhe, Manish" <manishv.b@ti.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>
Cc: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Documentation shouldn't be executable.

Signed-off-by: Joe Perches <joe@perches.com>
---
diff --git a/Documentation/devicetree/bindings/mfd/tps6507x.txt b/Documentation/devicetree/bindings/mfd/tps6507x.txt
old mode 100755
new mode 100644


