From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [v3 1/2] dt/bindings: display: Add optional property node for
 Mali DP500
Date: Fri, 16 Aug 2019 14:09:16 -0600
Message-ID: <CAL_JsqLPZ+hCGd=J3MU83saHJJ-yx6k+X0Y7-2ECu5yT8PxF4w@mail.gmail.com>
References: <20190816100424.5366-1-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190816100424.5366-1-wen.he_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen He <wen.he_1@nxp.com>
Cc: linux-devel@linux.nxdi.nxp.com, Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yang-Leo Li <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 16, 2019 at 4:14 AM Wen He <wen.he_1@nxp.com> wrote:
>
> Add optional property node 'arm,malidp-arqos-value' for the Mali DP500.
> This property describe the ARQoS levels of DP500's QoS signaling.
>
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> ---
> change in v3:
>         - correction the describe of the node
>
>  Documentation/devicetree/bindings/display/arm,malidp.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/arm,malidp.txt b/Documentation/devicetree/bindings/display/arm,malidp.txt
> index 2f7870983ef1..1f711d32f235 100644
> --- a/Documentation/devicetree/bindings/display/arm,malidp.txt
> +++ b/Documentation/devicetree/bindings/display/arm,malidp.txt
> @@ -37,6 +37,8 @@ Optional properties:
>      Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt)
>      to be used for the framebuffer; if not present, the framebuffer may
>      be located anywhere in memory.
> +  - arm,malidp-arqos-high-level: phandle to describing the ARQoS levels of DP500's
> +    QoS signaling.

The driver is reading a u32... Did you test this?


>
>
>  Example:
> @@ -54,6 +56,7 @@ Example:
>                 clocks = <&oscclk2>, <&fpgaosc0>, <&fpgaosc1>, <&fpgaosc1>;
>                 clock-names = "pxlclk", "mclk", "aclk", "pclk";
>                 arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
> +               arm,malidp-arqos-high-level = <&rqosvalue>;
>                 port {
>                         dp0_output: endpoint {
>                                 remote-endpoint = <&tda998x_2_input>;
> --
> 2.17.1
>
