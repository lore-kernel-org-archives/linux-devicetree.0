From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] of_mdio: use IS_ERR_OR_NULL() and PTR_ERR_OR_ZERO()
Date: Sat, 12 Mar 2016 01:11:49 +0300
Message-ID: <4882738.uyje2ICxKW@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, netdev@vger.kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 2 patches against DaveM's 'net-next.git' repo. They
replace the patch posted earlier today which was clearly insufficient...

[1/2] of_mdio: use IS_ERR_OR_NULL()
[2/2] of_mdio: use PTR_ERR_OR_ZERO()

MBR, Sergei
