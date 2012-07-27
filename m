From: rvaswani@codeaurora.org
Subject: Re: [DT] API to determine if interrupt is PPI or SPI ?
Date: Fri, 27 Jul 2012 13:00:24 -0700 (PDT)
Message-ID: <8cdb3e7e9dc79635a130214cf6ba1dd4.squirrel@www.codeaurora.org>
References: <53a41d02c4c4c24bdab47667183891bf.squirrel@www.codeaurora.org>
 <50128AA0.8040409@gmail.com>
 <20120727130947.GN559@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120727130947.GN559@mudshark.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rvaswani@codeaurora.org" <rvaswani@codeaurora.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "davidb@codeaurora.org" <davidb@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> On Fri, Jul 27, 2012 at 01:33:36PM +0100, Rob Herring wrote:
>> On 07/26/2012 02:18 PM, rvaswani@codeaurora.org wrote:
>> > Hello,
>> >
>> > We can specify the interrupt information in the device tree using the
>> arm
>> > gic convention.
>> > Is there an API to read directly the 1st cell and determine if an
>> > interrupt is a PPI or a SPI ? This information is directly relevant to
>> the
>> > driver because it needs to call request_irq or request_percpu_irq
>> based on
>> > this data.
>> >
>> > How should this be done ideally ?
>>
>> Seems a bit strange to me that you would have a h/w block that can be
>> connected either way...
>
> The CPU PMU can be wired as either SPI or PPI. The latter makes more sense
> to
> me but usually (although not exclusively) it's wired using the former.
>
> Will
>

We have the same driver for a hardware for different chipsets and
unfortunately the hardware team decided to connect this GIC interrupt
differently across these chipsets. This leaves us with a software choice
to make.
We could add another property to the device tree (like irq-is-percpu,
irq-is-not-percpu), but that seems redundant.
We were hoping to have an API to tell us the SPI/PPI difference since this
information is already encoded in the interrupt-cells in the device tree
for this device.
Would that be the right way to go or there is something better that can be
done ?

Thanks,
Rohit

-- 
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
