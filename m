From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/4] mailbox: arm_mhuv2: add device tree binding
 documentation
Date: Fri, 2 Aug 2019 11:53:57 +0100
Message-ID: <20190802105357.GF23424@e107155-lin>
References: <20190717192616.1731-1-tushar.khandelwal@arm.com>
 <20190717192616.1731-2-tushar.khandelwal@arm.com>
 <CABb+yY04vW-i35N6P57KSKgmMAYkrA2CDyUvA-bLCZMxiZaocw@mail.gmail.com>
 <CABb+yY1SeHTgZQNAHJW+dZG=khah5c5igtKy+MrjADnZF29Aow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY1SeHTgZQNAHJW+dZG=khah5c5igtKy+MrjADnZF29Aow@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Tushar Khandelwal <tushar.khandelwal@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, tushar.2nov@gmail.com, morten_bp@live.dk, nd@arm.com, Morten Borup Petersen <morten.petersen@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 25, 2019 at 12:49:58AM -0500, Jassi Brar wrote:
> On Sun, Jul 21, 2019 at 4:58 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
> >

[...]

> > If the mhuv2 instance implements, say, 3 channel windows between
> > sender (linux) and receiver (firmware), and Linux runs two protocols
> > each requiring 1 and 2-word sized messages respectively. The hardware
> > supports that by assigning windows [0] and [1,2] to each protocol.
> > However, I don't think the driver can support that. Or does it?
> >
> Thinking about it, IMO, the mbox-cell should carry a 128 (4x32) bit
> mask specifying the set of windows (corresponding to the bits set in
> the mask) associated with the channel.
> And the controller driver should see any channel as associated with
> variable number of windows 'N', where N is [0,124]
>
> mhu_client1: proto1@2e000000 {
>        .....
>        mboxes = <&mbox 0x0 0x0 0x0 0x1>
> }
>
> mhu_client2: proto2@2f000000 {
>        .....
>        mboxes = <&mbox 0x0 0x0 0x0 0x6>
> }
>

This still doesn't address the overhead I mentioned in my arm_mhu_v1
series.

As per you suggestion, we will have one channel with all possible
bit mask value to specify the window. Let's imagine that 2 protocols
share the same channel, then the requests are serialised.
E.g. if bits 0 and 1 are allocated for say protocol#1 and bits 2 and 3
for protocol#2.

Further protocol#1 has higher latency requirements like sched-governor
DVFS and there are 3-4 pending requests on protocol#2, then the incoming
requests for protocol#1 is blocked.

This is definitely overhead and I have seen lots of issue around this
and hence I was requesting that we need to create individual channels
for each of these. Having abstraction on top to multiplex or arbitrate
won't help.

--
Regards,
Sudeep
