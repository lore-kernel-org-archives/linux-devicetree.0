From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: Convert Realtek board/soc bindings to json-schema
Date: Thu, 5 Sep 2019 10:21:48 +0100
Message-ID: <CAL_JsqKGX1n-jsi0xtG8_Q=1LAhT=ufe0y2ZNBNoE3fR10K_xQ@mail.gmail.com>
References: <20190905081721.1548-1-james.tai@realtek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905081721.1548-1-james.tai@realtek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jamestai.sky@gmail.com
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Mark Rutland <mark.rutland@arm.com>, CY_Huang <cy.huang@realtek.com>, Phinex Hung <phinex@realtek.com>, "james.tai" <james.tai@realtek.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 5, 2019 at 9:19 AM <jamestai.sky@gmail.com> wrote:
>
> From: "james.tai" <james.tai@realtek.com>
>
> Convert Realtek SoC bindings to DT schema format using json-schema.
>
> Signed-off-by: james.tai <james.tai@realtek.com>
> ---
>  .../devicetree/bindings/arm/realtek.txt       | 22 -------------------
>  .../devicetree/bindings/arm/realtek.yaml      | 17 ++++++++++++++
>  2 files changed, 17 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/realtek.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/realtek.yaml

I've already submitted a patch for this that's *still* waiting on
Andreas to apply or comment on the licensing.

Also, your patch isn't valid schema. Please check with 'make dt_binding_check'.
