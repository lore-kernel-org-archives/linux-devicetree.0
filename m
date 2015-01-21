From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/3] pinctrl: at91: allow to have disabled gpio bank
Date: Wed, 21 Jan 2015 10:48:54 +0100
Message-ID: <CACRpkdZg4hXF6f8o_OkRLRUfC_XqwUXLH4Yx+0p5XJSPya7HDA@mail.gmail.com>
References: <1421422267-2934-1-git-send-email-ludovic.desroches@atmel.com>
	<1421422267-2934-2-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1421422267-2934-2-git-send-email-ludovic.desroches@atmel.com>
Sender: stable-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, stable <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 16, 2015 at 4:31 PM, Ludovic Desroches
<ludovic.desroches@atmel.com> wrote:

> From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
>
> Today we expect that all the bank are enabled, and count the number of banks
> used by the pinctrl based on it instead of using the last bank id enabled.
>
> So switch to it, set the chained IRQ at runtime based on enabled banks
> and wait only the number of enabled gpio controllers at probe time.
>
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
>
> Cc: <stable@vger.kernel.org> # 3.18

Patch applied for fixes with Nicolas' ACK.

Yours,
Linus Walleij
