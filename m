From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/2] net/macb: bindings doc: add sifive fu540-c000 binding
Date: Fri, 24 May 2019 10:26:32 +0530
Message-ID: <CAJ2_jOEErFdK=n7Brk5A_950vfikdFcxcRri4HXgJWqf0-zR=w@mail.gmail.com>
References: <1558611952-13295-1-git-send-email-yash.shah@sifive.com>
 <1558611952-13295-2-git-send-email-yash.shah@sifive.com> <CAL_Jsq+p5PnTDgxuh9_Aw1RvTk4aTYjKxyMq7DPczLzQVv8_ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+p5PnTDgxuh9_Aw1RvTk4aTYjKxyMq7DPczLzQVv8_ew@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: David Miller <davem@davemloft.net>, netdev <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>, Paul Walmsley <paul.walmsley@sifive.com>, Sachin Ghadi <sachin.ghadi@sifive.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 24, 2019 at 2:20 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Thu, May 23, 2019 at 6:46 AM Yash Shah <yash.shah@sifive.com> wrote:
> >
> > Add the compatibility string documentation for SiFive FU540-C0000
> > interface.
> > On the FU540, this driver also needs to read and write registers in a
> > management IP block that monitors or drives boundary signals for the
> > GEMGXL IP block that are not directly mapped to GEMGXL registers.
> > Therefore, add additional range to "reg" property for SiFive GEMGXL
> > management IP registers.
> >
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > ---
> >  Documentation/devicetree/bindings/net/macb.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bindings/net/macb.txt
> > index 9c5e944..91a2a66 100644
> > --- a/Documentation/devicetree/bindings/net/macb.txt
> > +++ b/Documentation/devicetree/bindings/net/macb.txt
> > @@ -4,6 +4,7 @@ Required properties:
> >  - compatible: Should be "cdns,[<chip>-]{macb|gem}"
> >    Use "cdns,at91rm9200-emac" Atmel at91rm9200 SoC.
> >    Use "cdns,at91sam9260-macb" for Atmel at91sam9 SoCs.
> > +  Use "cdns,fu540-macb" for SiFive FU540-C000 SoC.
>
> This pattern that Atmel started isn't really correct. The vendor
> prefix here should be sifive. 'cdns' would be appropriate for a
> fallback.

Ok sure. WIll change it to "sifive,fu540-macb"

Thanks for your comment.
- Yash
