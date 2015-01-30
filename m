From: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Subject: Re: [v5, 5/6] powerpc/mpc85xx: Add FSL QorIQ DPAA BMan support to
 device tree(s)
Date: Fri, 30 Jan 2015 08:13:18 -0600
Message-ID: <54CB917E.7080101@Freescale.com>
References: <1418034561-12034-6-git-send-email-Emilian.Medve@Freescale.com>
 <20150130050318.GA12890@home.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150130050318.GA12890-vONcSABrMOVpTrP2zolEsF6hYfS7NtTn@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Poonam Aggrwal <poonam.aggrwal-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, Geoff Thorpe <Geoff.Thorpe-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, Chunhe Lan <Chunhe.Lan-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Scott,


On 01/29/2015 11:03 PM, Scott Wood wrote:
> On Mon, Dec 08, 2014 at 04:29:20AM -0600, Emil Medve wrote:
>> From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
>>
>> Change-Id: If643fa5ba0a903aef8f5056a2c90ebecc995b760
>> Signed-off-by: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
>> Signed-off-by: Geoff Thorpe <Geoff.Thorpe-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Signed-off-by: Hai-Ying Wang <Haiying.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Signed-off-by: Chunhe Lan <Chunhe.Lan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Signed-off-by: Poonam Aggrwal <poonam.aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> [Emil Medve: Sync with the upstream binding]
>> Signed-off-by: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
> 
> Doesn't apply cleanly
> 
>> @@ -408,6 +415,8 @@ crypto: crypto@300000 {
>>  		fsl,iommu-parent = <&pamu1>;
>>  	};
>>  
>> +/include/ "qoriq-bman1.dtsi"
>> +
>>  /include/ "qoriq-fman-0.dtsi"
>>  /include/ "qoriq-fman-0-1g-0.dtsi"
>>  /include/ "qoriq-fman-0-1g-1.dtsi"
> 
> What tree did you base these patches on?  There's no fman in the upstream
> device trees yet (just a binding).

They were based on this patch series:
http://patchwork.ozlabs.org/patch/370866. Will re-send


Cheers,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
