From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 0/3] update aspeed-bmc-opp-zaius device-tree
Date: Mon, 29 Apr 2019 08:27:49 +0000
Message-ID: <CACPK8XeTOhcdKPsKgsBJXAYeMDeHRLOSLRF5XO0oT-5XUhghMQ@mail.gmail.com>
References: <20190416162150.150154-1-venture@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416162150.150154-1-venture@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrick Venture <venture@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 16 Apr 2019 at 16:22, Patrick Venture <venture@google.com> wrote:
>
> Hi,
>
> This series contains three updates to the Zaius ASPEED device-tree to
> add voltrage regulators, and update addresses and aliases.  The Infineon
> and Intersil drivers are staged on hwmon-next, and the trivial device
> dt-bindings changed are up for review.

Applied to the aspeed SoC tree, thanks Patrick.

Cheers,

Joel

>
> Maxim Sloyko (1):
>   ARM: dts: aspeed: zaius: add Infineon and Intersil regulators
>
> Robert Lippert (2):
>   ARM: dts: aspeed: zaius: update 12V brick I2C address
>   ARM: dts: aspeed: zaius: fixed I2C bus numbers for pcie slots
>
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 121 +++++++++++++++++++--
>  1 file changed, 113 insertions(+), 8 deletions(-)
>
> --
> 2.21.0.392.gf8f6787159e-goog
>
