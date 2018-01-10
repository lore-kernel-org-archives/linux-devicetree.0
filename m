From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 1/2 v10] net: ethernet: Add DT bindings for
 the Gemini ethernet
Date: Wed, 10 Jan 2018 15:40:47 -0500 (EST)
Message-ID: <20180110.154047.2155726732823195708.davem@davemloft.net>
References: <20180109221053.927-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=euc-kr
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180109221053.927-1-linus.walleij@linaro.org>
Sender: netdev-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: netdev@vger.kernel.org, mirq-linux@rere.qmqm.pl, janos.dev@gmail.com, paulius.zaleckas@gmail.com, linux-arm-kernel@lists.infradead.org, ulli.kroll@googlemail.com, f.fainelli@gmail.com, devicetree@vger.kernel.org, tobias.waldvogel@gmail.com
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue,  9 Jan 2018 23:10:52 +0100

> This adds the device tree bindings for the Gemini ethernet
> controller. It is pretty straight-forward, using standard
> bindings and modelling the two child ports as child devices
> under the parent ethernet controller device.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Tobias Waldvogel <tobias.waldvogel@gmail.com>
> Cc: Micha©© Miros©©aw <mirq-linux@rere.qmqm.pl>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied.
