From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] dts: qcom: db820c: Add gpio-line-names property
Date: Wed, 16 May 2018 16:10:44 +0200
Message-ID: <CACRpkdZ6oFdnnXWE6anKR9DQGVo5v_ecfveAVKYDhLr-067nHA@mail.gmail.com>
References: <20180418134601.8502-1-manivannan.sadhasivam@linaro.org> <20180418134601.8502-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180418134601.8502-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Will Deacon <will.deacon@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Todor Tomov <todor.tomov@linaro.org>, dragonboard@lists.96boards.org, linux-arm-msm@vger.kernel.org, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 18, 2018 at 3:46 PM, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Add gpio-line-names property for Dragonboard820c based on APQ8096 SoC.
> There are 4 gpio-controllers present on this board, including the
> APQ8096 SoC, PM8994 (GPIO and MPP) and PMI8994 (GPIO).
>
> Lines names are derived from 96Boards CE Specification 1.0, Appendix
> "Expansion Connector Signal Description". Line names for PMI8994 MPP
> pins are not added due to the absence of the gpio-controller support.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
