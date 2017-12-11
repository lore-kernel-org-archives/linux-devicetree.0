From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 03/20] ARM: dts: aspeed-g4: Correct VUART IRQ number
Date: Mon, 11 Dec 2017 21:14:18 +1030
Message-ID: <CACPK8XfSxxVFT7y6M17LZhVO0GHuL1L=6KET75Qojg8rpgD9iw@mail.gmail.com>
References: <20171211050704.20621-1-joel@jms.id.au> <20171211050704.20621-4-joel@jms.id.au>
 <CAK8P3a2psgOYZEgO8O3H_xxpDTNd=ESJpSf4bs9kf0nPvKYqtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a2psgOYZEgO8O3H_xxpDTNd=ESJpSf4bs9kf0nPvKYqtQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>, Xo Wang <xow@google.com>, Lei YU <mine260309@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, DTML <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 11, 2017 at 6:28 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Dec 11, 2017 at 6:06 AM, Joel Stanley <joel@jms.id.au> wrote:
>> This should have always been 8.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> As this is a bugfix, should we backport it to stable kernels? When you
> fix a bug,
> I generally recommend including a 'Fixes' tag with the commit ID of the patch
> that introduced the problem, and either a 'Cc: stable@vger.kernel.org' tag
> if you want it backported, or an explanation in the changelog why it should
> not get backported. This really helps Greg and the other stable maintainers
> trying to make a decision what to backport and what not.

We could do this, and I generally follow the practice of adding Fixes
tags. I hadn't because without an upstream clock driver, the Aspeed
port is not usable by anyone without making modifications. We're
really depending on getting that code merged.

I will send it as a fix to 4.15. Do you mind taking individual patches
for the arm dt tree, or would you prefer a pull request?

Cheers,

Joel
