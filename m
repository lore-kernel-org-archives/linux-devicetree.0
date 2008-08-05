From: "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH add immr alias 1/4] powerpc: Teach get_immrbase to use
	immr alias if it exists.
Date: Tue, 5 Aug 2008 15:08:11 -0600
Message-ID: <fa686aa40808051408j34dedabg760c68480ead0f24@mail.gmail.com>
References: <1217967220-30557-1-git-send-email-jrigby@freescale.com>
	<200808052243.24001.arnd@arndb.de> <4898BCD3.5050703@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <4898BCD3.5050703-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, John Rigby <jrigby-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 5, 2008 at 2:49 PM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Arnd Bergmann wrote:
>>
>> On Tuesday 05 August 2008, John Rigby wrote:
>>>
>>> This will allow the eventual removal of device_type = "soc"
>>> properties in soc nodes.
>>
>> Stupid question, but why not remove immrbase instead?
>>
>> It seems that all users can be converted to use a reg
>> property of some actual device instead of making assumptions
>> about the register layout of the whole SOC.
>
> That wouldn't eliminate the need for the alias, though -- u-boot needs to
> find the node to fill in properties.

(already made this comment on one of the later patches, but it is more
relevant here...)

I don't think that using aliases is the best solution.  I'd rather see
U-Boot search for the appropriate compatible value for the IMMR node.

g.

>
> -Scott
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
> https://ozlabs.org/mailman/listinfo/linuxppc-dev
>



-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
