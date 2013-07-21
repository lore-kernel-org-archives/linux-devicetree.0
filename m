From: "Chaiken, Alison" <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [ATTEND] Handling of devicetree bindings
Date: Sun, 21 Jul 2013 08:05:41 +0000
Message-ID: <60BA5429A0E1584BA3633194F6F993B502AF6D65@NA-MBX-03.mgc.mentorg.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Language: en-US
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
To: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
>> I've heard tales of people having to keep device-tree files for their
>> board tightly in sync with the specific *version* of the Linux kernel
>> that they were shipped with.

Assuredly if in a kernel update a driver adds new features which are enabled by new properties described in the device-tree, updating both the kernel and the device-tree at the same time makes sense?   Or when you're taking about keeping files in sync, are you referring to a different practice?    Companies may jump several kernel versions in an update.    No one disagrees that a 3.2 kernel and a 3.7 kernel are going to benefit from different DTs, if not require them.

Linus Walleij (linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org) responds:
>multiple things are compiled together and stuffed into
>an image, the device tree and kernel is always recompiled at every
>image composition. Everything is versioned in sync.

Are you objecting to the concept of a multicomponent image?   Or the idea that the kernel and device-tree are always updated together?    Assuredly the problem of performing over-the-air updates for an expensive device that has safety-critical components in a failsafe way is complex, and a requirement to separately update device-tree blobs and kernel (and potentially firmware) would create a big headache.   I've heard from a member of the ChromeOS team that they package the DTB with the kernel so that the resulting archive can be cryptographically signed.    Providing a signing mechanism for DTBs might reduce manufacturer interest in composite images.

> I think their mental model is that of assembling a fridge or a car or
> something - you take this bolt and it fits with that nut, and it's OK if
> it only fits on just this one model of the end product.

If a company sells products with dozens of board variants, then assuredly each variant will need its own top-level DTS.  If the lifecycle of the product is many years, but future customers may want to add or subtract features from the hardware, then long-term maintenance of multiple compatible DTS with kernels will be necessary.    If one board has a large amount of flash storage and another has a smaller amount, assuredly they will need different device-tree blobs?

I'm quite interested in the questions discussed here, and have submitted at ELCE abstract to discuss them:

https://events.linuxfoundation.org/cfp/proposals/478/657

Whether or not my abstract is accepted, the topics are timely ss device-tree moves to its own repo and add new features like macro preprocessing, and potentially the include directories are refactored.

> Changing that way of thinking goes well outside the kernel community
> I'm afraid, one way would be if device trees had conformance tests

I was thinking about a test tool in reaction to the recent discussion about moving DTSI files to a new home.   Suppose ARM or PPC had a top-level set of include files to replace skeleton.dtsi.     Conforming DTSI for (for example) OMAP or i.MX processors would be required to include these.   Then conforming OMAP4's and i.MX6's DTSI would be required to include the OMAP and i.MX ones.    OMAP4430's DTSI would include OMAP4's, and i.MX6Q would include i.MX6's.   No conforming DTSI would modify these include/arch/{omap,imx}/common files and users who wanted changes should submit patches or accept non-conformance.   No binding defined in these basic files could be renamed without good reasons.    Conformance would mean that some commonality in naming between the OMAP and i.MX (and ARM and PPC)
  binding names could be enforced when they are designed.

Having a conformance tool would reduce Maintainer workload -- wouldn't it?   From the end user point of view, I'd like to be able to make sure that the kernel config and DTS are compatible.   In other words, a script to check that all features with "status=okay" also have CONFIG_BLAHBLAHBLAH={Y,M}.

This idea about minimally modifiable layered include files is what I mean by "inheritance" in my abstract.    i.MX6Q subclasses i.MX6 which subclasses i.MX.    Thinking about device-tree from this point of view may help to apply best practices from other areas.

> Or to put it another way: I think this is caused by embedded
> companies constantly having one finger pressing the fast-forward
> button.

Because companies have their fingers on the fast-forward button, I suspect that many simply have not thought the issues through.   

Sorry for long message,
Alison Chaiken
Mentor Embedded Software
