From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [RFC v3 2/3] dt-bindings: sdm845-pinctrl: add wakeup interrupt
 parent for GPIO
Date: Tue, 27 Nov 2018 11:21:23 -0700
Message-ID: <20181127182123.GC28236@codeaurora.org>
References: <20181121000648.29262-1-ilina@codeaurora.org>
 <20181121000648.29262-3-ilina@codeaurora.org>
 <154283618199.88331.10217252750356423959@swboyd.mtv.corp.google.com>
 <20181126161455.GA28236@codeaurora.org>
 <154330994255.88331.11409511159882116164@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154330994255.88331.11409511159882116164@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: evgreen@chromium.org, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, rplsssn@codeaurora.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, Nov 27 2018 at 02:12 -0700, Stephen Boyd wrote:
>Quoting Lina Iyer (2018-11-26 08:14:55)
>> On Wed, Nov 21 2018 at 14:36 -0700, Stephen Boyd wrote:
>> >Quoting Lina Iyer (2018-11-20 16:06:47)
>> >> SDM845 SoC has an always-on interrupt controller (PDC) with select GPIO
>> >> routed to the PDC as interrupts that can be used to wake the system up
>> >> from deep low power modes and suspend.
>> >>
>> >> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> >> ---
>> >>  .../bindings/pinctrl/qcom,sdm845-pinctrl.txt  | 31 ++++++++++++++++++-
>> >>  1 file changed, 30 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
>> >> index 665aadb5ea28..bedfa0b57fa6 100644
>> >> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
>> >> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
>> >> @@ -29,6 +29,17 @@ SDM845 platform.
>> >>         Definition: must be 2. Specifying the pin number and flags, as defined
>> >>                     in <dt-bindings/interrupt-controller/irq.h>
>> >>
>> >> +- wakeup-parent:
>> >> +       Usage: optional
>> >> +       Value type: <phandle>
>> >> +       Definition: A phandle to the wakeup interrupt controller for the SoC.
>> >> +
>> >> +- wakeup-irq:
>> >
>> >This shouldn't be needed. TLMM driver can probe for the possibility of
>> >wakeup capable irqs from irq allocation step. The only place we should
>> >need to know what TLMM pins map to what PDC lines is in the PDC driver.
>> >
>> Why? Every driver seems to translate the hardware IRQ and pass it to
>> it's parent. Why should this be any different ? The PDC is an interrupt
>> controller that just knows an interrupt port and maps it to the GIC. Not
>> sure, I understand the reasoning for this. It seems to add more
>> confusing relationship with the PDC interrupt controller, that way.
>>
>
>Two reasons. First, simplicity. The TLMM driver just needs to pass the
>gpio number up to the PDC gpio domain and then that domain can figure
>out what hwirq it maps to within the PDC hw irq space. I don't see any
>reason why we have to know the hwirq of PDC within the TLMM driver
>besides "let's not be different".
>
>And second, it makes it easier for us to implement the MPM case in the
>TLMM driver by letting the TLMM code just ask "should I mask the irq
>here or not?" by passing that with a wrapper struct around the fwspec
>and a dedicated domain in the PDC/MPM driver. Keeping less things in the
>TLMM driver and not driving the decision from DT but from tables in the
>PDC driver also keeps things simple and reduces DT parsing code/time.
>
Couldn't this be simply achieved by matching the compatible flags for
PDC/MPM bindings for the wakeup-parent in the TLMM driver? 

Thanks,
Lina
