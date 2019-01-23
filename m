Return-Path: <SRS0=u3Zw=P7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:59704 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfAWOyq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Jan 2019 09:54:46 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH yaml-bindings] README: pip3 is provided by python3-pip
Date: Wed, 23 Jan 2019 15:54:40 +0100
Message-Id: <20190123145440.31001-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Grant Likely <grant.likely@arm.com>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

When running "pip3 install rfc3987" on Ubuntu 18.04LTS:

    Command 'pip3' not found, but can be installed with:

    sudo apt install python3-pip

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 2ecbcf2ede80079f..57ba5a10a8a29744 100644
--- a/README.md
+++ b/README.md
@@ -130,7 +130,7 @@ On Debian/Ubuntu, the dependencies can be installed with apt and/or pip. The
 rfc3987 module is not packaged, so pip must be used:
 
 ```
-apt-get install python3 python-ruamel.yaml
+apt-get install python3 python3-pip python-ruamel.yaml
 pip3 install rfc3987
 ```
 
-- 
2.17.1
