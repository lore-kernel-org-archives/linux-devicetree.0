From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/3] mfd: max77686: Don't suggest in binding to use a
 deprecated property
Date: Mon, 13 Jul 2015 16:48:37 +0900
Message-ID: <55A36D55.4070400@samsung.com>
References: <1436773348-15316-1-git-send-email-javier@osg.samsung.com>
 <1436773348-15316-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1436773348-15316-2-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 13.07.2015 16:42, Javier Martinez Canillas wrote:
> The regulator-compatible property from the regulator DT binding was
> deprecated. But the max77686 DT binding doc still suggest to use it
> instead of the regulator node name's which is the correct approach.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
>  Documentation/devicetree/bindings/mfd/max77686.txt | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
