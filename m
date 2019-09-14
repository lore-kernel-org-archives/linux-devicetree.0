From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v4 0/4] arm64: Add basic support for Amlogic A1 SoC Family
Date: Sat, 14 Sep 2019 19:28:38 +0200
Message-ID: <CAFBinCAcZLLtG2pYQ76wE5BjeA1fnARzb0o7aWFBNpQabLBjDw@mail.gmail.com>
References: <1568276370-54181-1-git-send-email-jianxin.pan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568276370-54181-1-git-send-email-jianxin.pan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Carlo Caione <carlo@caione.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Tao Zeng <tao.zeng@amlogic.com>
List-Id: devicetree@vger.kernel.org

Hi Jianxin,

On Thu, Sep 12, 2019 at 10:20 AM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
>
> A1 is an application processor designed for smart audio and IoT applications,
> with Dual core ARM Cortex-A35 CPU. Unlike the previous GXL and G12 series,
> there is no Cortex-M3 AO CPU in it.
it will be interesting to see which devices will use this SoC

[...]
> Jianxin Pan (4):
>   soc: amlogic: meson-gx-socinfo: Add A1 and A113L IDs
>   dt-bindings: arm: amlogic: add A1 bindings
>   dt-bindings: arm: amlogic: add Amlogic AD401 bindings
>   arm64: dts: add support for A1 based Amlogic AD401
for the whole series:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
