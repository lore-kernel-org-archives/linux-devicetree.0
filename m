From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [U-Boot] [PATCH] fdt: Enhance dts/Makefile to be all things to
 all men
Date: Wed, 29 May 2013 17:07:56 -0600
Message-ID: <51A68A4C.4060505@wwwdotorg.org>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
 <51A51A50.4050308@wwwdotorg.org>
 <CAPnjgZ04BKhQtpJct9tvN8rW5Wae+6fxxOOQDnEkmgrr-mAfwg@mail.gmail.com>
 <51A62F8D.9010208@wwwdotorg.org> <20130529213145.698353831A5@gemini.denx.de>
 <51A67EC1.2000208@wwwdotorg.org> <20130529223621.8B147383069@gemini.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130529223621.8B147383069-C2Gvrrd9BC/j/ljBK/0BTg@public.gmane.org>
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
To: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Cc: u-boot-review <u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/29/2013 04:36 PM, Wolfgang Denk wrote:
> Dear Stephen Warren,
> 
> In message <51A67EC1.2000208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> you wrote:
>>
>> To keep this process in check a bit, we could always pick a specific git
>> commit or release version of dtc that each U-Boot version (release) will
>> be allowed to assume. That will limit the number of times people need to
>> update their locally-built dtc to at most once per U-Boot release.
>> Hopefully much less often.
> 
> I think this is broken by design, in several aspects.  First, U-Boot
> is usually not the only user of DTC.  Second, assume you run a "git
> bisect" over a U-Boot tree - would you really want to switch DTC in-
> flight?
> 
> Sorry, instead we should strive to be compatible to a reasonably old,
> stable version of DTC, like we do for all other tools as well.  As
> mentioned before - just because RHEL 5 ships an ancient version of -
> say - "make" we will NOT start building this from the sources ourself.
> This cannot be the way to go.

So the result of that is that we can never ever use new features in any
tool, at least in any meaningful time-frame.

I think we need to differentiate between tools that are already stable
and/or core to all aspects of the U-Boot build process (such as make),
and tools that enable new features that are under development.

Clearly the U-Boot makefiles have to be fairly cautious in their use of
any new make features, so that everyone with any reasonable version of
make can build U-Boot.

However, when enabling a new feature, such as using device trees to
configure U-Boot[1], for which tool support is new and evolving along
with the feature itself, and which is only used on a very very few
boards and even fewer SoCs right now within U-Boot, it seems entirely
reasonable to demand that the people working on/with that new feature
are aware that it's evolving, and that they may need to take a few extra
steps to go out and get tools that support that new feature. No doubt
once this feature has settled down a bit, and distros have pulled in
newer versions of dtc, everthing will "just work" just like any other
stable feature.

If you don't accept this, then we simply have to ban any include use in
U-Boot; dtc -i isn't in distro-packaged versions of dtc, so we'd need to
stop using that. We'd need to move *.dts into a single directory within
U-Boot to work around that, or perhaps hard-coding relative include
paths in *.dts might work. Similarly for the patches to support dtc+cpp
usage, so we wouldn't be able to use named constants in DT files for
many years, which would prevent sharing DT files with the kernel and/or
any other standard repository of DT files, which are bound to use this
feature.

[1] Which is very specifically a different feature than simply having
U-Boot pass a DT to the Linux kernel during boot, and perhaps modify it
a little, which clearly is not a new feature.
