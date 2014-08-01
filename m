From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: DTS: da850: Add node for edma0
Date: Fri, 1 Aug 2014 11:48:55 +0530
Message-ID: <53DB314F.6060706@ti.com>
References: <1406801934-23334-1-git-send-email-peter.ujfalusi@ti.com>
	<1406801934-23334-3-git-send-email-peter.ujfalusi@ti.com>
	<53DA5230.1050200@cogentembedded.com> <53DB210B.5010204@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <53DB210B.5010204-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, khilman-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 01 August 2014 10:39 AM, Peter Ujfalusi wrote:
> On 07/31/2014 05:26 PM, Sergei Shtylyov wrote:
>> On 07/31/2014 02:18 PM, Peter Ujfalusi wrote:
>>
>>> Add DT node for edma0.
>>
>>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
>>> ---
>>>   arch/arm/boot/dts/da850.dtsi | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>
>>> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
>>> index b695548dbb4e..41ce4e8bf227 100644
>>> --- a/arch/arm/boot/dts/da850.dtsi
>>> +++ b/arch/arm/boot/dts/da850.dtsi
>>> @@ -150,6 +150,12 @@
>>>               };
>>>
>>>           };
>>> +        edma0: edma@01c00000 {
>>> +            compatible = "ti,edma3";
>>> +            reg =    <0x0 0x10000>;
>>
>>    Why the mismatch between the unit-address part of the node name and the
>> "reg" property?
> 
> For some reason the whole da850 uses offset from 0x01c00000 for the SoC IPs.
> The nodes are under 'soc' and that has the ranges attribute.
> I do not really like this either.

There is no reason I can remember for why we chose to go the offset +
ranges way. Probably based it on an early OMAP example. Right now lets
keep it that way unless there is a big disadvantage.

Thanks,
Sekhar
