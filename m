From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: Add Lenovo Miix 630
Date: Fri, 12 Apr 2019 12:41:36 -0600
Message-ID: <CAOCk7NrRb=CZiZp6LKmP9yFZzWTO6AaRt4aZ5dyoVxBw4ZA9_w@mail.gmail.com>
References: <20190411205144.43557-1-jeffrey.l.hugo@gmail.com> <20190412180142.GZ1843@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412180142.GZ1843@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: agross@kernel.org, David Brown <david.brown@linaro.org>, robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 12, 2019 at 12:01 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 11 Apr 13:51 PDT 2019, Jeffrey Hugo wrote:
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998-clam.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clam.dtsi
> [..]
> > +&tlmm {
> > +     gpio-reserved-ranges = <0 4>, <81 4>;
>
> Did you double check that you actually need these? (Iirc boot testing is
> enough)

Yes, still needed.

>
> > +
> > +     touchpad: touchpad {
> > +             config {
> > +                     pins = "gpio123";
> > +                     bias-pull-up;           /* pull up */
> > +             };
> > +     };
> > +};
> [..]
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> [..]
> > +/ {
> > +     model = "Lenovo Miix 630";
> > +     compatible = "qcom,msm8998-clam";
>
> compatible = "lenovo,miix-630", "qcom,msm8998";

Thanks for the suggestion.  Will do.

>
> > +
> > +     /* bootloader doesn't understand DT, so no qcom,board-id */
>
> You can omit this comment, as I don't think people will miss these
> non-standard properties.

Makes sense.  Will do.
