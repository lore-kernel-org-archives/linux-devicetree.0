From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 3/8] arm64: dts: qcom: msm8998: Add tsens and
 thermal-zones
Date: Thu, 6 Sep 2018 08:46:27 -0700
Message-ID: <20180906154627.GA3286@tuxbook-pro>
References: <20180904050123.26601-1-bjorn.andersson@linaro.org>
 <20180904050123.26601-4-bjorn.andersson@linaro.org>
 <CAHLCerM2por+ES+OhH2nUOOPF_tmYjk6zGdw-2dr=JRu5Jfrbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHLCerM2por+ES+OhH2nUOOPF_tmYjk6zGdw-2dr=JRu5Jfrbg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@verdurent.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu 06 Sep 06:53 PDT 2018, Amit Kucheria wrote:
> On Tue, Sep 4, 2018 at 10:31 AM, Bjorn Andersson
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
[..]
> > +               tsens0: thermal@10aa000 {
> > +                       compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
> > +                       reg = <0x10aa000 0x2000>;
> > +
> 
> use the SROT and TM split for v2?
> 

You're right, lets use the new style from the beginning.

Thanks,
Bjorn
