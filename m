From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Add qspi (quad SPI) node
Date: Mon, 8 Oct 2018 12:55:58 -0700
Message-ID: <CAD=FV=WkSvkv-p6q9XwZekhpTozxNnA4U7=jnZSFAW0F6BK=LA@mail.gmail.com>
References: <20181005015902.134192-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005015902.134192-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: ryandcase@chromium.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Girish Mahadevan <girishm@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Oct 4, 2018 at 6:59 PM Douglas Anderson <dianders@chromium.org> wrote:
> +               qspi: qspi@88df000 {

Whoops!  Just re-read over the version history of the driver and
realized that Rob H. wanted the node name to be spi@, not qspi@.
Version 2 coming up.

-Doug
