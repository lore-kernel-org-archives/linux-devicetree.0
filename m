From: Suraj Jitindar Singh <sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] powerpc: Update of_remove_property() call sites to
 remove null checking
Date: Fri, 6 May 2016 13:00:43 +1000
Message-ID: <572C08DB.9000109@gmail.com>
References: <1461821695-19204-1-git-send-email-sjitindarsingh@gmail.com>
 <1461821695-19204-2-git-send-email-sjitindarsingh@gmail.com>
 <57292702.5070507@linux.vnet.ibm.com>
 <1462431031.12473.3.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462431031.12473.3.camel-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 05/05/16 16:50, Michael Ellerman wrote:
> On Tue, 2016-05-03 at 15:32 -0700, Tyrel Datwyler wrote:
>> On 04/27/2016 10:34 PM, Suraj Jitindar Singh wrote:
>>> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
>>> index ceb18d3..a560a98 100644
>>> --- a/arch/powerpc/platforms/pseries/mobility.c
>>> +++ b/arch/powerpc/platforms/pseries/mobility.c
>>> @@ -191,8 +191,8 @@ static int update_dt_node(__be32 phandle, s32 scope)
>>>  				break;
>>>  
>>>  			case 0x80000000:
>>> -				prop = of_find_property(dn, prop_name, NULL);
>>> -				of_remove_property(dn, prop);
>>> +				of_remove_property(dn, of_find_property(dn,
>>> +							prop_name, NULL));
>>>  				prop = NULL;
>>>  				break;
>>>
>> You haven't removed a NULL check here, as suggested by the changelog,
>> but instead made a cosmetic change to the code that still leaves behind
>> a now unnecessary "prop = NULL;" to bit rot.
> Yeah I think you're right. Though it's not very clear how prop is used in that
> function.
>
> Please one of you send me an incremental to remove the prop = NULL;
>
> cheers
>

Resend of previous message due to formatting issues:

I didn't delete the prop = NULL; initially as I didn't fully understand
how it was used in the rest of the function and the effect of deleting
it.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
