From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v3 3/4] arm64:thunder: Add initial dts for Cavium's
 Thunder SoC in 2 Node topology.
Date: Thu, 15 Jan 2015 00:18:32 +0530
Message-ID: <CAFpQJXXiUmK+BdQAFxV_JCuLyDSm89M7pe+enc2ZMTbuyC-T+g@mail.gmail.com>
References: <1420011208-7051-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
	<3372289.4AUgcSNZN5@wuerfel>
	<CAFpQJXUB8=XhmAn9-SPKaRHoTaTDynfD8xd-mVJOYrAwo50Rzg@mail.gmail.com>
	<2298510.9qAQRQ2lzi@wuerfel>
	<20150114173639.GA11844@red-moon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150114173639.GA11844@red-moon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Roy Franz <roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lorenzo,

On Wed, Jan 14, 2015 at 11:06 PM, Lorenzo Pieralisi
<lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> On Wed, Jan 07, 2015 at 08:18:50AM +0000, Arnd Bergmann wrote:
>> On Wednesday 07 January 2015 12:37:51 Ganapatrao Kulkarni wrote:
>> > Hi Arnd,
>> >
>> > On Wed, Jan 7, 2015 at 1:32 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> > > On Tuesday 06 January 2015 15:04:26 Ganapatrao Kulkarni wrote:
>> > >> On Sat, Jan 3, 2015 at 2:47 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> > >> > On Wednesday 31 December 2014 13:03:27 Ganapatrao Kulkarni wrote:
>> > >> >> +             cpu@00f {
>> > >> >> +                     device_type = "cpu";
>> > >> >> +                     compatible = "cavium,thunder", "arm,armv8";
>> > >> >> +                     reg = <0x0 0x00f>;
>> > >> >> +                     enable-method = "psci";
>> > >> >> +                     arm,associativity = <0 0 0x00f>;
>> > >> >> +             };
>> > >> >> +             cpu@100 {
>> > >> >> +                     device_type = "cpu";
>> > >> >> +                     compatible = "cavium,thunder", "arm,armv8";
>> > >> >> +                     reg = <0x0 0x100>;
>> > >> >> +                     enable-method = "psci";
>> > >> >> +                     arm,associativity = <0 0 0x100>;
>> > >> >> +             };
>> > >> >
>> > >> > What is the 0x100 offset in the last-level topology field? Does this have
>> > >> > no significance to topology at all? I would expect that to be something
>> > >> > like cluster number that is relevant to caching and should be represented
>> > >> > as a separate level.
>> > >>
>> > >> i did not understand, can you please explain little more about "
>> > >> should be represented as a separate level."
>> > >> at present, i have put the hwid of a cpu.
>> > >
>> > > From what I undertand, the hwid of the CPU contains the "cluster" number in
>> > > this bit position, so you typically have a shared L2 or L3 cache between
>> > > all cores within a cluster, but separate caches in other clusters.
>> > >
>> > > If this is the case, there will be a measurable difference in performance
>> > > between two processes sharing memory when running on the same cluster,
>> > > or when running on different clusters on the same socket. If the
>> > > performance difference is relevant, it should be described as a separate
>> > > level in the associativity property.
>> > you mean, the associativity as array of  <board> <socket> <cluster>
>>
>> No, that would leave out the core number, which is required to identify
>> the individual thread. I meant adding an extra level such as
>>
>> <board> <socket> <cluster> <core>
>>
>> A lot of machines will leave out the <board> number because they are
>> built with SoCs that don't have a long-distance coherency protocol.
>
> Can't we use phandles to cpu-map nodes instead of a list of numbers (and
> yet another topology binding description) ?
cpu-map describes only a cpu topology.
infact, i have tried initially(in v1 patch set) to use topology for
the numa mapping.
However, for numa, we need to define association of cpu, memory and IOs.
arm,associativity is a generic node property and can be used in any dt nodes.
>
> Is arm,associativity used solely to map "devices" (inclusive of caches)
> to a set of cpus ?
>
> cpu-map misses a notion of distance between hierarchy layers, but we can
> add to that.
>
> Lorenzo
thanks
ganapat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
