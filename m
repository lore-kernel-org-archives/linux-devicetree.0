From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Qualcomm Synopsys High-Speed
 USB PHY binding
Date: Tue, 13 Nov 2018 12:59:38 +0800
Message-ID: <CAAQ0ZWS-j06YM+Vs64RC_e1M9s_5bZfCWyL95SSaKVENJv7BNw@mail.gmail.com>
References: <20181108070449.23572-1-shawn.guo@linaro.org> <20181108070449.23572-2-shawn.guo@linaro.org>
 <5bea0ed8.1c69fb81.8715.38b2@mx.google.com> <20181113034200.GD20049@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113034200.GD20049@tiger>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Sriharsha Allenki <sallenki@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Anu Ramanathan <anur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Sriharsha,

On Tue, Nov 13, 2018 at 11:42 AM Shawn Guo <shawn.guo@linaro.org> wrote:
<snip>
> > > +- qcom,init-seq:
> > > +    Value type: <u32 array>
> > > +    Definition: Should contain a sequence of <offset value delay> tuples to
> > > +                program 'value' into phy register at 'offset' with 'delay'
> > > +           in us afterwards.
> >
> > If we wanted this type of thing in DT, we'd have a generic binding (or
> > forth).
>
> Right now, this is a qualcomm usb phy specific bindings - first used in
> qcom,usb-hs-phy.txt and I extended it a bit for my phy.  As this is not
> a so good hardware description, I'm a little hesitated to make it
> generic for other platforms to use in general.  What about we put off it
> a little bit until we see more platforms need the same thing?

Are those register write sequences really required here?  At least,
from the test I do, it still works with this property dropped.

Shawn
