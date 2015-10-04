From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: Document the STM32 HW RNG bindings
Date: Sun, 4 Oct 2015 10:27:02 +0200
Message-ID: <5610E2D6.2050205@gmail.com>
References: <1443904519-24012-1-git-send-email-daniel.thompson@linaro.org>
 <1443904519-24012-2-git-send-email-daniel.thompson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <1443904519-24012-2-git-send-email-daniel.thompson@linaro.org>
Sender: linux-crypto-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On 10/03/2015 10:35 PM, Daniel Thompson wrote:
> This adds documenttaion of device tree binds for the STM32 hardware
s/documenttaion/documentation/
> random number generator.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>   .../devicetree/bindings/hwrng/stm32-rng.txt         | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwrng/stm32-rng.txt

Except the typo, the patch looks good to me.
When fixed, you can add my:
Acked-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>

Thanks!
Maxime
