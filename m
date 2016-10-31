From: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: Document Broadcom OTP controller
 driver
Date: Mon, 31 Oct 2016 13:12:43 -0700
Message-ID: <350b2f50-29dd-6a96-62af-b5c973322298@broadcom.com>
References: <1477336324-10543-1-git-send-email-jonathan.richardson@broadcom.com>
 <1477336324-10543-2-git-send-email-jonathan.richardson@broadcom.com>
 <20161031013848.4vi2544tb5cs65nk@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161031013848.4vi2544tb5cs65nk@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Oza Pawandeep <oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 16-10-30 06:38 PM, Rob Herring wrote:
> On Mon, Oct 24, 2016 at 12:12:02PM -0700, Jonathan Richardson wrote:
>> From: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>
>> Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Tested-by: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Oza Pawandeep <oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/nvmem/brcm,ocotp.txt | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/nvmem/brcm,ocotp.txt
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/brcm,ocotp.txt b/Documentation/devicetree/bindings/nvmem/brcm,ocotp.txt
>> new file mode 100644
>> index 0000000..6462e12
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/nvmem/brcm,ocotp.txt
>> @@ -0,0 +1,17 @@
>> +Broadcom OTP memory controller
>> +
>> +Required Properties:
>> +- compatible: "brcm,ocotp" for the first generation Broadcom OTPC which is used
>> +  in Cygnus and supports 32 bit read/write. Use "brcm,ocotp-v2" for the second
>> +  generation Broadcom OTPC which is used in SoC's such as Stingray and supports
>> +  64-bit read/write.
> 
> These should be SoC specific. While I'd guess this block is simple 
> enough, having the SoC can define what all the bits are. Yes, there is a 
> binding to define those, but you may not use that.

Hi Rob. This block isn't SoC specific. It is used on multiple SoC's.
There are older SoC's using v1 that we may upstream drivers for in the
future. v1 isn't specific to cygnus/iproc and v2 isn't specific to stingray.

> 
> 
>> +- reg: Base address of the OTP controller.
>> +- brcm,ocotp-size: Amount of memory available, in 32 bit words
>> +
>> +Example:
>> +
>> +otp: otp@0301c800 {
>> +	compatible = "brcm,ocotp";
>> +	reg = <0x0301c800 0x2c>;
>> +	brcm,ocotp-size = <2048>;
>> +};
>> -- 
>> 1.9.1
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
