From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] Clock binding
Date: Fri, 28 Aug 2009 10:51:26 +1000
Message-ID: <1251420686.20467.96.camel@pasglop>
References: <1250569288.19007.15.camel@pasglop>
	<1251346157.20467.22.camel@pasglop> <4A96F69A.5050003@firmworks.com>
	<1251411532.20467.74.camel@pasglop>  <4A970C85.8090703@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4A970C85.8090703-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


> I agree in general.  It has long been a convention of mine to follow the 
> vendor's names as exactly as possible.  But that often presents 
> difficulties. Many of them have been touched on in our previous 
> discussion but I'll list some here just to emphasize the problem we face:
> 
> a) Inconsistent naming within a vendor's documentation set - datasheet 
> spells it one way, programmer's manual another, appnotes/porting guide 
> still another, reference schematic spells it two different ways (pin 
> name on part versus net name of signal wire).

Right. I should emphasis that what the device-tree should contain is the
pin name on part and -not- the net name of the wire. Of course, bogus
datasheet and inconsistent spelling will still hurt, nothing much we can
do about it, other than having the first to write a driver become a
de-facto "guide" to other implementors :-)

Maybe we could have a Wiki where the first time a given chip is used for
a binding, we put down the names used to encourage people to use the
same. To some extent it's going to be the responsibility of the person
writing the .dts to pick up names that will work with existing drivers. 

In fact that problem is no different than picking up "compatible" names,
and that Wiki thing might help in both cases.

> b) Sometimes the name is abbreviated and sometimes spelled out.  SMBALRT 
> vs. SMbus Alert.

Right. Still better than a magic number where you simply have no
reference whatsoever to what it is.

> c) Different tools (CAD programs, word processors) have different 
> conventions leading to existence of ambiguously-representable name 
> components - particular cases in point are overbars for active low 
> signals and embedded spaces/underscores/hyphens in names.

Yes, that can be an issue, though overbar is less common for clocks.

> d) Compatible part from different vendors leads to confusion about which 
> vendor's names are canonical.  Or leading vendor goes out of business or 
> gets bought.

Sure, same problem with "compatible" properties. There's no silver
bullet here. But we could try the Wiki approach to provide an unofficial
"reference" of canonical names for common devices. For -very- common
ones such as 8250-compatible UARTs, a full blown binding is probably the
way to go.

> These problems are getting worse rapidly as more devices are being 
> sourced from Asia, where the linguistic connection to the Roman alphabet 
> is tenuous.

True.

> You need a Pope to decide what is canonical.

Perhaps. But we can try our best with something like a wiki in the
meantime and see how it works out.

Cheers,
Ben.

> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev
