From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 4/4] arm64: dts: sdm845: Add serial console support
Date: Fri, 16 Feb 2018 11:28:18 -0800
Message-ID: <CAD=FV=WiW9yn5o_GXot9Pu=EQpnfDTS9sBDxnE__BrwwtOZtpA@mail.gmail.com>
References: <20180216060503.22006-1-rnayak@codeaurora.org> <20180216060503.22006-5-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180216060503.22006-5-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Stephen Boyd <sboyd@codeaurora.org>, evgreen@chromium.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Feb 15, 2018 at 10:05 PM, Rajendra Nayak <rnayak@codeaurora.org> wrote:
> Add the qup uart node and geni se instance needed to
> support the serial console on the MTP.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 39 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi    | 39 +++++++++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+)

Looks nice to me.  Thanks!

As in your cover letter, this patch will almost certainly need to be
spun again because it's based on bindings that have review feedback.
For those of you playing along at home, see
<https://patchwork.kernel.org/patch/10162063/>.  Thus, I'm not
providing a Reviewed-by tag at the moemnt.

I will still say thanks for posting this (even though it was based on
old bindings) since it allowed us to make some good progress ahead of
time so we'll be very close to landing when the serial patch is spun
next.


In my ideal world the first 3 patches of this series would land sooner
rather than later and then this 4th patch would simply be re-posted on
its own when the bindings get more finalized (or, even better, if the
first 3 patches have landed then Karthikeyan could just glom this on
to the end of his next spin of the serial driver.  ;-)


-Doug
