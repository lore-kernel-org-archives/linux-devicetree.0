From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] powerpc/85xx: clean up FPGA device tree nodes for
	Freecsale QorIQ boards
Date: Tue, 30 Aug 2011 22:05:43 -0500
Message-ID: <54E184ED-3934-4872-B821-ED394C351788@kernel.crashing.org>
References: <1314644999-16955-1-git-send-email-timur@freescale.com>
	<3F34FBCD-3F0B-4D59-A947-C16CC812B42E@freescale.com>
	<4E5DA1CC.1020808@freescale.com>
	<DBF3606B-8F59-4E5F-9B47-C3E0235665C4@freescale.com>
	<4E5DA412.5020300@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4E5DA412.5020300-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Gala Kumar-B11780 <B11780-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Aug 30, 2011, at 10:01 PM, Tabi Timur-B04825 wrote:

> Kumar Gala wrote:
>> 
>> On Aug 30, 2011, at 9:51 PM, Tabi Timur-B04825 wrote:
>> 
>>> Kumar Gala wrote:
>>>> Do we really want the generic "fsl,fpga-cpld"&   "fsl,fpga-pixis"?  This seems to vague.
>>> 
>>> Yes, the PIXIS is generally register compatible across all boards.  There
>>> may be some minor differences, but the OCM driver can work with all PIXIS
>>> boards that have an PIXIS.
>> 
>> Is this true?  Don't we have pixis and ngpixis in u-boot?
> 
> I forgot about that.  Well, everything I said is true about the ngpixis, 
> so I guess I should use "ngpixis" instead of just "pixis" here.  I'll have 
> to check if the old pixis can be used this way.
> 
>> 
>>>> Also you need "pixis" on MPC8544DS, MPC8572DS, MPC8536DS.
>>> 
>>> Ok.
>>> 
>>>> Also fpga-cpld makes no sense if we keep this.  You are either a CPLD or FPGA not both.
>>> 
>>> Then I don't understand what the CPLD is.
>> 
>> http://en.wikipedia.org/wiki/Complex_programmable_logic_device
> 
> Ok, I get it now.  Is there a name for the CPLD we use on these chips? 
> I'm having a hard time getting proper documentation on the CPLD.  York 
> expressed similar frustration.
> 
> Perhaps these should be called board-control devices.  How about
> 
> 	fsl,boardcontrol-cpld
> 	fsl,boardcontrol-ngpixis
> 	fsl,boardcontrol-qixis

For the CPLD based boards I think:

<BOARDNAME>-cpld is best as there isn't really much consistent right now.

- k
