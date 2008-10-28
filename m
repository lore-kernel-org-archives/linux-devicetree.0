From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: GPIO - marking individual pins (not) available in device tree
Date: Tue, 28 Oct 2008 11:38:47 +1100
Message-ID: <20081028003847.GF26424@yookeroo.seuss>
References: <49024646.3050300@genesi-usa.com> <49025DE0.6070403@firmworks.com>
	<4904DD76.7070706@genesi-usa.com>
	<20081026235303.GE22339@yookeroo.seuss>
	<4905E857.6040206@genesi-usa.com> <4905EDBE.8020105@freescale.com>
	<4905F4C4.4000309@genesi-usa.com>
	<4905F97B.60705@freescale.com> <4905FF2B.10007@genesi-usa.com>
	<49060047.2010809@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <49060047.2010809-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
Cc: devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 27, 2008 at 12:54:15PM -0500, Scott Wood wrote:
> Matt Sealey wrote:
>> Scott Wood wrote:
>>> It's deprecated *in the context of flat device trees*.  Anything not  
>>> using flat device trees is out-of-scope with respect to ePAPR.
>>
>> Isn't the beauty of a device tree that every firmware no matter what
>> type can present it in whatever form it chooses, but still be describing
>> the same hardware in the same way?
>
> When run-time services are not involved, yes.  device_type was used by  
> 1275 in the context of run-time services, which we don't have, so we  
> didn't copy that property over (except for memory and cpu, to avoid  
> gratuitous divergence).
>
>> I'm curious, is it the remit of the ePAPR TSC to publish and act as
>> a registration authority for device tree bindings for specific SoCs
>> or is that devolved to the SoC maker itself (be they a member of
>> Power.org or not) and, more prudent, two other questions; where are
>> Freescale and IBM publishing these if it is their responsibility,
>> are things like the mysterious i2c binding going to be published
>> under this TSC?
>
> There has been talk about setting up such a repository, but I'm not sure  
> what the status of it is.

Progressing intermittently when people get small packets of time to
actually do something about it.  We do really want this, it's just
no-one's yet had the spare cycles to make it happen.

At the moment things are published in the kernel documentation
(booting-without-of.txt, although I think it's now been split up into
multiple files), which is far from ideal, but better than nothing.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
