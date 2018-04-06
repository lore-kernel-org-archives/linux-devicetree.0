From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v7 [RESEND] 2/2] dt-bindings: introduce Command DB for QCOM SoCs
Date: Fri, 06 Apr 2018 16:16:42 -0700
Message-ID: <152305660223.94378.422604779280814924@swboyd.mtv.corp.google.com>
References: <20180406151356.7818-1-ilina@codeaurora.org>
 <20180406151356.7818-3-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180406151356.7818-3-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: rnayak@codeaurora.org, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>, devicetree@vger.kernel.org, Mahesh Sivasubramanian <msivasub@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Lina Iyer (2018-04-06 08:13:56)
> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> =

> Command DB provides information on shared resources like clocks,
> regulators etc., probed at boot by the remote subsytem and made
> available in shared memory.
> =

> Cc: devicetree@vger.kernel.org
> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> =


Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> +       reserved-memory {
> +               [...]
> +               qcom,cmd-db@85fe0000 {

Nitpick: This may want to be called 'memory@85fe0000' because we prefer
generic node names.
