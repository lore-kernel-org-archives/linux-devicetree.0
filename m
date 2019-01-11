From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v11 1/9] dt-bindings: opp: Introduce opp-level bindings
Date: Fri, 11 Jan 2019 14:16:50 -0800
Message-ID: <CAD=FV=U-1bJC9D3UV6E4FRK7L-cbEbwAg8dGG=HWAtaKvNuTFw@mail.gmail.com>
References: <20190110040209.6028-1-rnayak@codeaurora.org> <20190110040209.6028-2-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110040209.6028-2-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, David Collins <collinsd@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, henryc.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jan 9, 2019 at 8:03 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Add opp-level as an additional property in the OPP node to describe
> the performance level of the device.
>
> On some SoCs (especially from Qualcomm and MediaTek) this value
> is communicated to a remote microprocessor by the CPU, which
> then takes some actions (like adjusting voltage values across various
> rails) based on the value passed.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/opp/opp.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/opp/opp.txt b/Documentation/devicetree/bindings/opp/opp.txt
> index c396c4c0af92..76b6c79604a5 100644
> --- a/Documentation/devicetree/bindings/opp/opp.txt
> +++ b/Documentation/devicetree/bindings/opp/opp.txt
> @@ -129,6 +129,9 @@ Optional properties:
>  - opp-microamp-<name>: Named opp-microamp property. Similar to
>    opp-microvolt-<name> property, but for microamp instead.
>
> +- opp-level: A value representing the performance level of the device,
> +  expressed as a 32-bit integer.
> +

I like how this ended up!  :-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...are we just waiting for Rob to weigh back in about whether he's OK
w/ this solution?

Thanks!


-Doug
