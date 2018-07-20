From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V2] dt-bindings: soc: qcom: Add device tree binding for
 GENI SE
Date: Fri, 20 Jul 2018 13:35:04 -0700
Message-ID: <CAD=FV=W+UOeK0p_QAg=bSZxxBXq_2whGKC9H6kgYNS1dy0qLvA@mail.gmail.com>
References: <1532087461-3474-1-git-send-email-dkota@codeaurora.org> <1532087461-3474-3-git-send-email-dkota@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532087461-3474-3-git-send-email-dkota@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dilip Kota <dkota@codeaurora.org>
Cc: timur@codeaurora.org, Stephen Boyd <swboyd@chromium.org>, Mark Brown <broonie@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, LKML <linux-kernel@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, Sagar Dharia <sdharia@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Jul 20, 2018 at 4:51 AM, Dilip Kota <dkota@codeaurora.org> wrote:
> From: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>
> Add device tree binding support for the QCOM GENI SE driver.
>
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Andy Gross <andy.gross@linaro.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  | 119 +++++++++++++++++++++
>  1 file changed, 119 insertions(+)

Just a note to mention that this patch landed two months ago and can
already be found in mainline Linux.  See commit e9b02415565b
("dt-bindings: soc: qcom: Add device tree binding for GENI SE").

...I think Mark Brown made comments on v1 of the SPI driver that he
was surprised about how the bindings landed, but that doesn't mean you
should re-post a patch that is already in mainline--just point to the
patch that landed by git hash.  If something about the bindings needs
to change then post a patch that changes them.

-Doug
