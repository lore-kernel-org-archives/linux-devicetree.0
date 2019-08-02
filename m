From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Add Facebook Wedge100 BMC
Date: Fri, 2 Aug 2019 03:02:30 +0000
Message-ID: <CACPK8XdS4m9+74oxK0-ed3ZLr_QCh--AsFgGcF-OpLw24v9g4Q@mail.gmail.com>
References: <20190802010155.489238-1-taoren@fb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190802010155.489238-1-taoren@fb.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tao Ren <taoren@fb.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2 Aug 2019 at 01:02, Tao Ren <taoren@fb.com> wrote:
> +
> +       chosen {
> +               stdout-path = &uart3;
> +               bootargs = "debug console=ttyS2,9600n8 root=/dev/ram rw";

Are you sure you want 'debug' in your boot arguments?

The rest lgtm. I can remove debug when applying, or leave it there if
it was intentional.

Cheers,

Joel
