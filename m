From: Anton Vorontsov <anton@enomsg.org>
Subject: Re: [PATCH v7 1/3] charger: max14577: Add charger support for Maxim
 14577
Date: Mon, 23 Dec 2013 18:53:22 -0800
Message-ID: <20131224025321.GE10223@lizard>
References: <1386329534-14186-1-git-send-email-k.kozlowski@samsung.com>
 <1386329534-14186-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1386329534-14186-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 06, 2013 at 12:32:12PM +0100, Krzysztof Kozlowski wrote:
> MAX14577 chip is a multi-function device which includes MUIC, charger
> and voltage regulator. The driver is located in drivers/mfd.
> 
> This patch supports battery charging control of MAX14577 chip and
> provides power supply class information to userspace.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---

Applied, thanks!

Anton
