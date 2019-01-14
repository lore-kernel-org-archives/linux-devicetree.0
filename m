From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v10 05/12] ARM: dts: aspeed: peci: Add PECI node
Date: Mon, 14 Jan 2019 16:15:46 +1030
Message-ID: <CACPK8Xf-54Q7s_z8J=ZBoYqiFuy7_QAvsDqgT2CO0LFOvx8tqg@mail.gmail.com>
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com> <20190107214136.5256-6-jae.hyun.yoo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107214136.5256-6-jae.hyun.yoo@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jason M Biils <jason.m.bills@linux.intel.com>, Haiyue Wang <haiyue.wang@linux.intel.com>, James Feist <james.feist@linux.intel.com>, Vernon Mauery <vernon.mauery@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Hi Jae,

On Tue, 8 Jan 2019 at 08:11, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit adds PECI bus/adapter node of AST24xx/AST25xx into
> aspeed-g4 and aspeed-g5.

This looks good, aside from the alias.

It will go via my aspeed tree once the bindings are merged. Send them
to linux-aspeed@lists.ozlabs.org at that time.

In the future I suggest leaving the changes to arch/arm/boot/dts until
after the bindings and driver patches have landed. They will rarely go
in before hand as the bindings need to be agreed on.


>                 serial3 = &uart4;
>                 serial4 = &uart5;
>                 serial5 = &vuart;
> +               peci0 = &peci0;

I don't think this is necessary. Can you explain why you think you need it?

Cheers,

Joel
