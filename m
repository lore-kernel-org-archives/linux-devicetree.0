From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH] dt: Add of_device_compatible_match()
Date: Thu, 7 Jul 2016 09:45:05 -0700
Message-ID: <577E8711.7040108@gmail.com>
References: <1466981246.20278.27.camel@kernel.crashing.org>
 <1467872962.20157.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467872962.20157.1.camel-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/06/16 23:29, Michael Ellerman wrote:
> On Mon, 2016-06-27 at 08:47 +1000, Benjamin Herrenschmidt wrote:
>> This provides an equivalent of of_fdt_match() for non-flat trees.
>>  
>> This is more practical than matching an array of of_device_id structs
>> when converting a bunch of existing users of of_fdt_match().
>>  
>> Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
>> ---
>>  
>> This is a pre-requisite for some work I'm doing to move the platform
>> identification in arch/powerpc until after we have unflattened the
>> device-tree. Rewriting all those lists as of_device_id's would be
>> significantly cumbersome.
>>  
>> Note: untested other than it compiles. I want an agreement on the
>> interface ASAP since the conversion of all the platforms is a burden
>> I'd like to avoid doing twice.
> 
> 
> Any comments on this?
> 
> We need it as a pre-req for a powerpc series, so unless anyone yells I'll merge
> it via there.


Just replied to Benjamin.  The logic is not quite right.

Rob has been handling the device tree merges, so I'll let him comment on
whether it is ok for you to merge, once it is correct.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
