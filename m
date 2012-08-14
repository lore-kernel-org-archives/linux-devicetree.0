From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] powerpc/mpic: Add Open-PIC global timer document
Date: Tue, 14 Aug 2012 16:18:40 -0500
Message-ID: <502AC0B0.5030801@freescale.com>
References: <1344578002-8057-1-git-send-email-Dongsheng.wang@freescale.com>
 <50255F49.5050500@freescale.com>
 <ABB05CD9C9F68C46A5CEDC7F15439259DB1450@039-SN2MPN1-022.039d.mgd.msft.net>
 <50293BEA.90401@freescale.com>
 <ABB05CD9C9F68C46A5CEDC7F15439259DB1A08@039-SN2MPN1-022.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <ABB05CD9C9F68C46A5CEDC7F15439259DB1A08-RL0Hj/+nBVC81RJBUSuqCa4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Wang Dongsheng-B40534 <B40534-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Yang-R58472 <r58472-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org" <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Gala Kumar-B11780 <B11780-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/13/2012 09:40 PM, Wang Dongsheng-B40534 wrote:
>>>> +Example 2:
>>>>> +
>>>>> +	timer: timer@010f0 {
>>>>> +		compatible = "open-pic,global-timer";
>>>>> +		device_type = "open-pic";
>>>>> +		reg = <0x010f0 4 0x01100 0x100>;
>>>>> +		interrupts = <0 0 3 0
>>>>> +			      1 0 3 0
>>>>> +			      2 0 3 0
>>>>> +		              3 0 3 0>;
>>>>> +	};
>>>>
>>>> 4-cell interrupt specifiers are specific to Freescale MPICs.  This
>>>> means there's no way to describe the timer interrupt on a non-
>> Freescale openpic.
>>>> Again, I suggest we not bother with this in the absence of an actual
>>>> need to support the timer on non-Freescale openpic in partitioned
>> scenarios.
>>>> The existing openpic node is sufficient to describe the
>>>> hardware in the absence of partitioning.   We could have an
>>>> "openpic-no-timer" property to indicate that we're describing it
>>>> separately, so that the absence of a timer node isn't ambiguous as to
>>>> whether it's an old tree or a partitioned scenario.  An fsl,mpic
>>>> compatible would imply openpic-no-timer.
>>>>
>>>> Note that I believe many of the non-Freescale openpic nodes are going
>>>> to be found on systems with real Open Firmware, so we can't go
>>>> changing the device tree for them.
>>> [Wang Dongsheng] In the Open-PIC specification, there are four timer.
>>> 		interrupts = <0 0 3 0
>>> 			      1 0 3 0
>>> 			      2 0 3 0
>>> 		              3 0 3 0>;
>>>
>>> The "interrupts" just let user know there are four timers. Usage based
>> "interrupts"
>>> binding to change dts.
>>
>> I can't understand the above or how it's a response to what I wrote.
>>
> [Wang Dongsheng] I mean this just to tell how many timers to support in Open-PIC
> specification. If someone needs to write "interrupts" into dts, this must comply
> with the specification of the interrupt to write. this is based on the pic driver
> should be changed in different platforms.

My point (beyond that examples provided should be valid for *some*
system) is there is no valid thing to put in the interrupts property
here when the interrupt controller is not "fsl,mpic", so this doesn't work.

-Scott
