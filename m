From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v5 0/2] arm64: dts: meson-g12a: Introduce new DT files for Meson-G12A SoC
Date: Wed, 26 Sep 2018 11:08:18 +0200
Message-ID: <7hzhw44oe5.fsf@baylibre.com>
References: <1537518881-53137-1-git-send-email-jianxin.pan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537518881-53137-1-git-send-email-jianxin.pan@amlogic.com>
        (Jianxin Pan's message of "Fri, 21 Sep 2018 16:34:39 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>, Jian Hu <jian.hu@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jianxin Pan <jianxin.pan@amlogic.com> writes:

> This attempt will try to add new DT files to support Meson-G12A SoC.
>
> 1) first, Please notice that, in this patch series, the DT node about 16M reserved
> memory for hwrom is removed, since it's not needed by G12A SoC.
> 2) second, the pclk for uart_AO need to be fixed once G12A clock_ao driver is
> merged. In this version, it rely on bootloader to enable the pclk gate which 
> belong to AO clock domain. Please add clk_ignore_unused to bootargs.

Applied to v4.20/dt64, added Neils' Reviewed-by tag.

Kevin
