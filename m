From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 1/4] mailbox: arm_mhuv2: add device tree binding documentation
Date: Wed, 14 Aug 2019 09:52:25 -0500
Message-ID: <CABb+yY1jZs0OU-oi86iNNHiqBTjaY6ixFPMoUPkU6MCH_YrwLg@mail.gmail.com>
References: <20190717192616.1731-1-tushar.khandelwal@arm.com>
 <20190717192616.1731-2-tushar.khandelwal@arm.com> <CABb+yY04vW-i35N6P57KSKgmMAYkrA2CDyUvA-bLCZMxiZaocw@mail.gmail.com>
 <CABb+yY1SeHTgZQNAHJW+dZG=khah5c5igtKy+MrjADnZF29Aow@mail.gmail.com>
 <VI1PR0601MB21113C48E719B2C79EC2FE508FC20@VI1PR0601MB2111.eurprd06.prod.outlook.com>
 <CABb+yY3yMWbUiQnJgfQhwnW1OM3aoFL3ZFc018E-fxGichi-4Q@mail.gmail.com>
 <VI1PR0601MB2111A5A4E951F011D389A8978FD90@VI1PR0601MB2111.eurprd06.prod.outlook.com>
 <CABb+yY3Ni7wV+ui1LO7TERWQH_BoakZbPq961wdRPB4X-nwS2A@mail.gmail.com> <20190814100518.GA21898@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814100518.GA21898@e107155-lin>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Morten Borup Petersen <morten_bp@live.dk>, Tushar Khandelwal <tushar.khandelwal@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "tushar.2nov@gmail.com" <tushar.2nov@gmail.com>, "nd@arm.com" <nd@arm.com>, Morten Borup Petersen <morten.petersen@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 14, 2019 at 5:05 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Tue, Aug 13, 2019 at 11:36:56AM -0500, Jassi Brar wrote:
> [...]
>
> > > >>
> > > >> As mentioned in the response to your initial comment, the driver does
> > > >> not currently support mixing protocols.
> > > >>
> > > > Thanks for acknowledging that limitation. But lets also address it.
> > > >
> > >
> > > We are hesitant to dedicate time to developing mixing protocols given
> > > that we don't have any current usecase nor any current platform which
> > > would support this.
> > >
> > Can you please share the client code against which you tested this driver?
> > From my past experience, I realise it is much more efficient to tidyup
> > the code myself, than endlessly trying to explain the benefits.
> >
>
> Thanks for the patience and offer.
>
Ok, but the offer is to Morten for MHUv2 driver.

> Can we try the same with MHUv1 and SCMI
> upstream driver.
>
MHUv1 driver is fine as it is.
I did try my best to keep you from messing the SCMI driver, without success
https://lkml.org/lkml/2017/8/7/924
