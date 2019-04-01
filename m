From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Add Lenovo Miix 630
Date: Mon, 1 Apr 2019 08:13:38 -0600
Message-ID: <CAOCk7Np53o69xQw83V1sfO2uv1-NFSGtbsTqH-5K1m1Rdaf-GA@mail.gmail.com>
References: <20190326185525.20781-1-jeffrey.l.hugo@gmail.com> <20190401105153.GE4187@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401105153.GE4187@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: bjorn.andersson@linaro.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Lee.

On Mon, Apr 1, 2019 at 4:52 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 26 Mar 2019, Jeffrey Hugo wrote:
>
> > This adds the initial DT for the Lenovo Miix 630 laptop.  Supported
> > functionality includes USB (host), microSD-card, keyboard, and trackpad=
.
> >
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >  arch/arm64/boot/dts/qcom/msm8998-cls.dtsi     | 278 ++++++++++++++++++
>
> What is cls?

Clamshell.  I left a comment in the file that is intended to clarify
this.  If one does some digging, they should find a fair number of
"cls" references within the firmware and windows.

>
> How much of this will be reusable with the other laptops?

The intent is that all the common stuff, which I expect is >90%, is in
the cls.dtsi so that we don't have multiple copies of it.  Variances,
such as the SD detect GPIO stuff we've discovered would be in the
individual dtb.  Or at-least, that is the idea.  I'm open to
suggestions.

I'm unable to post dts files based on the HP/Asus at this time, but
hopefully that changes soon.  Otherwise, Its my goal that this
provides a good framework for adding those devices.

>
> >  .../boot/dts/qcom/msm8998-lenovo-miix-630.dts |  33 +++
> >  3 files changed, 312 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/msm8998-cls.dtsi
> >  create mode 100644 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dt=
s
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Linaro Services Technical Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
