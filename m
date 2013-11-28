From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 2/5] extcon: max14577: Add extcon-max14577 driver to
 support MUIC device
Date: Thu, 28 Nov 2013 12:53:11 +0900
Message-ID: <5296BE27.1040904@samsung.com>
References: <1385135469-27044-1-git-send-email-k.kozlowski@samsung.com>
 <1385135469-27044-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1385135469-27044-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

On 11/23/2013 12:51 AM, Krzysztof Kozlowski wrote:
> From: Chanwoo Choi <cw00.choi@samsung.com>
> 
> This patch supports Maxim MAX14577 MUIC(Micro USB Interface Controller)
> device by using EXTCON subsystem to handle various external connectors.
> The max14577 device uses regmap method for i2c communication and
> supports irq domain.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/extcon/Kconfig           |   10 +
>  drivers/extcon/Makefile          |    1 +
>  drivers/extcon/extcon-max14577.c |  752 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 763 insertions(+)
>  create mode 100644 drivers/extcon/extcon-max14577.c
> 

Applied it.

Thanks,
Chanwoo Choi

