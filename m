From: Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCH v6 1/2] DT: hwspinlock: Add binding documentation for
 Qualcomm hwmutex
Date: Thu, 12 Mar 2015 11:29:49 +0200
Message-ID: <CAK=WgbYw2cuPGC0cnd0qgYF8pa5Rbe7i+JN9fEpXfjz=gw-FQg@mail.gmail.com>
References: <1425076217-10415-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425076217-10415-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <agross@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mark, Rob,

On Sat, Feb 28, 2015 at 12:30 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> Add binding documentation for the Qualcomm Hardware Mutex.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>
> I think the conclusion on the dt binding discussion for hwspinlocks was that
> we're down to having the #hwlock-cells intact. So this version includes that,
> but non of the other previously discussed properties.
>
> Changes since v5:
> - Extracted the dt binding documentation into a separate patch
> - Moved the driver to consume a syscon
> - Dropped previously suggested generic hwlock dt bindings
>
>  .../devicetree/bindings/hwlock/qcom-hwspinlock.txt | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt

Could you please ack this one patch from Bjorn?

I'll need your Ack before I can this forward.

Thanks,
Ohad.
