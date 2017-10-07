From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v3 03/22] dt-bindings: arm: scmi: add ARM MHU specific
 mailbox client bindings
Date: Sat, 7 Oct 2017 07:56:37 +0530
Message-ID: <CABb+yY2v8D9NFVsG9OwSpL8cswKihY6OUru8QA6Jfq5YmVVD7A@mail.gmail.com>
References: <1506604306-20739-1-git-send-email-sudeep.holla@arm.com>
 <1506604306-20739-4-git-send-email-sudeep.holla@arm.com> <20171005232031.7373ni5ssln4wlpr@rob-hp-laptop>
 <CABb+yY1ra5bgRB1VND+NvCcDFqfggG04a+JPWFZ+HpNg08eR8g@mail.gmail.com> <CAL_Jsq+0paGePmJVjsyFJiHx0UaDPjQrbe3C030U+fuUkWCJ+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+0paGePmJVjsyFJiHx0UaDPjQrbe3C030U+fuUkWCJ+A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, ALKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Roy Franz <roy.franz@cavium.com>, Harb Abdulhamid <harba@codeaurora.org>, Nishanth Menon <nm@ti.com>, Arnd Bergmann <arnd@arndb.de>, Loc Ho <lho@apm.com>, Alexey Klimov <alexey.klimov@arm.com>, Ryan Harkin <Ryan.Harkin@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 6, 2017 at 9:24 PM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Oct 6, 2017 at 6:01 AM, Jassi Brar <jassisinghbrar@gmail.com> wrote:
>> On Fri, Oct 6, 2017 at 4:50 AM, Rob Herring <robh@kernel.org> wrote:
>>> On Thu, Sep 28, 2017 at 02:11:27PM +0100, Sudeep Holla wrote:

>>>
>>>> +- mbox-data : For each phandle listed in mboxes property, an unsigned 32-bit
>>>> +           data as expected by the mailbox controller
>>>
>>> Shouldn't that be cells as part of mboxes property?
>>>
>> A MHU client can send any number of commands (such u32 values) over a channel.
>> This client (SCMI) sends just one command over a channel, but other
>> clients may/do send two or more.
>
> Okay, then I guess I don't understand why this is in DT.
>
Yeah the client has to provide code (u32 value) for the commands it
sends, and that value is going to be platform specific. For example,
on Juno the ITS_AN_SCMI_COMMAND may be defined as BIT(7) while on my
platform it may be 0x4567

For MHU based platforms, it becomes easy if the u32 is passed from DT.
And that should be ok since that is like a h/w parameter - a value
chosen/expected by the remote firmware.

thnx
