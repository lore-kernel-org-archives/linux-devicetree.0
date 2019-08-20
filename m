From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/6] dt-bindings: arm: amlogic: add SM1 bindings
Date: Tue, 20 Aug 2019 11:15:53 -0500
Message-ID: <CAL_JsqKFBcstWfaG-n6k9169bF0o7DDq1Uy6EcTF4p-Ta_DOBA@mail.gmail.com>
References: <20190820144052.18269-1-narmstrong@baylibre.com> <20190820144052.18269-5-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820144052.18269-5-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 9:41 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add bindings for the new Amlogic SM1 SoC Family.
>
> It a derivative of the G12A SoC Family with :
> - Cortex-A55 core instead of A53
> - more power domains
> - a neural network co-processor
> - a CSI input and image processor
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
