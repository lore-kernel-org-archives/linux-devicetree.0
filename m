From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/6] Documentation: devicetree: add bindings to support
 ARM MHU subchannels
Date: Mon, 8 May 2017 10:52:54 -0700
Message-ID: <20170508175254.GK15143@minitux>
References: <1493733353-25812-1-git-send-email-sudeep.holla@arm.com>
 <1493733353-25812-3-git-send-email-sudeep.holla@arm.com>
 <20170508161026.5vdqnv52ub7hurwf@rob-hp-laptop>
 <CABb+yY1+rU=gEnqML=ybZ61WDW6Brz_QLw4LpYNNe-XsEgi8dw@mail.gmail.com>
 <ff6535ec-fa31-e0b7-53a1-9f4a2f03693d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ff6535ec-fa31-e0b7-53a1-9f4a2f03693d@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Klimov <alexey.klimov@arm.com>, Jassi Brar <jaswinder.singh@linaro.org>, Devicetree List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon 08 May 10:07 PDT 2017, Sudeep Holla wrote:

> 
> 
> On 08/05/17 17:46, Jassi Brar wrote:
> > On Mon, May 8, 2017 at 9:40 PM, Rob Herring <robh@kernel.org> wrote:
> >> +Bjorn
> >>
> >> On Tue, May 02, 2017 at 02:55:49PM +0100, Sudeep Holla wrote:
> >>> The ARM MHU has mechanism to assert interrupt signals to facilitate
> >>> inter-processor message based communication. It drives the signal using
> >>> a 32-bit register, with all 32-bits logically ORed together. It also
> >>> enables software to set, clear and check the status of each of the bits
> >>> of this register independently. Each bit of the register can be
> >>> associated with a type of event that can contribute to raising the
> >>> interrupt thereby allowing it to be used as independent subchannels.
> >>>
> >>> Since the first version of this binding can't support sub-channels,
> >>> this patch extends the existing binding to support them.
> >>>
> >>> Cc: Alexey Klimov <alexey.klimov@arm.com>
> >>> Cc: Jassi Brar <jaswinder.singh@linaro.org>
> >>> Cc: Rob Herring <robh+dt@kernel.org>
> >>> Cc: devicetree@vger.kernel.org
> >>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> >>> ---
> >>>  .../devicetree/bindings/mailbox/arm-mhu.txt        | 44 ++++++++++++++++++++--
> >>>  1 file changed, 41 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> >>> index 4971f03f0b33..86a66f7918e2 100644
> >>> --- a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> >>> +++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> >>> @@ -10,21 +10,40 @@ STAT register and the remote clears it after having read the data.
> >>>  The last channel is specified to be a 'Secure' resource, hence can't be
> >>>  used by Linux running NS.
> >>>
> >>> +The MHU drives the interrupt signal using a 32-bit register, with all
> >>> +32-bits logically ORed together. It provides a set of registers to
> >>> +enable software to set, clear and check the status of each of the bits
> >>> +of this register independently. The use of 32 bits per interrupt line
> >>> +enables software to provide more information about the source of the
> >>> +interrupt. For example, each bit of the register can be associated with
> >>> +a type of event that can contribute to raising the interrupt.
> >>
> >> Sounds like a doorbell? (i.e. a single bit mailbox). Bjorn is doing
> >> something similar for QCom h/w. I guess the difference here is you have
> >> 32 sources and 1 output. It seems to me these should be described
> >> similarly.
> >>
> > Yes, QCom controller triggers different interrupt for each bit of a
> > 32bits register i.e, each signal is associated with 1bit information.
> > Whereas MHU signals 32bits at a time to the target cpu.
> 
> Agreed. I had a look at Qcom driver, not entirely clear if each bit as
> interrupt as I don't see any interrupt support there.

Each of the (used) bits in the Qualcomm HW are routed to a interrupt
controller in the remote processors.

As the APCS IPC is one way and each incoming "channel" is exposed as a
separate physical interrupt they are directly consumed by the higher
levels as needed - hence there's no traces of interrupts in the APCS
IPC.

> Also, it just adds
> all the 32 channels which I am trying to avoid as at-most 4-5 will be
> used while we end up creating 64 channels.
> 

In the Qualcomm platform I'm looking at right now 15 of the 32 bits are
used by the local CPU, so the utilization isn't awesome but I didn't
feel the waste was worth addressing in my case.

You should be able to provide a custom of_xlate that hides the fact that
your mailbox-space is sparse - i.e. only register the mailboxes you have
but expose them with ids as expected by the clients.

Regards,
Bjorn
