From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: clk: meson-g12a: Add G12A EE Clock
 Bindings
Date: Mon, 12 Nov 2018 18:24:04 -0600
Message-ID: <20181113002404.GA31672@bogus>
References: <1541682912-120480-1-git-send-email-jian.hu@amlogic.com>
 <1541682912-120480-2-git-send-email-jian.hu@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541682912-120480-2-git-send-email-jian.hu@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jian Hu <jian.hu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Yixun Lan <yixun.lan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 8 Nov 2018 21:15:10 +0800, Jian Hu wrote:
> Add new clock controller compatible and dt-bingdings headers
> for the Everything-Else domain of the g12a SoC
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,gxbb-clkc.txt           |  1 +
>  include/dt-bindings/clock/g12a-clkc.h              | 93 ++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 include/dt-bindings/clock/g12a-clkc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
