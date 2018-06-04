From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 0/2] Use SPDX-License-Identifier for rockchip devicetree files
Date: Mon, 04 Jun 2018 12:19:39 +0200
Message-ID: <1700848.99AcjQORKy@phil>
References: <20171215114427.32059-1-klaus.goger@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171215114427.32059-1-klaus.goger@theobroma-systems.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: linux-rockchip@lists.infradead.org, Romain Perier <romain.perier@collabora.com>, Arnd Bergmann <arnd@arndb.de>, Andre Przywara <andre.przywara@arm.com>, Simon Xue <xxm@rock-chips.com>, Liang Chen <cl@rock-chips.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Shawn Lin <shawn.lin@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>, Huibin Hong <huibin.hong@rock-chips.com>, David Wu <david.wu@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>, Jacob Chen <jacob-chen@iotwrt.com>, William Wu <william.wu@rock-chips.com>, Brian Norris <briannorris@chromium.org>, Jaehoon Chung <jh80.chung@samsung.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Am Freitag, 15. Dezember 2017, 12:44:25 CEST schrieb Klaus Goger:
> This patch series replaces all the license text in rockchip devicetree
> files text with a proper SPDX-License-Identifier.
> It follows the guidelines submitted[1] by Thomas Gleixner that are not
> yet merged.
> 
> These series also fixes the issue with contradicting statements in most
> licenses. The introduction text claims to be GPL or X11[2] but the
> following verbatim copy of the license is actually a MIT[3] license.
> The X11 license includes a advertise clause and trademark information
> related to the X Consortium. As these X Consortium specfic points are
> irrelevant for us we stick with the actuall license text.
> 
> [1] https://patchwork.kernel.org/patch/10091607/
> [2] https://spdx.org/licenses/X11.html
> [3] https://spdx.org/licenses/MIT.html
> 
> 
> Klaus Goger (2):
>   arm64: dts: rockchip: use SPDX-License-Identifier
>   ARM: dts: rockchip: use SPDX-License-Identifier

This had now 6 months for anybody concerned about this change to speak
up - with no NACKs received, so I've applied both patches for 4.19

Heiko
