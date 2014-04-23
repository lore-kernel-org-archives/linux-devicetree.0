From: Diana Craciun <diana.craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2] powerpc/fsl: Added binding for Freescale CoreNet coherency
 fabric (CCF)
Date: Wed, 23 Apr 2014 17:16:19 +0300
Message-ID: <5357CB33.4070207@freescale.com>
References: <1397833917-12611-1-git-send-email-diana.craciun@freescale.com>
 <1397856821.1694.126.camel@snotra.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397856821.1694.126.camel-88ow+0ZRuxG2UiBs7uKeOtHuzzzSOjJt@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/19/2014 12:33 AM, Scott Wood wrote:
> On Fri, 2014-04-18 at 18:11 +0300, Diana Craciun wrote:
>> From: Diana Craciun <Diana.Craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>
>> The CoreNet coherency fabric is a fabric-oriented, conectivity
>> infrastructure that enables the implementation of coherent, multicore
>> systems. The CCF acts as a central interconnect for cores,
>> platform-level caches, memory subsystem, peripheral devices and I/O host
>> bridges in the system.
>>
>> Signed-off-by: Diana Craciun <Diana.Craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> ---
>>   .../devicetree/bindings/powerpc/fsl/ccf.txt        | 36 ++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/ccf.txt
>>
>> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/ccf.txt b/Documentation/devicetree/bindings/powerpc/fsl/ccf.txt
>> new file mode 100644
>> index 0000000..f0b7143
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/powerpc/fsl/ccf.txt
>> @@ -0,0 +1,36 @@
>> +Freescale CoreNet Coherency Fabric(CCF) Device Tree Binding
>> +
>> +DESCRIPTION
>> +
>> +The CoreNet coherency fabric is a fabric-oriented, connectivity infrastructure
>> +that enables the implementation of coherent, multicore systems.
>> +
>> +Required properties:
>> +
>> +- compatible : <string>
>> +		Must include "fsl,corenetX-cf", "fsl,corenet-cf" - CoreNet coherency
>> +		fabric version X
> Specify "fsl,corenet1-cf" and "fsl,corenet2-cf" rather than
> "fsl,corenetX-cf" (given there's nothing in a chip manual that you can
> correlate with the value of X), and provide example chips for each.

OK.

> Also specify that "fsl,corenet-cf" represents the registers that are
> common between the two versions (not arbitrary "fsl,corenetX-cf" -- if
> there's ever an "fsl,corenet3-cf" it may not be compatible with this),
> and is retained for compatibility reasons.
>

What do you mean by common?  There are the csdids and snoop ids 
registers which are common  between the two versions but only by name 
because the register format is not the same.

Diana


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
