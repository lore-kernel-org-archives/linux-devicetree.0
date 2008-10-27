From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: generating a phandle w/libfdt?
Date: Mon, 27 Oct 2008 09:16:16 -0500
Message-ID: <6D8EC3EA-A3E8-4D35-A43D-2C8DC7E3095D@kernel.crashing.org>
References: <4BE3ADDA-362B-43AE-8D05-11260B94CD13@kernel.crashing.org>
	<DEE70934-6A37-4439-B27E-FC3ABF75BF24@kernel.crashing.org>
	<2D630F2F-4AA2-4537-89FE-80B2DDFADDEE@watson.ibm.com>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <2D630F2F-4AA2-4537-89FE-80B2DDFADDEE-aZOuKsOsJu3MbYB6QlFGEg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jimi Xenidis <jimix-aZOuKsOsJu3MbYB6QlFGEg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Oct 24, 2008, at 10:15 AM, Jimi Xenidis wrote:

>
> On Oct 24, 2008, at 9:18 AM, Kumar Gala wrote:
>
>>
>> On Oct 24, 2008, at 8:11 AM, Kumar Gala wrote:
>>
>>> In some work I'm doing I noticed we don't have any APIs to  
>>> generate a phandle via libfdt.
>>>
>>> was wondering if anyone had ideas on this.
>>>
>>> In first thought it seems we have to scan through the whole blob  
>>> looking for the largest phandle id and than +1 it to generate the  
>>> next "valid" id.  Any other ideas on how to do this more  
>>> efficiently?
>>
>> The other question is there a way today to create a phandle even if  
>> there isn't a reference to it elsewhere in a .dts?
>>
>
> Well, then by definition, it is not a phandle, right?
> If nothing references it then I'm not sure how you can reconcile the  
> number when some SW layer builds the next version of it to pass on up.
>
> It sounds like you need a separate numerical space.
>
> Just a shot in that dark to see if your actual problem is similar...
>
> I'm expecting us to hit something like this _hard_ when we try to  
> fit runtime FW into ePAPR, like IBM's RTAS layer, where the devtree  
> can go through several generations but we need to hang on to the  
> _original_ phandle for a node from the time that the RTAS was  
> instantiated.  In server we use "ibm,phandle" for this.

Its more because I need firmware to do some fixups after the fact that  
need phandles.  Its a bit of a pain to "generate" phandles on the fly.

- k
