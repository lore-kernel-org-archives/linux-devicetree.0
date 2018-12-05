From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1 2/3] arm64: dts: qcom: sdm845: Add SD nodes
Date: Wed, 5 Dec 2018 13:07:35 -0800
Message-ID: <CAD=FV=Wqrje73K+o0NvHSriVatnDu44jGqvc_nB7PMhjH6-cvA@mail.gmail.com>
References: <20181128223428.177313-1-evgreen@chromium.org> <20181128223428.177313-3-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181128223428.177313-3-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Nov 28, 2018 at 2:34 PM Evan Green <evgreen@chromium.org> wrote:
>
> Add the SD controller to SDM845.
>
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Looks right to me.  Possibly you might want to make it known in the
subject and description that this is only sdhc_2 since there are two
SD controllers in SDM845 (oddly numbered sdc2 and sdc4 in the
documentation).  sdc2 (the one you're supporting here) is the
dual-voltage one (supports higher speeds) and also the only one hooked
up on MTP I think.  ...so maybe nobody will ever use sdhc_4, but it
might be worth mentioning anyway.  ;-)

Other than that suggestion this looks good to me.

[note to Andy: please double-check that this ends up in the right sort
order when applying.  If you happen to apply the Quad SPI patch first
then "git am" might end up putting the SDHC_2 node _after_ the Quad
SPI but it should sort numerically before it]

Reviewed-by: Douglas Anderson <dianders@chromium.org>
