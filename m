From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH 12/15] arm64: dts: msm8974: thermal: Add interrupt support
Date: Mon, 29 Jul 2019 14:59:45 +0530
Message-ID: <CAP245DX1u6JNPaqU_=Dq9HFG=EriGJGD2r4yOa88BmdmSH69GQ@mail.gmail.com>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
 <ec8205566eb9c015ad51fbb88f0da7ca60b414fd.1564091601.git.amit.kucheria@linaro.org>
 <2812534.bLfc0ztHNv@g550jk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2812534.bLfc0ztHNv@g550jk>
Sender: linux-kernel-owner@vger.kernel.org
To: Luca Weiss <luca@z3ntu.xyz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Andy Gross <andy.gross@linaro.org>, Andy Gross <agross@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 29, 2019 at 2:33 PM Luca Weiss <luca@z3ntu.xyz> wrote:
>
> On Freitag, 26. Juli 2019 00:18:47 CEST Amit Kucheria wrote:
> > Register upper-lower interrupt for the tsens controller.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> > Cc: masneyb@onstation.org
> >
> >  arch/arm/boot/dts/qcom-msm8974.dtsi | 36 +++++++++++++++--------------
> >  1 file changed, 19 insertions(+), 17 deletions(-)
> >
>
> Hi, the title of this patch should be "arm" and not "arm64".

Good catch! Copy-paste error, will fix.
