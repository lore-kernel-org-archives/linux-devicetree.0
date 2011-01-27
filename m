From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] ARM: map ATAGs when not in first 1MB of RAM
Date: Thu, 27 Jan 2011 17:46:03 +0000
Message-ID: <20110127174603.GB605@n2100.arm.linux.org.uk>
References: <1296143443-9442-1-git-send-email-robherring2@gmail.com>
	<20110127163149.GF25968@n2100.arm.linux.org.uk>
	<4D41AE4A.1000105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4D41AE4A.1000105-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 27, 2011 at 11:41:30AM -0600, Rob Herring wrote:
> Russell,
>
> On 01/27/2011 10:31 AM, Russell King - ARM Linux wrote:
>> On Thu, Jan 27, 2011 at 09:50:43AM -0600, Rob Herring wrote:
>>> +	/*
>>> +	 * Otherwise map the 1MB region r2 points to (atags or dtb)
>>> +	 */
>>> +1:	mov	r0, r2, lsr #20
>>> +	mov	r0, r0, lsl #20
>>> +	sub	r3, r0, #(PHYS_OFFSET&  0xff000000)
>>> +	.if	(PHYS_OFFSET&  0x00f00000)
>>> +	sub	r3, r3, #(PHYS_OFFSET&  0x00f00000)
>>
>> This introduces new PHYS_OFFSET uses which we're trying hard to get
>> rid of.  This will need to be reworked.
>
> Yeah, I didn't really like that either. How about this? It's untested.  
> It replaces the whole section mapping the 1st 1MB and should make  
> replacing this instance of PHYS_OFFSET with a variable easier.

With the p2v patches, queued for the next merge window, PHYS_OFFSET
becomes:

extern unsigned long __pv_phys_offset;
#define PHYS_OFFSET __pv_phys_offset

so using PHYS_OFFSET in any way in assembly isn't going to work too
well.  Luckily, the p2v patches supply __create_page_tables with a
value of PHYS_OFFSET in r8.

What this means is that there's an fundamental interdependence between
your patches and mine.  Your patches can work without the p2v patches.
Or they can be made to work with the p2v patches applied.

So I think this needs to wait until after the next merge window, or it
needs to be prepared against the p2v patches (see my p2v branch) and
applied there once everyone's happy with it.
