From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [sodaville] [PATCH 04/11] x86/dtb: add irq host abstraction
Date: Wed, 01 Dec 2010 11:31:33 +0100
Message-ID: <4CF62405.3070205@linutronix.de>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>	<1290706801-7323-5-git-send-email-bigeasy@linutronix.de>	<E1PLhWV-0004y7-44@jdl.com>
	<4CEFC1EC.7030507@linutronix.de>
	<1290807372.32570.137.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1290807372.32570.137.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Benjamin Herrenschmidt wrote:
> On Fri, 2010-11-26 at 15:19 +0100, Sebastian Andrzej Siewior wrote:
>> AFAIK Benh was thinking about renaming it. I don't know if this is
>> still
>> the case or when he intends to do so. Once he does so, this can be
>> renamed
>> as well. 
> 
> That and moving the powerpc code to a generic place so you don't have to
> re-invent your own :-)
> 
> I think Grant has patches for that.

I've found only patches which rename the struct, none that move it into
generic code. Should I rename mine and wait until it appears in generic
code?

> 
> Cheers,
> Ben.

Sebastian
