Return-Path: <SRS0=Nufv=F6=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Add Renesas R8A77980 PFC driver
Message-ID: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
Date: Thu, 8 Mar 2018 22:10:02 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-ID: <devicetree@vger.kernel.org>

Hello!

Here's a set of 2 patches against the 'sh-pfc' branch of Geert Uytterhoeven's
'renesas-drivers.git' repo. These patches add the basic support for the R8A77980
PFC.

[1/2] pinctrl: sh-pfc: add PORT_GP_CFG_25() helper macro
[2/2] pinctrl: sh-pfc: add R8A77980 PFC support

MBR, Sergei
