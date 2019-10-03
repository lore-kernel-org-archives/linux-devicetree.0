From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: ptp: Add binding doc for IDT ClockMatrix
 based PTP clock
Date: Thu, 3 Oct 2019 10:56:19 -0500
Message-ID: <CAL_JsqK12p48gqZdwNfYGNsBafmjMY=5U=QcHPHZy5sD-nGntA@mail.gmail.com>
References: <1568837198-27211-1-git-send-email-vincent.cheng.xh@renesas.com>
 <5d93ce84.1c69fb81.8e964.4dc1@mx.google.com> <20191003145546.GA19695@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003145546.GA19695@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent Cheng <vincent.cheng.xh@renesas.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "richardcochran@gmail.com" <richardcochran@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 3, 2019 at 10:12 AM Vincent Cheng
<vincent.cheng.xh@renesas.com> wrote:
>
> On Tue, Oct 01, 2019 at 06:09:06PM EDT, Rob Herring wrote:
> >On Wed, Sep 18, 2019 at 04:06:37PM -0400, vincent.cheng.xh@renesas.com wrote:
> >> From: Vincent Cheng <vincent.cheng.xh@renesas.com>
>
> Hi Rob,
>
> Welcome back.  Thank-you for providing feedback.
>
> >>
> >> Add device tree binding doc for the IDT ClockMatrix PTP clock driver.
> >
> >Bindings are for h/w, not drivers...
>
> Yes, will remove 'driver'.
>
> >>  Documentation/devicetree/bindings/ptp/ptp-idtcm.txt | 15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/ptp/ptp-idtcm.txt
> >
> >Please make this a DT schema.
>
> Sure, will give it a try.
>
> >> +  - compatible  Should be "idt,8a3400x-ptp" for System Synchronizer
> >> +                Should be "idt,8a3401x-ptp" for Port Synchronizer
> >> +                Should be "idt,8a3404x-ptp" for Universal Frequency Translator (UFT)
> >
> >If PTP is the only function of the chip, you don't need to append
> >'-ptp'.
>
> Okay, will remove '-ptp'.  Thanks.
>
>
> >What's the 'x' for? We generally don't use wildcards in compatible
> >strings.
>
> We were hoping to use 'x' to represent a single driver to match the various
> part numbers 8A34001, 8A34002, 8A34003, 8A34004, 8A34011, 8A34012, etc.
>
> What should be used instead of 'x'?

Enumerate all the part numbers. Are the differences discoverable in
some other way? If so, then 'x' is fine, but just add a note how
models are distinguished.

Rob
