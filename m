Return-Path: <SRS0=QDRt=GY=chromium.org=evgreen@kernel.org>
MIME-Version: 1.0
References: <1522429700-13083-1-git-send-email-kramasub@codeaurora.org> <1522429700-13083-3-git-send-email-kramasub@codeaurora.org>
In-Reply-To: <1522429700-13083-3-git-send-email-kramasub@codeaurora.org>
From: Evan Green <evgreen@chromium.org>
Date: Tue, 03 Apr 2018 18:47:43 +0000
Message-ID: <CAE=gft4SVRy8DMUYpjq3Pvv6r8wMzKr=MOqqPZJNnVONc6ruQA@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] soc: qcom: Add GENI based QUP Wrapper driver
Content-Type: text/plain; charset="UTF-8"
To: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, wsa@the-dreams.de, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, acourbot@chromium.org, swboyd@chromium.org, Doug Anderson <dianders@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Sagar Dharia <sdharia@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Mar 30, 2018 at 10:08 AM Karthikeyan Ramasubramanian <
kramasub@codeaurora.org> wrote:

> This driver manages the Generic Interface (GENI) firmware based Qualcomm
> Universal Peripheral (QUP) Wrapper. GENI based QUP is the next generation
> programmable module composed of multiple Serial Engines (SE) and supports
> a wide range of serial interfaces like UART, SPI, I2C, I3C, etc. This
> driver also enables managing the serial interface independent aspects of
> Serial Engines.

> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
> ---
>   drivers/soc/qcom/Kconfig        |   9 +
>   drivers/soc/qcom/Makefile       |   1 +
>   drivers/soc/qcom/qcom-geni-se.c | 748
++++++++++++++++++++++++++++++++++++++++
>   include/linux/qcom-geni-se.h    | 425 +++++++++++++++++++++++
>   4 files changed, 1183 insertions(+)
>   create mode 100644 drivers/soc/qcom/qcom-geni-se.c
>   create mode 100644 include/linux/qcom-geni-se.h


Reviewed-by: Evan Green <evgreen@chromium.org>
