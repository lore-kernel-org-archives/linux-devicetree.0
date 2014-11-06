From: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/3] powerpc/dts: Factorize the clock control node
Date: Thu, 6 Nov 2014 09:34:13 -0600
Message-ID: <545B94F5.6040308@Freescale.com>
References: <1413988937-27885-1-git-send-email-Emilian.Medve@Freescale.com>
	 <1414538500.23458.125.camel@snotra.buserror.net>
	 <54524405.5090509@Freescale.com>
 <1414711297.23458.173.camel@snotra.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414711297.23458.173.camel-88ow+0ZRuxG2UiBs7uKeOtHuzzzSOjJt@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: yuantian.tang-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Scott,


On 10/30/2014 06:21 PM, Scott Wood wrote:
>>> I don't think the mux stuff belongs here, given that clockgen2.dtsi
>>> doesn't have it, and I saw at least one clockgen1 user needing to
>>> supplement this with more muxes.
>>
>> The intent was to put here devices/nodes that are common per chassis
>> from the low to high end. Specific SoC would change/augment this as
>> appropriate. I could have put each node in its own file as we've done
>> elsewhere, but I thought it would be too much
>>
>> Yes, chassis v1 and v2 have differences, but that's not unexpected
> 
> It just strikes me as being an awkward split of where each mux node
> goes.  Is it guaranteed by the chassis that all v1 will have at least
> the first two muxes?

As far as I'm aware we're not building chassis v1 SoC(s) anymore


Cheers,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
