From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 2/2] powerpc/mpic: add global timer support
Date: Mon, 13 Aug 2012 11:50:42 -0500
Message-ID: <50293062.7060809@freescale.com>
References: <1344578081-8095-1-git-send-email-Dongsheng.wang@freescale.com>
 <5025639F.4070203@freescale.com>
 <ABB05CD9C9F68C46A5CEDC7F15439259DB147E@039-SN2MPN1-022.039d.mgd.msft.net>
 <94F013E7935FF44C83EBE7784D62AD3F093AEC18@039-SN2MPN1-023.039d.mgd.msft
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <94F013E7935FF44C83EBE7784D62AD3F093AEC18-RL0Hj/+nBVDtkydW1Tv2Dq4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
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
To: Li Yang-R58472 <r58472-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Wang Dongsheng-B40534 <B40534-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org" <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Gala Kumar-B11780 <B11780-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/13/2012 01:17 AM, Li Yang-R58472 wrote:
> 
> 
>> -----Original Message-----
>> From: Wang Dongsheng-B40534
>> Sent: Monday, August 13, 2012 1:54 PM
>> To: Wood Scott-B07421
>> Cc: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org; paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org; linuxppc-
>> dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Gala Kumar-B11780; Li Yang-R58472
>> Subject: RE: [PATCH v2 2/2] powerpc/mpic: add global timer support
>>
>>
>>
>>> -----Original Message-----
>>> From: Wood Scott-B07421
>>> Sent: Saturday, August 11, 2012 3:40 AM
>>> To: Wang Dongsheng-B40534
>>> Cc: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org; paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org; linuxppc-
>>> dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Gala Kumar-B11780; Li Yang-R58472
>>> Subject: Re: [PATCH v2 2/2] powerpc/mpic: add global timer support
>>>
>>> On 08/10/2012 12:54 AM, Dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
>>>> +static const struct of_device_id mpic_timer_ids[] = {
>>>> +	{ .compatible = "open-pic,global-timer", },
>>>> +	{ .compatible = "fsl,global-timer", },
>>>> +	{},
>>>> +};
>>>> +
>>>> +static int __init mpic_timer_init(void) {
>>>> +	struct device_node *np = NULL;
>>>> +
>>>> +	for_each_node_by_type(np, "open-pic")
>>>> +		if (of_match_node(mpic_timer_ids, np))
>>>> +			group_init(np);
>>>> +
>>>> +	if (list_empty(&group_list))
>>>> +		return -ENODEV;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +arch_initcall(mpic_timer_init);
>>>
>>> Oh, and don't probe by device_type.
> 
> Actually it does match the compatible.  The device_type is just to
> speed up the search.  I don't think it's a problem unless the device
> type is not mandatory any more for defined types.

Doesn't matter (and I doubt it provides any significant speed up
compared to a search by compatible, and in any case this is not
performance critical).  device_type is deprecated outside certain
specific legacy uses.  Get rid of it.

-Scott
