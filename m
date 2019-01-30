From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: Add peci and lpc for Facebook
Date: Wed, 30 Jan 2019 14:27:00 +1100
Message-ID: <CACPK8Xc91m9TWoRSgDCT7bVJC=C=w7mse8xbdCgw5vMVgMXM=Q@mail.gmail.com>
References: <20190123230733.1821501-1-vijaykhemka@fb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123230733.1821501-1-vijaykhemka@fb.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Thu, 24 Jan 2019 at 10:07, Vijay Khemka <vijaykhemka@fb.com> wrote:

> index 73e58a821613..d60dbb019f82 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts

>
> +&peci0 {
> +       status = "okay";
> +};

I don't think we have an upstream tree that contains a node called
peci0. Therefore this does not build.

I have dropped this hunk from your patch. Please make sure you test
before sending patches.

Cheers,

Joel
