From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] Documentation: bindings: brcmstb: Document write-pairing
Date: Mon, 14 Sep 2015 14:21:53 -0700
Message-ID: <55F73A71.8040500@gmail.com>
References: <1442260369-6575-1-git-send-email-f.fainelli@gmail.com> <1442260369-6575-2-git-send-email-f.fainelli@gmail.com> <55F72FD9.60607@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55F72FD9.60607-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 14/09/15 13:36, Rob Herring wrote:
> On 09/14/2015 02:52 PM, Florian Fainelli wrote:
>> Document the hif-cpubiuctrl node a bit more, and add a documentation
>> entry for the optional "brcm,write-pairing" property.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/arm/bcm/brcm,brcmstb.txt          | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt
>> index 430608ec09f0..602fa5f308bb 100644
>> --- a/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt
>> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt
>> @@ -20,6 +20,20 @@ system control is required:
>>      - compatible: "brcm,bcm<chip_id>-hif-cpubiuctrl", "syscon"
> 
> This has multiple chips allowed, but...
> 
>>      - compatible: "brcm,bcm<chip_id>-hif-continuation", "syscon"
>>  
>> +hif-cpubiuctrl node
>> +-------------------
> 
> Perhaps it is outside this context, but a description of the block would
> be nice.

Sure.

> 
>> +
>> +Required properties:
>> +
>> +    - compatible
>> +	The string should be "brcm.bcm7445-hif-cpubiuctrl", "syscon"
> 
> This is just one.

Right, will fix that.

> 
>> +
>> +Optional properties:
>> +
>> +    - brcm,write-pairing:
>> +	Boolean property, which when present indicatse that the chip
> 
> s/indicatse/indicates/
> 
>> +	supports write-pairing.
> 
> What is write pairing? Please give brief description.

I will provide an explanation in v2 for what that is.
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
