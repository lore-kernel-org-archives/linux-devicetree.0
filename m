From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH RFT 0/2] Teach phylib hard-resetting devices
Date: Sat, 09 Apr 2016 01:21:12 +0300
Message-ID: <81129033.NXiOLTg1so@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, netdev@vger.kernel.org, frowand.list@gmail.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 2 patches against DaveM's 'net-next.git' repo. They add to
'phylib' support for resetting devices via GPIO and do some clean up after
doing that...

[1/2] phylib: add device reset GPIO support
[2/2] macb: kill PHY reset code

MBR, Sergei
