From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCHv1 0/2] qcom: pms405: adc fixes
Date: Sat, 27 Apr 2019 02:38:50 +0530
Message-ID: <CAHLCerMtsBUi_suDKVNgG29GWHFxWd16ZbbWZoop2Wb+7B44DQ@mail.gmail.com>
References: <cover.1553088982.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1553088982.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 20, 2019 at 7:10 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
> A couple of fixes to the adc node in PMS405 to get thermistors to work
> correctly.
>
> Amit Kucheria (2):
>   arm64: dts: qcom: pms405: calibrate the VADC correctly
>   arm64: dts: qcom: pms405: Rename adc outputs as per schematics
>
>  arch/arm64/boot/dts/qcom/pms405.dtsi | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)

Ping!
