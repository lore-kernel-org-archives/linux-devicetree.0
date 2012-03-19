From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] Device Tree Bindings for Freescale TDM controller
Date: Mon, 19 Mar 2012 12:32:36 -0500
Message-ID: <4F676DB4.1080705@freescale.com>
References: <1331861451-15427-1-git-send-email-poonam.aggrwal@freescale.com>
 <4F63868D.1030507@freescale.com>
 <ACB6D0C0104CFF42A45A5D82A0DD4F3D09D518@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <ACB6D0C0104CFF42A45A5D82A0DD4F3D09D518-RL0Hj/+nBVDYdknt8GnhQq4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Aggrwal Poonam-B10812 <B10812-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Singh Sandeep-B37400 <B37400-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/17/2012 02:33 AM, Aggrwal Poonam-B10812 wrote:
>>> +  - compatible
>>> +      Usage: required
>>> +      Value type: <string>
>>> +      Definition: Should contain "fsl,mpc8315-tdm".
>>> +	  So mpc8313 will have compatible = "fsl,mpc8315-tdm";
>>> +	  p1010 will have compatible "fsl,p1010-tdm", "fsl,mpc8315-tdm";
>>
>> Shouldn't mpc8313 have:
>> compatible = "fsl,mpc8313-tdm", "fsl,mpc8315-tdm"?
>>
>> I thought we were going to use 8313 as the canonical implementation, not
>> 8315.
> MPC8315 was the first FSL platform to have this controller.
> MPC8313 does not have TDM.

OK, so no example for mpc8313 then. :-)

>> Will this frequency ever need to be > 4GHz?
> Don't think so, at max this will be CCB, not sure if CCB on our platforms may get bigger than 4G ever.

Still, I think we should always make clock-frequency properties be 32/64
as the ePAPR describes, just in case.

>> Might want to specify as u32 or u64, as ePAPR suggests.
> Means Value type: <u32 or u64>?

Yes.

> In this case the driver must always use 64bit data structure to read this. Is this correct?

No, you'd use of_read_number().  Maybe factor out an of_get_frequency().

-Scott
