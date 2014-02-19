From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v3 15/15] mfd: max14577: Add device tree bindings document
Date: Wed, 19 Feb 2014 16:17:43 +0100
Message-ID: <5304CB17.6060807@samsung.com>
References: <1392627950-26927-1-git-send-email-k.kozlowski@samsung.com>
 <1392627950-26927-16-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1392627950-26927-16-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 17.02.2014 10:05, Krzysztof Kozlowski wrote:
> Add document describing device tree bindings for MAX14577 MFD
> drivers: MFD core, extcon, regulator and charger.
>
> Both MAX14577 and MAX77836 chipsets are documented.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Tomasz Figa <t.figa@samsung.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>   Documentation/devicetree/bindings/mfd/max14577.txt |  149 ++++++++++++++++++++
>   1 file changed, 149 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mfd/max14577.txt

OK, so the "maxim,max14577" compatible string somehow showed up in the 
kernel without any documentation, interesting...

Anyway:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
