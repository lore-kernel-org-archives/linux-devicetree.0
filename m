From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC V2 PATCH 01/12] msm8994 clocks: global clock support Global
 clock support for the msm8994 SOC.
Date: Sat, 8 Oct 2016 20:28:44 -0500
Message-ID: <20161009012844.GF18158@rob-hp-laptop>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-2-git-send-email-jmcnicol@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1475375919-618-2-git-send-email-jmcnicol@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jeremy McNicoll <jmcnicol@redhat.com>
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, git@kchr.de, jeremymc@redhat.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 01, 2016 at 07:38:28PM -0700, Jeremy McNicoll wrote:
> From: Bastian Köcher <git@kchr.de>
> 
> The clock definition was ported from the Google 3.10 kernel tree to
> work with the latest kernel.
> 
> Signed-off-by: Bastian Köcher <mail@kchr.de>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt         |    2 +

>  include/dt-bindings/clock/qcom,gcc-msm8994.h       |  145 ++

It's preferred to but bindings in separate patches.

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/qcom/Kconfig                           |    9 +
>  drivers/clk/qcom/Makefile                          |    1 +
>  drivers/clk/qcom/gcc-msm8994.c                     | 2501 ++++++++++++++++++++
>  5 files changed, 2658 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-msm8994.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8994.h
