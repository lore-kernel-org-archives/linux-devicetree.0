From: Georgi Djakov <gdjakov@mm-sol.com>
Subject: Re: [PATCH v2 4/4] ARM: debug: qcom: add UART addresses to Kconfig
 help
Date: Tue, 27 May 2014 15:05:53 +0300
Message-ID: <53847FA1.60509@mm-sol.com>
References: <1400857952-6963-1-git-send-email-gdjakov@mm-sol.com>	<1400857952-6963-5-git-send-email-gdjakov@mm-sol.com>	<CABuKBe+B_Ga-w4aA4dApDTa26rCuhetRTJku27Madm+fHtDcLA@mail.gmail.com>	<53834578.9090305@mm-sol.com>
 <CABuKBeJXqSi=6XY5Fg7mg_daQ4D8ornS-kn7NDPktCtro7yNNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABuKBeJXqSi=6XY5Fg7mg_daQ4D8ornS-kn7NDPktCtro7yNNw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org, rvaswani@codeaurora.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, davidb@codeaurora.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 05/26/2014 08:17 PM, Matthias Brugger wrote:
> 2014-05-26 15:45 GMT+02:00 Georgi Djakov <gdjakov@mm-sol.com>:
>> On 23.05.14, 19:39, Matthias Brugger wrote:
>>>
>>> 2014-05-23 17:12 GMT+02:00 Georgi Djakov <gdjakov@mm-sol.com>:
>>>>
>>>> Add information about the APQ8084 debug UART physical and virtual
>>>> addresses in the DEBUG_QCOM_UARTDM Kconfig help section.
>>>> Requires: https://lkml.org/lkml/2014/4/14/312
>>>>
>>>> Signed-off-by: Georgi Djakov <gdjakov@mm-sol.com>
>>>> ---
>>>>  arch/arm/Kconfig.debug |    1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
>>>> index 40ee328..e71723d 100644
>>>> --- a/arch/arm/Kconfig.debug
>>>> +++ b/arch/arm/Kconfig.debug
>>>> @@ -376,6 +376,7 @@ choice
>>>>                   their output to the serial port on Qualcomm devices.
>>>>
>>>>                   ARCH      DEBUG_UART_PHYS   DEBUG_UART_BASE
>>>> +                 APQ8084   0xf995e000        0xfa75e000
>>>>                   MSM8X60   0x19c40000        0xf0040000
>>>>                   MSM8960   0x16440000        0xf0040000
>>>>                   MSM8974   0xf991e000        0xfa71e000
>>>
>>>
>>> You don't have any uart defined in your dts. You should add them
>>> before any adding low level debug support.
>>> Otherwise there might be problems in booting a multi-platform kernel.
>>>
>>
>> Thanks for the comment! As the uart depends on clocks, i am adding it to the
>> dts as part of my global clock controller patchset [1].
>> In this patch i am just adding some information to the help section.
>> Do you see any problem with this?
> 
> Are the patches for the clock controller applied already?
> If not, I would consider to add this patch to clock controller series.
> 

No, they are not applied yet. The uart dts definition depends on clocks, but the
DEBUG_LL support does not. And the DEBUG_LL support is already there as it is 
common with other SoCs. I am sorry, but i don't see dependency between the dts
definition and this patch. Could you explain please?

Thanks,
Georgi
