From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drivers/amba: probe via device tree
Date: Tue, 24 May 2011 10:03:35 -0500
Message-ID: <4DDBC8C7.4000001@gmail.com>
References: <1305829704-11774-1-git-send-email-robherring2@gmail.com>	<20110519233958.GB18181@ponder.secretlab.ca>	<4DD66B8A.5040404@gmail.com>	<201105201621.03801.arnd@arndb.de>
	<4DD68614.6090209@gmail.com>	<a42f0c27-2811-4b68-bedf-7dfaa7bff6ff@VA3EHSMHS025.ehs.local>	<BANLkTi=8vX1Cs_fzpQXZBuuDuLYLu1FGmg@mail.gmail.com>	<4DDA2AC0.1060406@gaisler.com>	<20110523095829.GG17672@n2100.arm.linux.org.uk>
	<BANLkTink1rrC8F3Gjhqt84gYzOibX+AgDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTink1rrC8F3Gjhqt84gYzOibX+AgDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant,

On 05/23/2011 10:09 AM, Grant Likely wrote:
> On Mon, May 23, 2011 at 3:58 AM, Russell King - ARM Linux
> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>  wrote:
>> On Mon, May 23, 2011 at 11:37:04AM +0200, Kristoffer Glembo wrote:
>>> Grant Likely wrote:
>>>> In the case we're talking about the bus really is an AMBA bus, and all
>>>> the devices on it are in some sense real amba devices.  The problem is
>>>> that not all of the devices on the bus implement peripheral ID
>>>> registers or other mechanisms that good upstanding AMBA devices are
>>>> expected to have.
>>>
>>> Before we go hardware bashing of non primecell AMBA devices I would just
>>> want to point out that the primecell stuff is not part of the AMBA
>>> specification.
>>
>> And before we go down that route, let me point out that the 'amba bus'
>> stuff in the kernel is there to support primecells, rather than all
>> devices which the AMBA specification covers.
>>
>> The reason it's called 'amba' is because back in 2001 or so when the
>> first primecell drivers were created, there was little information
>> available as to what AMBA, AHB, or APB even covered.  All I had to go
>> on were the primecell documents themselves.  The higher level documents
>> were not available to me.
>>
>> So, despite it being called 'amba', it really is just for primecells
>> and if we didn't have the exposure to userspace, I'd have renamed it to
>> 'apb' or similar instead.
>
> Okay, that clarifies things a lot, and lends weight to the arguement
> that it is perfectly normal and acceptable to have both amba_devices
> and platform_devices on the same bus segment.  Are there any cases
> where amba primecells are being driven by platform_drivers?  If so,
> should those drivers have an amba_driver registration added?

I would be surprised if there are any implemented as platform_drivers 
that are not duplicates of an amba driver. The STMP uart is actually a 
pl011 and it's platform driver was recently removed IIRC. So I think we 
can consider platform drivers something that should be fixed in this case.

Do you still think we should have a global match table of all devices or 
a generic "arm,primecell" compatible property would work. Several 
drivers like the pl022 have several h/w variations they support, so we 
would either need to list all those variations or have a generic name 
per device.

I think having "arm,amba-deviceid" is not needed. The current code does 
nothing but warn if it doesn't match the h/w value. The drivers already 
have a list of id's that they support and the amba bus only matches 
against the h/w id value. The only use I can see is overriding a broken 
h/w value. Certainly seems like it should be optional at least.

Rob
