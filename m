From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v4 03/18] Documentation: devicetree: arm: cpus/cpu
 nodes bindings updates
Date: Tue, 16 Jul 2013 22:22:22 -0500
Message-ID: <51E60DEE.6090403@gmail.com>
References: <1368804061-4421-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1368804061-4421-4-git-send-email-lorenzo.pieralisi@arm.com>
 <CAL_JsqLANi5UoVyRMsa6XoQ+_KnmTQDfTz++shEh-dZ3FQGZaQ@mail.gmail.com>
 <20130715093406.GC15904@e102568-lin.cambridge.arm.com>
 <51E44486.7050806@gmail.com>
 <20130716094508.GA28503@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130716094508.GA28503-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
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

On 07/16/2013 04:45 AM, Lorenzo Pieralisi wrote:
> On Mon, Jul 15, 2013 at 07:50:46PM +0100, Rob Herring wrote:
>> On 07/15/2013 04:34 AM, Lorenzo Pieralisi wrote:
>>> On Fri, Jul 12, 2013 at 03:47:17PM +0100, Rob Herring wrote:
>>>> On Fri, May 17, 2013 at 10:20 AM, Lorenzo Pieralisi
>>>> <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
>>>>> In order to extend the current cpu nodes bindings to newer CPUs
>>>>> inclusive of AArch64 and to update support for older ARM CPUs this
>>>>> patch updates device tree documentation for the cpu nodes bindings.
>>>>
>>>> Sorry for the long delay on this, but I'm still not happy with the binding here.
>>>
>>> I had to ask Russell again to drop the bindings patches from the patch
>>> system, and this is not acceptable since two months have passed and the
>>> entire series was reviewed, acked and partially merged. I will review
>>> these bindings again but I would like to understand who should give the final
>>> go ahead to get these patches queued for upstreaming, I can't continue
>>> updating this stuff forever.
>>
>> Most of my comments are for 64-bit. So don't blame me that it had to be
>> reverted. I said up front I was concerned about this change breaking
>> things and it appears it did. New kernels must not require a new DT.
> 
> The patches in Russell's tree do not break anything, I asked him to drop
> them since, if we change the bindings again, those patches change and have
> to be reworked. It was not meant to blame you at all, just saying that
> the process to get this stuff in the kernel should be defined properly
> and patches reviewed in a timely fashion.
> 
> And for legacy reasons the situation related to cpu/cpus node bindings
> is a complicated one, there are bindings in the ePAPR, bindings in the
> kernel, people are confused and with this set we wanted to draw a
> line. For arm64 this is an absolute must.
> 
> I disagree with you on the "new kernels must not require a new DT".
> That's true if bindings are well defined, not for a mix of legacy ePAPR and
> bindings-in-the-kernel.

Well defined depends on the platform. For purposes of a single cluster
ARM system, the ePAPR was pretty much sufficient for cpu node
description. The initial discussion was whether we even needed cpu nodes
at all.

We're always going to have something new that we did not account for. So
even for well defined bindings, we'll have to make changes/extensions at
some point. It just needs to be years, not months for changes.

> What's the DT standard for ARM cpu/cpus node ? ePAPR ? In kernel docs ?
> A combination thereof ? Things are not clear cut and I do not like that, it
> is confusing.

ePAPR is a guideline, but in the end it is a PowerPC document. In some
cases we can just use what it defines and in others we need to deviate.
In an ideal world, we would create the equivalent for ARM or figure out
how to merge ARM requirements with ePAPR. However, since UEFI and ACPI
are going to solve all our problems, no one seems interested in defining
a more formal document.

To further complicate things, there is also the original OF
specification to follow as well. So I would say all the docs apply and
the order of priority is DT binding docs, ePAPR, OF specs. The DT
binding docs need to be complete enough to avoid confusion.

Rob
