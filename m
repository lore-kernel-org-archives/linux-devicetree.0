From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/2] clk: meson-g12a: Add AO Clock controller driver
Date: Mon, 27 Aug 2018 15:07:46 +0200
Message-ID: <89b058a7bba26058fab95dea01155221dbb642ce.camel@baylibre.com>
References: <1533894868-85815-1-git-send-email-jian.hu@amlogic.com>
         <1533894868-85815-3-git-send-email-jian.hu@amlogic.com>
         <6c855dc62fe6ed1a01216bd708d401a280f8762c.camel@baylibre.com>
         <fff1f982-c9f3-8aa4-b108-6c0998827e79@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fff1f982-c9f3-8aa4-b108-6c0998827e79@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jian Hu <jian.hu@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Rob Herring <robh@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Yixun Lan <yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-08-24 at 21:34 +0800, Jian Hu wrote:
> > 
> 
> I am confued about aoclk81's parent clocks.
> 
> I can not get the example of axg audio clock driver, Could you provide 
> the link? Had it merged into clk-meson.git?

Yes and mainline as well : drivers/clk/meson/axg-audio.c

Basically this driver is creating bypass input clocks (audio_pclk, mst_in[0-9],
etc...) .

This allows to collect input clocks from DT (like any consumer should) will
keeping constant in the controller clock tree.

>From what I've seen of your controller drivers, the EE controller should have
one input, the AO should have 3.
