From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 0/7] Renesas R8A7790 Common Clock Framework support
Date: Thu, 14 Nov 2013 16:23:05 +0100
Message-ID: <9051092.bb2GyTMq0G@avalon>
References: <1384052977-30616-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CANqRtoRfBb_mZ3erk_iSmmjuFJAWetN3THjGQcBhEjVE__2wWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CANqRtoRfBb_mZ3erk_iSmmjuFJAWetN3THjGQcBhEjVE__2wWg@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, SH-Linux <linux-sh@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Magnus,

On Thursday 14 November 2013 19:16:05 Magnus Damm wrote:
> Hi Laurent,
> 
> Thanks for V2, it is looking better and better. Great that r8a7791 and
> r8a7790 can share the CPG code. I have now finally got my r8a7791 board
> replaced so I intend to try your code out on Lager and then see if I can
> cook something up on Koelsch.

I was actually planning to test the code on the Koelsch board. I don't want to 
step on anyone's toes, so please let me know if someone is already working on 
CCF patches for M2, otherwise I'll send them.

> I have one question related to the CPG. What is your plan regarding CPU
> Frequency scaling? I'd like to see "z_clk" and "z2_clk" implemented together
> with some way to let CPUFreq scale "z_clk". Can you please spend some time
> on that?

Z2 is a fixed factor clock, I'll just add it to DT.

Z is a bit more tricky. It's the output of a pure multiplier (PLL0) followed 
by a pure divisor (SYS-CPU divider 1). I can easily model the two as separate 
clock devices, but I'm unsure about what should be done at runtime when 
setting the Z clock frequency. Would it be enough to have a fixed PLL0 
frequency and configure the SYS-CPU divider 1 only (from 1/1 to 1/32), or 
would we need to configure the PLL0 multiplier as well for a more fine-grained 
Z frequency configuration ?

-- 
Regards,

Laurent Pinchart

