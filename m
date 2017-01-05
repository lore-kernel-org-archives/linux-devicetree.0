From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: Add DT bindings info for FlexRM ring manager
Date: Thu, 5 Jan 2017 10:32:13 -0600
Message-ID: <CAL_JsqLQn6yGa5J2ctbJhFR5UwC8uX7fHhxDuzLYUOQ4G4Fj2g@mail.gmail.com>
References: <1483614475-3442-1-git-send-email-anup.patel@broadcom.com> <1483614475-3442-3-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483614475-3442-3-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anup Patel <anup.patel@broadcom.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Pramod KUMAR <pramod.kumar@broadcom.com>, Rob Rice <rob.rice@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 5, 2017 at 5:07 AM, Anup Patel <anup.patel@broadcom.com> wrote:
> This patch adds device tree bindings document for the FlexRM
> ring manager found on Broadcom iProc SoCs.
>
> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
> Signed-off-by: Anup Patel <anup.patel@broadcom.com>
> ---
>  .../bindings/mailbox/brcm,iproc-flexrm-mbox.txt    | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-flexrm-mbox.txt

Acked-by: Rob Herring <robh@kernel.org>
