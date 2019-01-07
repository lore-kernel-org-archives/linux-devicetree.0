From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: thermal: Add binding document for SR thermal
Date: Mon, 7 Jan 2019 10:11:21 +0530
Message-ID: <CABe79T4Q=76NRx=uj1LQg9Wu54=Sj+F68Tk6S5nNX5-WHzCsNw@mail.gmail.com>
References: <1546505734-24527-1-git-send-email-srinath.mannam@broadcom.com>
 <1546505734-24527-2-git-send-email-srinath.mannam@broadcom.com> <20190103170117.GA11469@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190103170117.GA11469@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Pramod Kumar <pramod.kumar@broadcom.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thank you for the note. I will take care from next time onward.

Thanks & Regards,
Srinath.

On Thu, Jan 3, 2019 at 10:31 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu,  3 Jan 2019 14:25:32 +0530, Srinath Mannam wrote:
> > From: Pramod Kumar <pramod.kumar@broadcom.com>
> >
> > Add binding document for supported thermal implementation
> > in Stingray.
> >
> > Signed-off-by: Pramod Kumar <pramod.kumar@broadcom.com>
> > Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> > Reviewed-by: Ray Jui <ray.jui@broadcom.com>
> > Reviewed-by: Scott Branden <scott.branden@broadcom.com>
> > ---
> >  .../bindings/thermal/brcm,sr-thermal.txt           | 105 +++++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
> >
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
