From: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 4/4] ARM: dts: Enable Broadcom iProc mailbox controller
Date: Wed, 25 Jan 2017 18:04:17 -0800
Message-ID: <7c607ba3-bda6-013f-a519-1c47eab778f0@broadcom.com>
References: <1485390422-3984-1-git-send-email-jonathan.richardson@broadcom.com>
 <1485390422-3984-5-git-send-email-jonathan.richardson@broadcom.com>
 <32cbeb0b-d27a-58ac-654d-4eadf0cceec7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <32cbeb0b-d27a-58ac-654d-4eadf0cceec7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Vikram Prakash <vikram.prakash-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 17-01-25 04:27 PM, Florian Fainelli wrote:
> On 01/25/2017 04:27 PM, Jonathan Richardson wrote:
>> Add node for iProc mailbox controller and enable.
>>
>> Reviewed-by: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Shreesha Rajashekar <shreesha.rajashekar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Tested-by: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Vikram Prakash <vikram.prakash-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/bcm-cygnus.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
>> index cf02271..606e11a 100644
>> --- a/arch/arm/boot/dts/bcm-cygnus.dtsi
>> +++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
>> @@ -121,6 +121,12 @@
>>  			      <0x0301d24c 0x2c>;
>>  		};
>>  
>> +		mailbox: mailbox@03024024 {
>> +			compatible = "brcm,iproc-mailbox";
>> +			reg = <0x03024024 0x8>;
>> +			#mbox-cells = <1>;
>> +		};
> Can you squash this change with the previous one? It seems to me like
> you are just removing the interrupt properties, and updating the reg
> property to be only 0x8 bytes.
>
> Thank you
And removing the interrupt controller properties from the mailbox controller. I don't mind squashing it if there are no objections.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
