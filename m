From: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [PATCH v2 1/2] regulator: act8945a: add regulator driver for ACT8945A
Date: Wed, 13 Jan 2016 15:22:12 +0100
Message-ID: <87oacp5zl7.fsf@dell.be.48ers.dk>
References: <1452586629-1117-1-git-send-email-wenyou.yang@atmel.com>
	<1452586629-1117-2-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452586629-1117-2-git-send-email-wenyou.yang@atmel.com> (Wenyou
	Yang's message of "Tue, 12 Jan 2016 16:17:08 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Wenyou Yang <wenyou.yang@atmel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

>>>>> "Wenyou" == Wenyou Yang <wenyou.yang@atmel.com> writes:

 > This patch adds new regulator driver to support ACT8945A MFD
 > chip's regulators.

 > The ACT8945A has three step-down DC/DC converters and four
 > low-dropout regulators.

 > Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>

Isn't the regulator part of the act8945a identical to act8865? Can't we
just use the existing act8865-regulator.c driver? (E.G. support 8865
variant in the mfd driver, but only register the regulator sub device?)

-- 
Bye, Peter Korsgaard
