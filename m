From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: interrupt-controller: Amazon's
 Annapurna Labs FIC
Date: Tue, 9 Jul 2019 07:25:33 -0600
Message-ID: <CAL_JsqLNWAw2LtCvnsDkrUTmk-Vy1ncwR4XuCN7=_Sg8vbTr2w@mail.gmail.com>
References: <1560155683-29584-1-git-send-email-talel@amazon.com>
 <1560155683-29584-2-git-send-email-talel@amazon.com> <20190709022301.GA8734@bogus>
 <f1fd393d-0b8c-16f1-9ac2-0589e9cb9ea7@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f1fd393d-0b8c-16f1-9ac2-0589e9cb9ea7@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Shenhar, Talel" <talel@amazon.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, David Miller <davem@davemloft.net>, Shawn Lin <shawn.lin@rock-chips.com>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dwmw@amazon.co.uk, Benjamin Herrenschmidt <benh@kernel.crashing.org>, jonnyc@amazon.com, hhhawa@amazon.com, ronenk@amazon.com, hanochu@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

On Tue, Jul 9, 2019 at 12:00 AM Shenhar, Talel <talel@amazon.com> wrote:
>
> Marc, should I publish those fixes as new patch that updates the
> dt-bindings or new patchset to this list?
>
> On 7/9/2019 5:23 AM, Rob Herring wrote:
> > On Mon, Jun 10, 2019 at 11:34:42AM +0300, Talel Shenhar wrote:
> >> +- #interrupt-cells: must be 2.
> >> +  First cell defines the index of the interrupt within the controller.
> >> +  Second cell is used to specify the trigger type and must be one of the
> >> +  following:
> >> +    - bits[3:0] trigger type and level flags
> >> +    1 = low-to-high edge triggered
> >> +    4 = active high level-sensitive
> > No need to define this here. Reference the standard definition.
>
> This device only support those two modes.
>
> This definition tries to capture the supported modes.
>
> Should I just state that those two modes are supported and then avoid
> the actual bits and values?

Yes.

Rob
