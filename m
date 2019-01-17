From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: sdm845: Increase address and
 size cells for soc
Date: Thu, 17 Jan 2019 09:47:16 -0800
Message-ID: <CAD=FV=UPwHux1nBm_eO3Uida6hSZLrOwdMpjMQQb5daa3USpqg@mail.gmail.com>
References: <20190117042940.25487-1-bjorn.andersson@linaro.org> <20190117042940.25487-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117042940.25487-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <swboyd@chromium.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jan 16, 2019 at 8:30 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The busses on SDM845 provides 36 address bits, extend the address and
> size cells to make it possible to describe this in "ranges" and
> "dma-ranges".
>
> While touching all reg properties, addresses are padded to 8 digits.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v3:
> - Split out address-cells/size-cells change
> - Rewrote commit message from scratch
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 300 +++++++++++++--------------
>  1 file changed, 150 insertions(+), 150 deletions(-)

It was "fun" trying to apply this patch since you now based it on
Andy's for-next branch plus outstanding patches.  I suppose that's my
fault for suggesting that, but maybe next time it would be helpful if
you could publish a branch somewhere that provided your basis?

NOTE: my tree also has "qcom,sdm845-lpasscc" so I had to manually fix
that last address too.  I believe you left this out of your tree
because it was causing you trouble on MTP.  That's fine and upstream
can fix it up when it lands.

In general everything here looks good though and I'd suggest landing
it  (and the patches it depends on) ASAP because otherwise we'll keep
fighting conflicts.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
