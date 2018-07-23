From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH V2 0/6] mailbox: ti-msgmgr: Add support for AM654 Secure
 Proxy
Date: Mon, 23 Jul 2018 09:14:12 -0500
Message-ID: <20180723141412.7zd6wp6y6pql7bm7@kahuna>
References: <20180716180607.16526-1-nm@ti.com>
 <20180723132956.tcsuxychhlhiwz6v@kahuna>
 <CABb+yY1_SBTDPyUNGSr8=tpU4oObz060nJ3NrgR8JyQye23cfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY1_SBTDPyUNGSr8=tpU4oObz060nJ3NrgR8JyQye23cfg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, ", linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, srv_heupstream" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 13:56-20180723, Jassi Brar wrote:
> On Mon, Jul 23, 2018 at 6:59 PM, Nishanth Menon <nm@ti.com> wrote:
[...]
> >>  .../bindings/mailbox/ti,secure-proxy.txt           |  50 +++
> >>  drivers/mailbox/ti-msgmgr.c                        | 353 +++++++++++++++++----
> >>  2 files changed, 336 insertions(+), 67 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/mailbox/ti,secure-proxy.txt
> >
> >
> > Jassi,
> >
> > I dont see this in next-20180723. You'd asked me to hold off on pings
> > https://lkml.org/lkml/2017/12/16/353 -> so, held off as much as I could
> > before wondering on the status.
> >
> I didn't ask you to not ping me. I said I didn't miss your patchset. I
> still didn't.
> 
> Especially for purely platform specific changes, that I don't have
> knowledge about, I leave them to cook in public as long as possible,
> before pulling them in around rc7.

Understood. Thanks.

> You submitted V2, 7days ago only and we are at rc6 today. So chill.

v2 is just wording of mailbox node example change recommended by Rob.
I was hoping to get any further changes prior to reposting a v2.. but
anyways.. Looks all good..

-- 
Regards,
Nishanth Menon
