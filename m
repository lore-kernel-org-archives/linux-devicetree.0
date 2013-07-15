From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v4 03/18] Documentation: devicetree: arm: cpus/cpu
 nodes bindings updates
Date: Mon, 15 Jul 2013 13:50:46 -0500
Message-ID: <51E44486.7050806@gmail.com>
References: <1368804061-4421-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1368804061-4421-4-git-send-email-lorenzo.pieralisi@arm.com>
 <CAL_JsqLANi5UoVyRMsa6XoQ+_KnmTQDfTz++shEh-dZ3FQGZaQ@mail.gmail.com>
 <20130715093406.GC15904@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130715093406.GC15904-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
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
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/15/2013 04:34 AM, Lorenzo Pieralisi wrote:
> On Fri, Jul 12, 2013 at 03:47:17PM +0100, Rob Herring wrote:
>> On Fri, May 17, 2013 at 10:20 AM, Lorenzo Pieralisi
>> <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
>>> In order to extend the current cpu nodes bindings to newer CPUs
>>> inclusive of AArch64 and to update support for older ARM CPUs this
>>> patch updates device tree documentation for the cpu nodes bindings.
>>
>> Sorry for the long delay on this, but I'm still not happy with the binding here.
> 
> I had to ask Russell again to drop the bindings patches from the patch
> system, and this is not acceptable since two months have passed and the
> entire series was reviewed, acked and partially merged. I will review
> these bindings again but I would like to understand who should give the final
> go ahead to get these patches queued for upstreaming, I can't continue
> updating this stuff forever.

Most of my comments are for 64-bit. So don't blame me that it had to be
reverted. I said up front I was concerned about this change breaking
things and it appears it did. New kernels must not require a new DT.

But yes, this should have been reviewed more quickly. We're working on a
plan to help address DT binding reviews. We have not enforced that Grant
and I must ack all bindings, but in this case you certainly need mine
since I have reviewed it and if you want to me to pull it.

>>> Main changes:
>>>     - adds 64-bit bindings
>>>     - define usage of #address-cells
>>>     - define 32/64 dts compatibility settings
>>>     - defines behaviour on pre and post v7 uniprocessor systems
>>>     - adds ARM 11MPcore specific reg property definition
>>>
>>> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/arm/cpus.txt | 459 ++++++++++++++++++++++---
>>>  1 file changed, 412 insertions(+), 47 deletions(-)
>>
>> [snip]
>>
>>> +                       # On ARM v8 64-bit systems, where the reg property
>>> +                         size can be 1 or 2 cells (as defined by cpus node's
>>> +                         #address-cells property), this property is
>>> +                         required and matches:
>>> +
>>> +                         - On systems running the OS in AArch32:
>>
>> The DTS cannot change based on 32-bit or 64-bit OS.
> 
> "On systems running the OS in AArch32" implies a dependency on the
> HW execution state. Since the DT is used to configure OSs I thought that
> could be a valid sentence. Unfortunately this stuff is not C, so I
> reiterate my point above, before changing it I would like to understand
> who should say the wording is ok otherwise we could argue forever.

It does configure the OS, but not for 32 vs. 64 bit. That is more of a
problem for the bootloader to know which mode to boot in and covered
under something like Documentation/arm/Booting. Booting ARM vs. Thumb
mode would be similar situation.

Think about how your PC boots and add to that having a DTB as part of
the firmware shipped with your PC. Then the end user can install a
32-bit or 64-bit OS on it. That is the usecase that needs to be
supported and having different DTB for 32 and 64 bit is totally broken
and doesn't even help solve that problem.

>>> +
>>> +       - cpu-release-addr
>>> +               Usage: required for systems that have an "enable-method"
>>> +                      property value of "spin-table".
>>> +               Value type: <prop-encoded-array>
>>> +               Definition:
>>> +                       # On ARM v8 64-bit systems must be a two cell
>>> +                         property identifying a 64-bit zero-initialised
>>> +                         memory location.
>>
>> As I mentioned previously, isn't some wake-up method needed? Most
>> systems will be in wfi or wfe rather than continuously spinning.
> 
> Mmm...this can become a minefield, wfe, wfi, CPU in reset..this needs some
> thought.

Yes, it is today and standardizing this is a good thing. Which is what
PSCI does. So why are you adding the spintable at all? Are you trying to
set this as the standard for non-PSCI enabled platforms? Why not just
say v8 boot interface is PSCI. Sure, we'll probably have to deal with
other methods, but documenting something else here is not going to
prevent that problem. I don't think a simple spintable would even work
for any/most current platforms. I'd think we'd want to define something
that would work for existing platforms (chances are new platforms will
work like vendors' existing 32-bit platforms).

Rob
