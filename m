From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/9] dt-bindings: mfd: Add ST Multi-Function eXpander
 (STMFX) core bindings
Date: Thu, 28 Feb 2019 08:41:49 -0600
Message-ID: <CAL_JsqJ+orZUitUvMtKJ8ww4hnn9eacy5Xak+oTO_MGrgSGJpw@mail.gmail.com>
References: <1551260094-32570-1-git-send-email-amelie.delaunay@st.com>
 <1551260094-32570-2-git-send-email-amelie.delaunay@st.com>
 <20190227235535.GA24395@bogus> <c54c4fd8-b97f-a70b-4805-fd3d217f5050@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c54c4fd8-b97f-a70b-4805-fd3d217f5050@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 28, 2019 at 2:54 AM Amelie DELAUNAY <amelie.delaunay@st.com> wrote:
>
> On 2/28/19 12:55 AM, Rob Herring wrote:
> > On Wed, 27 Feb 2019 10:34:46 +0100, Amelie Delaunay wrote:
> >> This patch adds documentation of device tree bindings for the
> >> STMicroelectronics Multi-Function eXpander (STMFX) MFD core.
> >>
> >> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> >> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> >> ---
> >>   Documentation/devicetree/bindings/mfd/stmfx.txt | 28 +++++++++++++++++++++++++
> >>   1 file changed, 28 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
> >>
> >
> > Please add Acked-by/Reviewed-by tags when posting new versions. However,
> > there's no need to repost patches *only* to add the tags. The upstream
> > maintainer will do that for acks received on the version they apply.
> >
> > If a tag was not added on purpose, please state why and what changed.
> >
>
> I'm sorry Rob, I forgot to add your Reviewed-by on this patch, which is
> identical to v3.
>
> I reposted the whole series, due to changes in MFD driver with side
> effect in pinctrl driver, but bindings (MFD and pinctrl) didn't change
> between the two versions. I stated the changes in cover letter.
>
> Should I have removed the bindings patches from the series ?

No, as the series should be applied together. You just need to add the
Reviewed-by so I can ignore it.

Rob
