From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] drm: sti: fix typos in stih4xx binding
Date: Tue, 13 Oct 2015 13:47:18 -0500
Message-ID: <CAL_JsqJRwBqUU0aKFK=VZ0m35t-rnNJceYav93CCnuqbLugRnQ@mail.gmail.com>
References: <1444737099-20046-1-git-send-email-michael.opdenacker@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444737099-20046-1-git-send-email-michael.opdenacker@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>, vincent.abriou@st.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 13, 2015 at 6:51 AM, Michael Opdenacker
<michael.opdenacker@free-electrons.com> wrote:
> Fix typos in the st,stih4xx binding, in particular replacing
> "pinctrl-name" by "pinctrl-names".
>
> Fix minor typos in the descriptions too.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/gpu/st,stih4xx.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/st,stih4xx.txt b/Documentation/devicetree/bindings/gpu/st,stih4xx.txt
> index a36dfce0032e..a352ed30cd70 100644
> --- a/Documentation/devicetree/bindings/gpu/st,stih4xx.txt
> +++ b/Documentation/devicetree/bindings/gpu/st,stih4xx.txt
> @@ -61,7 +61,7 @@ STMicroelectronics stih4xx platforms
>    - reg-names: names of the mapped memory regions listed in regs property in
>      the same order.
>    - interrupts : HDMI interrupt number to the CPU.
> -  - interrupt-names: name of the interrupts listed in interrupts property in
> +  - interrupt-names: names of the interrupts listed in interrupts property in
>      the same order
>    - clocks: from common clock binding: handle hardware IP needed clocks, the
>      number of clocks may depend of the SoC type.
> @@ -95,7 +95,7 @@ sti-dvo:
>    - clock-names: names of the clocks listed in clocks property in the same
>      order.
>    - pinctrl-0: pin control handle
> -  - pinctrl-name: names of the pin control to use
> +  - pinctrl-names: names of the pin control states to use
>    - sti,panel: phandle of the panel connected to the DVO output
>
>  sti-hqvdp:
> --
> 2.1.4
>
