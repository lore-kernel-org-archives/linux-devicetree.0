Return-Path: <SRS0=aylg=FT=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add Renesas R8A77970 PFC driver
Message-ID: <e32c511f-89cd-254b-8a53-face984abe75@cogentembedded.com>
Date: Sun, 25 Feb 2018 21:11:21 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-ID: <devicetree@vger.kernel.org>

Hello!

Here's a set of 2 patches against the 'sh-pfc' branch of Geert Uytterhoeven's
'renesas-drivers.git' repo. These patches add the basic support for the R8A77980
PFC.

[1/2] pinctrl: sh-pfc: add PORT_GP_CFG_25() helper macros
[2/2] pinctrl: sh-pfc: add R8A77980 PFC support

MBR, Sergei
