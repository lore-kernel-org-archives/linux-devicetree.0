From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v7 2/3] pinctrl: bcm2835: Add support for generic
 pinctrl binding
Date: Thu, 3 May 2018 19:38:39 +0200 (CEST)
Message-ID: <1763017303.92936.1525369119182@email.1und1.de>
References: <1525030092-3643-3-git-send-email-matheus@castello.eng.br>
 <1525135334-28506-1-git-send-email-matheus@castello.eng.br>
 <1525135334-28506-2-git-send-email-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525135334-28506-2-git-send-email-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, eric@anholt.net, Matheus Castello <matheus@castello.eng.br>
Cc: swarren@wwwdotorg.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


> Matheus Castello <matheus@castello.eng.br> hat am 1. Mai 2018 um 02:42 geschrieben:
> 
> 
> To keep driver up to date we add generic pinctrl binding support, which
> covers the features used in this driver and has additional node properties
> that this SoC has compatibility, so enabling future implementations of
> these properties without the need to create new node properties in the
> device trees.
> 
> The logic of this change maintain the old brcm legacy binding support in
> order to keep the ABI stable.
> 
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
> Reviewed-by: Eric Anholt <eric@anholt.net>

Patches 2 and 3 are

Acked-by: Stefan Wahren <stefan.wahren@i2se.com>

Thanks
Stefan

Btw Stephen isn't BCM2835 maintainer anymore
