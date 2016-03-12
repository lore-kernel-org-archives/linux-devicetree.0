From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/3] of_mdio: use IS_ERR_OR_NULL() and PTR_ERR_OR_ZERO()
Date: Sun, 13 Mar 2016 00:32:13 +0300
Message-ID: <2682275.WNlbxTfNal@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, netdev@vger.kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 3 patches against DaveM's 'net-next.git' repo. They deal
with some error checks in the device tree MDIO code...

[1/3] of_mdio: mdio_device_create() never returns NULL
[2/3] of_mdio: use IS_ERR_OR_NULL()
[3/3] of_mdio: use PTR_ERR_OR_ZERO()

MBR, Sergei
