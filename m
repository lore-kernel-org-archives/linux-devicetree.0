From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 7/8] ASoC: atmel: document clock properties of the
 wm8904 driver
Date: Mon, 17 Mar 2014 10:02:19 +0000
Message-ID: <20140317100219.GB8070@e106331-lin.cambridge.arm.com>
References: <1395049541-28128-1-git-send-email-voice.shen@atmel.com>
 <1395049541-28128-8-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1395049541-28128-8-git-send-email-voice.shen@atmel.com>
Sender: linux-doc-owner@vger.kernel.org
To: Bo Shen <voice.shen@atmel.com>
Cc: Mark Brown <broonie@kernel.org>, "nicolas.ferre@atmel.com" <nicolas.ferre@atmel.com>, Boris BREZILLON <b.brezillon@overkiz.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Mark Brown <broonie@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 17, 2014 at 09:45:40AM +0000, Bo Shen wrote:
> From: Boris BREZILLON <b.brezillon@overkiz.com>
> 
> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
> Signed-off-by: Bo Shen <voice.shen@atmel.com>
> ---
> 
>  Documentation/devicetree/bindings/sound/atmel-wm8904.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/atmel-wm8904.txt b/Documentation/devicetree/bindings/sound/atmel-wm8904.txt
> index 8bbe50c..aca341c 100644
> --- a/Documentation/devicetree/bindings/sound/atmel-wm8904.txt
> +++ b/Documentation/devicetree/bindings/sound/atmel-wm8904.txt
> @@ -3,6 +3,8 @@ Atmel ASoC driver with wm8904 audio codec complex
>  Required properties:
>    - compatible: "atmel,asoc-wm8904"
>    - atmel,model: The user-visible name of this sound complex.
> +  - clocks: A list of clocks needed by the wm8904 chip.
> +  - clock-output-names: Driver related clock names. Shall contain "pck0".

The word "driver"  doesn't need to appear in biding documents, and this
fails to describe what it sets out to. How about the following:

- clocks: a list of phandle + clock-specifier pairs, one for each entry
  in clock-names.
- clock-names: Should contain "pck0"

Thanks,
Mark.
