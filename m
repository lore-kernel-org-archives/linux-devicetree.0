From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] dt-bindings: pinctrl: qcom: Add QCS404 pinctrl binding
Date: Wed, 26 Sep 2018 09:44:12 +0200
Message-ID: <CACRpkdYdmBM3_o=U9VRSDt3DJEH-nyJ4pDiwnzs4VttAEEnBWg@mail.gmail.com>
References: <20180920013712.2361-1-bjorn.andersson@linaro.org>
 <20180920013712.2361-4-bjorn.andersson@linaro.org> <5baa1afa.1c69fb81.5cb9b.99f3@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5baa1afa.1c69fb81.5cb9b.99f3@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 25, 2018 at 1:24 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, 19 Sep 2018 18:37:11 -0700, Bjorn Andersson wrote:
> > Add the binding for the TLMM pinctrl block found in the QCS404 platform.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  .../bindings/pinctrl/qcom,qcs404-pinctrl.txt  | 200 ++++++++++++++++++
> >  1 file changed, 200 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.txt
>
> Reviewed-by: Rob Herring <robh@kernel.org>

I put this on the v2 patch where the only change was a dropped leading
zero in the example (sboyds comment).

Thanks!
Linus Walleij
