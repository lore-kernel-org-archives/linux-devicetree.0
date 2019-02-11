From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 02/15] dt-bindings: arm: Add SMP enable-method for Milbeaut
Date: Mon, 11 Feb 2019 11:37:28 -0600
Message-ID: <CAL_JsqKofn_H0GE5JR8VEKdbf30iCK_QOyiaR1W=JxcCW7XJxA@mail.gmail.com>
References: <1549628749-30379-1-git-send-email-sugaya.taichi@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549628749-30379-1-git-send-email-sugaya.taichi@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sugaya Taichi <sugaya.taichi@socionext.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 8, 2019 at 6:25 AM Sugaya Taichi
<sugaya.taichi@socionext.com> wrote:
>
> This adds a compatible string "socionext,milbeaut-m10v-smp"
> for Milbeaut M10V to the 32 bit ARM CPU device tree binding.
>
> Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
