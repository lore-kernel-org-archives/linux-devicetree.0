From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 3/5] gpio: of: Return error if gpio hog configuration failed
Date: Thu, 14 Apr 2016 14:52:16 +0200
Message-ID: <CACRpkdaQra43TxaW4wSTHMQDVNxi+8C5+wWFNy9wi0KktqrU2w@mail.gmail.com>
References: <1457703804-3016-1-git-send-email-ldewangan@nvidia.com>
	<1457703804-3016-4-git-send-email-ldewangan@nvidia.com>
	<CACRpkdbLKWDGvhqtwoogNNgQjG86g9HmpceLLVwKW+94dJk63A@mail.gmail.com>
	<570E416E.1000608@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <570E416E.1000608@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Markus Pargmann <mpa@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <treding@nvidia.com>, Benoit Parrot <bparrot@ti.com>, Alexandre Courbot <acourbot@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 13, 2016 at 2:54 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> On Wednesday 13 April 2016 06:13 PM, Linus Walleij wrote:

> Thank you very much for accepting the patch.
> I think 1/5 and 2/5 is also fine as there is no more comment on this.

I have applied them now.

I had a comment on 1/5, I wanted a confirmation that
it was done to be able to set status = "disabled" in the
device node.

I assume this is true so now I added that to the commit
blurb.

Yours,
Linus Walleij
