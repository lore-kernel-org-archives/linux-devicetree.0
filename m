From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v4 0/4] arm64: Add basic support for Amlogic A1 SoC Family
Date: Tue, 24 Sep 2019 12:07:11 -0700
Message-ID: <7hzhit5x9c.fsf@baylibre.com>
References: <1568276370-54181-1-git-send-email-jianxin.pan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568276370-54181-1-git-send-email-jianxin.pan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org
Cc: Jianxin Pan <jianxin.pan@amlogic.com>, Rob Herring <robh+dt@kernel.org>, Carlo Caione <carlo@caione.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Tao Zeng <tao.zeng@amlogic.com>
List-Id: devicetree@vger.kernel.org

Jianxin Pan <jianxin.pan@amlogic.com> writes:

> A1 is an application processor designed for smart audio and IoT applications,
> with Dual core ARM Cortex-A35 CPU. Unlike the previous GXL and G12 series,
> there is no Cortex-M3 AO CPU in it.
>
> This serial add basic support for the Amlogic A1 based Amlogic AD401 board:
> which describe components as follows: Reserve Memory, CPU, GIC, IRQ,
> Timer, UART. It's capable of booting up into the serial console.
>
> The pclk for uart_AO_B need to be fixed once A1 clock driver is merged.
> In this version, it rely on bootloader to enable the pclk gate

Queued for v5.5,

Thanks for the new SoC support,

Kevin
