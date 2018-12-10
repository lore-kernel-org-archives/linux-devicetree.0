From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: Add AOSS QMP binding
Date: Mon, 10 Dec 2018 15:56:48 -0800
Message-ID: <CAD=FV=Ugz1PhLL6NqhYyjOsRc=JwZT-jJzfr=3LHxo6zT5zypA@mail.gmail.com>
References: <20181112080557.22698-1-bjorn.andersson@linaro.org> <20181112080557.22698-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181112080557.22698-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Nov 12, 2018 at 12:02 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> +  aoss_qmp: qmp@c300000 {
> +          compatible = "qcom,sdm845-aoss-qmp";
> +          reg = <0x0c300000 0x100000>;

drive-by nit: s/0x0c300000/0xc300000

...another random suggestion is that I think Rob H. has been
requesting that examples have the #include in them...

-Doug
