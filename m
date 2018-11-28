From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [RFC v3 2/3] dt-bindings: sdm845-pinctrl: add wakeup interrupt
 parent for GPIO
Date: Wed, 28 Nov 2018 10:39:59 -0700
Message-ID: <20181128173959.GC18262@codeaurora.org>
References: <20181121000648.29262-1-ilina@codeaurora.org>
 <20181121000648.29262-3-ilina@codeaurora.org>
 <154283618199.88331.10217252750356423959@swboyd.mtv.corp.google.com>
 <20181126161455.GA28236@codeaurora.org>
 <154330994255.88331.11409511159882116164@swboyd.mtv.corp.google.com>
 <20181127182123.GC28236@codeaurora.org>
 <154335513853.88331.9713562640538396853@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154335513853.88331.9713562640538396853@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: evgreen@chromium.org, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, rplsssn@codeaurora.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, Nov 27 2018 at 14:45 -0700, Stephen Boyd wrote:
>Quoting Lina Iyer (2018-11-27 10:21:23)
>> On Tue, Nov 27 2018 at 02:12 -0700, Stephen Boyd wrote:
>> >
>> >Two reasons. First, simplicity. The TLMM driver just needs to pass the
>> >gpio number up to the PDC gpio domain and then that domain can figure
>> >out what hwirq it maps to within the PDC hw irq space. I don't see any
>> >reason why we have to know the hwirq of PDC within the TLMM driver
>> >besides "let's not be different".
>> >
>> >And second, it makes it easier for us to implement the MPM case in the
>> >TLMM driver by letting the TLMM code just ask "should I mask the irq
>> >here or not?" by passing that with a wrapper struct around the fwspec
>> >and a dedicated domain in the PDC/MPM driver. Keeping less things in the
>> >TLMM driver and not driving the decision from DT but from tables in the
>> >PDC driver also keeps things simple and reduces DT parsing code/time.
>> >
>> Couldn't this be simply achieved by matching the compatible flags for
>> PDC/MPM bindings for the wakeup-parent in the TLMM driver?
>>
>
>It could be, but then we would be making TLMM highly aware of the wakeup
>parent
It is is not aware of anything about the wakeup parent, just the
compatible that indicates whether it needs to be mask locally or not.

>and have to do compatible string matching in two places, instead
>of making TLMM more abstractly aware that it needs to keep things masked
>while irq parent deals with the interrupts.
>
Your approach seems too complex just to circumvent a simple match node.
I think we are stretching too much to support something that is not a
priority.

-- Lina
