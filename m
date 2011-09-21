From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] ARM: vexpress: initial device tree support
Date: Wed, 21 Sep 2011 07:47:32 -1000
Message-ID: <4E7A2334.7020904@firmworks.com>
References: <1316596786-2539-1-git-send-email-dave.martin@linaro.org>
	<4E79E588.6010703@gmail.com>
	<CACxGe6sTYYXbpXvPb4C+y4JX0eRxLvwjbFycXA8Mjc-XWS1QUA@mail.gmail.com>
	<4E7A12E2.9040107@gmail.com> <20110921171545.GG2872@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110921171545.GG2872-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?B?UGF3ZcWCIE1vbGw=?= <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-CfjtxxwdHycX+EX/Zwu52A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 9/21/2011 7:15 AM, Dave Martin wrote:
> On Wed, Sep 21, 2011 at 11:37:54AM -0500, Rob Herring wrote:
>> On 09/21/2011 09:57 AM, Grant Likely wrote:
>>> On Wed, Sep 21, 2011 at 7:24 AM, Rob Herring<robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  wrote:
>>>> On 09/21/2011 04:19 AM, Dave Martin wrote:
>>>>>        * arm,amba-bus -- widely used by other boards and patchsets, but
>>>>>          seems not to be documented.
>>>>>
>>>>
>>>> This should be dropped. There's not really any bus component to an amba
>>>> bus. All the probing info is within the primecell peripherals.
>>>
>>> No, if it is an AMBA bus, then it is entirely appropriate to declare
>>> it as an amba bus, but to also be compatible with "simple-bus".  In
>>> fact, it would be better to use a compatible string that specifies the
>>> specific implementation of AMBA bus since there are several versions
>>> of the spec.
>>
>> And type of AMBA bus as the spec includes AXI, AHB, and APB. None of
>> which have any sort of programmability or software view.
>>
>> If this is required, then the policy should be simple-bus should never
>> be allowed alone as every bus has some underlying type. Seems like
>> overkill for buses like this.
>
> The key question is _where_ to draw the line between generic and specific.
> By definition, the DT can never be a comprehensive description of the
> hardware -- rather a good DT is a description of those details of the hardware
> which could relevant to any hypothetical OS.
>
> The flipside is that details which were thought to be irrelevant at
> design/implementation time can turn out to be relevant in practice, due
> to errata and implementation issues etc.  So taking the description slightly
> beyond what the OS needs to know can still have some merit.
>
>
> I still don't know how to say where the line should be drawn in this particular
> case though.

Here are some criteria:

If the controller for the bus itself has registers, include the bus node

If it is possible to plug new stuff into the bus, include the bus node

If the base address for the bus can be changed, thereby changing all the 
addresses of its subordinates by the same offset, include the bus node 
(this usually goes along with "has registers".)

ARM buses typically don't have any of those attributes, but there are 
some weaker criteria that can be used to justify including a bus node. 
The SoC on which I'm currently working has some peripherals on AXI and 
others on APB.  That doesn't matter from that addressing standpoint - 
the individual peripherals can each be viewed as having an address, end 
of story - but it does matter from a power management standpoint.  The 
clock tree is quite related to the bus layout.  Including bus nodes in 
the device tree might provide useful place-holders for properties 
describing power or clock domains.

So, on the whole, I'm in favor of including bus nodes for ARM standard 
buses.  There is little down side to doing so, and a fair chance that it 
might come in handy in the future.

>
> Cheers
> ---Dave
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
