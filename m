From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpio: 74x164: add lines-initial-states property
Date: Fri, 17 Aug 2018 09:10:05 -0600
Message-ID: <20180817151005.GG20845@rob-hp-laptop>
References: <20180815201855.29738-1-mail@david-bauer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180815201855.29738-1-mail@david-bauer.net>
Sender: linux-kernel-owner@vger.kernel.org
Cc: David Bauer <mail@david-bauer.net>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi, this email is from Rob's (experimental) review bot. I found a couple
of common problems with your patch. Please see below.

On Wed, 15 Aug 2018 22:18:54 +0200, David Bauer wrote:
> This adds the ability to define the initial state of each output line on
> device probe.
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>

The preferred subject prefix is "dt-bindings: <binding dir>: ...".

> ---
>  Documentation/devicetree/bindings/gpio/gpio-74x164.txt | 5 +++++
>  drivers/gpio/gpio-74x164.c                             | 3 +++
>  2 files changed, 8 insertions(+)
> 

DT bindings (including binding headers) should be a separate patch. See
Documentation/devicetree/bindings/submitting-patches.txt.
