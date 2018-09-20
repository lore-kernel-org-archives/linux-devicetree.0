From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3] ARM: dts: aspeed: Adding Facebook TiogaPass BMC
Date: Thu, 20 Sep 2018 16:52:18 +0930
Message-ID: <CACPK8Xd_ZKrQa3b98Bpb=wy_P3=FDUjPDfBSHx5Wx_NHk6Y5og@mail.gmail.com>
References: <20180918234110.1908926-1-vijaykhemka@fb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180918234110.1908926-1-vijaykhemka@fb.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vijaykhemka@fb.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hello Vijay,

On Wed, 19 Sep 2018 at 09:11, Vijay Khemka <vijaykhemka@fb.com> wrote:
> Initial introduction of Facebook TiogaPass family equipped with
> Aspeed 2500 BMC SoC. TiogaPass is a x86 server development kit
> with a ASPEED ast2500 BMC manufactured by Facebook.
> Specifically, This adds the tiogapass platform device tree file
> including the flash layout used by the tiogapass BMC machines.
>
> This also adds an entry of tiogapass device tree file in Makefile
>
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

It looks like you've addressed the concerns from previous reviews. If
any comments come up please address them in follow up patches.

I made some minor whitespace fixes and applied this to the aspeed
v4.20 device tree branch.

Cheers,

Joel
