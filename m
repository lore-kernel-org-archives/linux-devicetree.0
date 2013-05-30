From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [U-Boot] [PATCH] fdt: Enhance dts/Makefile to be all things to
 all men
Date: Wed, 29 May 2013 23:11:24 -0600
Message-ID: <51A6DF7C.30903@wwwdotorg.org>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
 <51A51A50.4050308@wwwdotorg.org>
 <CAPnjgZ04BKhQtpJct9tvN8rW5Wae+6fxxOOQDnEkmgrr-mAfwg@mail.gmail.com>
 <51A62F8D.9010208@wwwdotorg.org> <20130529213145.698353831A5@gemini.denx.de>
 <51A67EC1.2000208@wwwdotorg.org> <20130529223621.8B147383069@gemini.denx.de>
 <51A68A4C.4060505@wwwdotorg.org>
 <CAPnjgZ2_dR90CDtihSun3Yu7_i8TVpxn85XMFQRmzNJeRzDSmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ2_dR90CDtihSun3Yu7_i8TVpxn85XMFQRmzNJeRzDSmQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>, u-boot-review <u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/29/2013 10:46 PM, Simon Glass wrote:
> Hi,
> 
> On Wed, May 29, 2013 at 4:07 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
> <mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>> wrote:
> 
>     On 05/29/2013 04:36 PM, Wolfgang Denk wrote:
>     > Dear Stephen Warren,
>     >
>     > In message <51A67EC1.2000208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
>     <mailto:51A67EC1.2000208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>> you wrote:
>     >>
>     >> To keep this process in check a bit, we could always pick a
>     specific git
>     >> commit or release version of dtc that each U-Boot version
>     (release) will
>     >> be allowed to assume. That will limit the number of times people
>     need to
>     >> update their locally-built dtc to at most once per U-Boot release.
>     >> Hopefully much less often.
>     >
>     > I think this is broken by design, in several aspects.  First, U-Boot
>     > is usually not the only user of DTC.  Second, assume you run a "git
>     > bisect" over a U-Boot tree - would you really want to switch DTC in-
>     > flight?
>     >
>     > Sorry, instead we should strive to be compatible to a reasonably old,
>     > stable version of DTC, like we do for all other tools as well.  As
>     > mentioned before - just because RHEL 5 ships an ancient version of -
>     > say - "make" we will NOT start building this from the sources ourself.
>     > This cannot be the way to go.
> 
>     So the result of that is that we can never ever use new features in any
>     tool, at least in any meaningful time-frame.
> 
>     I think we need to differentiate between tools that are already stable
>     and/or core to all aspects of the U-Boot build process (such as make),
>     and tools that enable new features that are under development.
> 
>     Clearly the U-Boot makefiles have to be fairly cautious in their use of
>     any new make features, so that everyone with any reasonable version of
>     make can build U-Boot.
> 
>     However, when enabling a new feature, such as using device trees to
>     configure U-Boot[1], for which tool support is new and evolving along
>     with the feature itself, and which is only used on a very very few
>     boards and even fewer SoCs right now within U-Boot, it seems entirely
>     reasonable to demand that the people working on/with that new feature
>     are aware that it's evolving, and that they may need to take a few extra
>     steps to go out and get tools that support that new feature. No doubt
>     once this feature has settled down a bit, and distros have pulled in
>     newer versions of dtc, everthing will "just work" just like any other
>     stable feature.
> 
>     If you don't accept this, then we simply have to ban any include use in
>     U-Boot; dtc -i isn't in distro-packaged versions of dtc, so we'd need to
>     stop using that. We'd need to move *.dts into a single directory within
>     U-Boot to work around that, or perhaps hard-coding relative include
>     paths in *.dts might work. Similarly for the patches to support dtc+cpp
>     usage, so we wouldn't be able to use named constants in DT files for
>     many years, which would prevent sharing DT files with the kernel and/or
>     any other standard repository of DT files, which are bound to use this
>     feature.
> 
>     [1] Which is very specifically a different feature than simply having
>     U-Boot pass a DT to the Linux kernel during boot, and perhaps modify it
>     a little, which clearly is not a new feature.
> 
> 
> My patch:
> 
> - doesn't require -i but uses it if available (ARCH_CPU_DTS works around
> this)

If we ever need to support a dtc that doesn't implement -i, then we
always need to support that. So, there's no point using -i when it's
available; we should simply have a single way of writing the *.dts files
that doesn't ever assume dtc -i is available. Otherwise, there will be
rampant inconsistency between different *.dts files; how they're
written, the flow by which they're compiled, etc.

In other words, we /always/ have to use "ARCH_CPU_DTS" in *.dts
throughout the entire U-Boot source tree if we're to support not using
dtc -i.

> - honours #define, #include, etc.
> - works with old and new versions of dtc

If we are forced to rely only upon features in old versions of dtc, we
specifically shouldn't allow use of features that will only work with
newer dtc. If we don't actively enforce this rule, we haven't achieved
the goal of not relying upon new versions of dtc.

...
> However, let's say Tegra needs a newer dtc than 1.3. I wonder whether we

This shouldn't be about whether a specific Soc's DT requires some
feature or not. All the U-Boot *.dts should work the same way.

> should just add a setting to tell U-Boot to not build the device tree at
> all? The same U-Boot binary can run on many different board times, just
> needing a different device tree.

Unfortunately, that's not remotely true yet for any Tegra system at
least; there's still a bunch of C code specific to each board. The
amount is reducing as things get migrated to DT, but we certainly aren't
there yet.

> Rather than pick one, we could just
> pick none. Then if you want to use new features in dtc, just define
> CONFIG_OF_NO_BUILD, or similar, and you can deal with the device tree
> details yourself. MAKEALL/buildman will be happy with this.

So you're saying: move the *.dts files out of U-Boot into some separate
project. It'd be nice to do that; hopefully that separate project could
be the one where the kernel's *.dts files move to. The big issue here is
that the DT bindings U-Boot uses are often different to the standard
bindings, so U-Boot currently contains U-Boot-specific *.dts so there
wouldn't be much point moving them out of U-Boot into some common DT
repository. Again, hopefully that's changing over time, but we're still
not there yet.

> Otherwise for now I think my patch is a reasonable compromise in terms
> of features.

It seems to be aimed specifically at enabling use of new dtc features
when present. That seems to be specifically against Wolfgang's goal of
not requiring new dtc features. There's no point allowing use of new dtc
features if we can't require them, since there's no fallback when they
aren't there to use.
