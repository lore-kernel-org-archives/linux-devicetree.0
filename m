From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 8/9] ARM: dts: refresh dts file for arch mmp
Date: Wed, 6 Jun 2012 03:05:07 +0000
Message-ID: <201206060305.08019.arnd@arndb.de>
References: <1336134626-12262-1-git-send-email-haojian.zhuang@gmail.com>
 <201206060128.28167.arnd@arndb.de> <4FCEB694.8080904@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FCEB694.8080904-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 06 June 2012, Mitch Bradley wrote:
> On 6/5/2012 3:28 PM, Arnd Bergmann wrote:
> > On Tuesday 05 June 2012, Chris Ball wrote:
> >> Here's my proposal for what to do next:
> >>   * First, you choose one of the two forms that Mitch links to.
> >>     (Either "mmp2.dtsi" or "mmp2-flat.dtsi"; we have a weak preference
> >>     for mmp2-flat.dtsi.)
> >
> > My preference would be towards mmp2.dtsi. I've recommended doing it
> > that way to other people, too.
> 
> In most cases, I have found that exposing the full hierarchy is 
> preferable.  For this specific SoC, which I have been working with for 
> quite awhile now, I haven't found any instance where exposing the 
> AXI/APB levels buys you anything.  The hierarchy just adds clutter.
> 
> That said, I don't feel strongly about it.

Neither do I. Haojian might have a better idea of what the other
SoCs in this family are like, so I think it's best if he makes the
decision which one to use.

> >> d) Moved the "intcmux" nodes down a level so they are children of the
> >> top-level interrupt-controller node.  The problem with having them as
> >> peers of the top-level interrupt-controller is that their "reg"
> >> properties conflict.  For example:
> >> intcmux4@d4282150 { ... reg =<0x150 0x4>,<0x168 0x4>  ... }
> >>
> >> This is incorrect in several ways:
> >>
> >>     1) "@d4282150" is inconsistent with "reg =<0x150" .  The "unit
> >>        address" after @ is supposed to be the same as the first component
> >>        of the reg property.  d4282150 is not identical to 150.
> >
> > I thought the rule was that the @... part should be a translated address
> > in the presence of "ranges" translation so we get a unique value in case
> > we have multiple devices of the same name on the same address but on
> > different buses.
> >
> > If we change this here, I suppose it also needs to be changed in a number
> > of other places, and we have to rethink the method for unique device
> > names.
> 
> My thinking was that "ranges" is inappropriate in this case (within the 
> top-level interrupt controller node), and I got rid of it.  That being 
> the case, this is not "in the presence of ranges".

Ok, makes sense.

	Arnd
