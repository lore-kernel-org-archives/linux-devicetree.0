From: Oliver Schinagl <oliver+list@schinagl.nl>
Subject: [PATCH] ARM: sunxi: doc: Add sun7i (A20) interrupt table
Date: Fri, 20 Sep 2013 13:12:39 +0200
Message-ID: <1379675560-30656-1-git-send-email-oliver+list@schinagl.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rob@landley.net
Cc: linux-kernel@vger.kernel.org, maxime-ripard@free-electrons.com, linux-sunxi@google-groups.com, devicetree@vger.kernel.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, oliver@schinagl.nl
List-Id: devicetree@vger.kernel.org

From: Oliver Schinagl <oliver@schinagl.nl>

Having the interrupt tables documented in the kernel documentation is useful as
a quick reference.

Oliver Schinagl (1):
  ARM: sunxi: doc: Add sun7i (A20) interrupt table

 .../interrupt-controller/sunxi/sun7i-a20.txt       | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sunxi/sun7i-a20.txt

-- 
1.8.1.5
