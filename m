From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V2 1/4] dt-bindings: timer: tpm: fix typo of clock name
Date: Wed, 28 Mar 2018 08:21:51 -0500
Message-ID: <CAL_JsqK4pmAzvJAFg5EfCdBiEywnaCy_gJ0-J7FwkPk9i8shBQ@mail.gmail.com>
References: <1522207358-8388-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522207358-8388-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, NXP Linux Team <Linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 27, 2018 at 10:22 PM, Anson Huang <Anson.Huang@nxp.com> wrote:
> The clock name should be ipg instead of igp.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  Documentation/devicetree/bindings/timer/nxp,tpm-timer.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
