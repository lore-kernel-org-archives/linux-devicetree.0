From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc: make the padding for the device tree
	a	configurable option
Date: Thu, 20 May 2010 11:04:29 -0500
Message-ID: <4BF55D8D.5070801@freescale.com>
References: <1274298809-12772-1-git-send-email-timur@freescale.com>	<1274304013.1931.6.camel@pasglop>
	<4BF4593E.8030101@freescale.com>	<1274309050.1931.21.camel@pasglop>	<AANLkTilefxXcMnWqKSultu88r4D9W98adHLHxvUwi113@mail.gmail.com>
	<20100520011820.GT25892@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100520011820.GT25892@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/19/2010 08:18 PM, David Gibson wrote:
> On Wed, May 19, 2010 at 07:03:17PM -0500, Timur Tabi wrote:
>> On Wed, May 19, 2010 at 5:44 PM, Benjamin Herrenschmidt
>>> The padding in the kernel built is intended to
>>> make space for DT changes done by the zImage wrapper.
>>
>> Well, okay.  I think it would be nice if we expanded that to handle
>> general usage.

Don't we have dynamic expansion in the zImage wrapper?

>>> Maybe we could add to libfdt a way to provide a realloc() callback to it
>>> when it hits the max size, and uboot can then move things around (or
>>> fail).
>>
>> The problem is that the code which allocates a block for the fdt is
>> completely distinct from the code that manipulates the fdt.  We'd need
>> to put in either some kind of funky callback mechanism, or insist that
>> every fdt exist in a block of memory allocated by some specific method
>> (e.g. lmb).
>>
>> I'm stuck between a rock and a hard place, it seems.  No one is
>> willing to compromise on any of my ideas.  It's hard to convince our
>> BSP developers that they should be pushing more code upstream when I
>> get so much resistance for a such a mundane change.
>
> Couldn't you use the configurable padding, but put the stuff to do it
> into u-boot.  i.e. repad the dtb at u-boot build time, rather than
> u-boot runtime.

Currently generating a dtb is not done as part of the u-boot build 
process -- and apparently some people are using the Linux makefile 
target to do it.

I think the right thing is to do whatever we need to do in u-boot to get 
dynamic expansion fully working (it already does it in some 
circumstances, just not always, or necessarily safely).  Static padding 
is too fragile.

-Scott
