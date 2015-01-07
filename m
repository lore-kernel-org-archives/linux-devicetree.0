From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v3 3/4] arm64:thunder: Add initial dts for Cavium's
 Thunder SoC in 2 Node topology.
Date: Wed, 7 Jan 2015 12:37:51 +0530
Message-ID: <CAFpQJXUB8=XhmAn9-SPKaRHoTaTDynfD8xd-mVJOYrAwo50Rzg@mail.gmail.com>
References: <1420011208-7051-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
	<1741288.B6kbjm5Uq5@wuerfel>
	<CAFpQJXXnM==4AmmNHf8yp2x0aK4Lnp2cy-4JpzuxsgXX3A=J4A@mail.gmail.com>
	<3372289.4AUgcSNZN5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3372289.4AUgcSNZN5@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Roy Franz <roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Wed, Jan 7, 2015 at 1:32 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 06 January 2015 15:04:26 Ganapatrao Kulkarni wrote:
>> On Sat, Jan 3, 2015 at 2:47 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> > On Wednesday 31 December 2014 13:03:27 Ganapatrao Kulkarni wrote:
>> >> +             cpu@00f {
>> >> +                     device_type = "cpu";
>> >> +                     compatible = "cavium,thunder", "arm,armv8";
>> >> +                     reg = <0x0 0x00f>;
>> >> +                     enable-method = "psci";
>> >> +                     arm,associativity = <0 0 0x00f>;
>> >> +             };
>> >> +             cpu@100 {
>> >> +                     device_type = "cpu";
>> >> +                     compatible = "cavium,thunder", "arm,armv8";
>> >> +                     reg = <0x0 0x100>;
>> >> +                     enable-method = "psci";
>> >> +                     arm,associativity = <0 0 0x100>;
>> >> +             };
>> >
>> > What is the 0x100 offset in the last-level topology field? Does this have
>> > no significance to topology at all? I would expect that to be something
>> > like cluster number that is relevant to caching and should be represented
>> > as a separate level.
>>
>> i did not understand, can you please explain little more about "
>> should be represented as a separate level."
>> at present, i have put the hwid of a cpu.
>
> From what I undertand, the hwid of the CPU contains the "cluster" number in
> this bit position, so you typically have a shared L2 or L3 cache between
> all cores within a cluster, but separate caches in other clusters.
>
> If this is the case, there will be a measurable difference in performance
> between two processes sharing memory when running on the same cluster,
> or when running on different clusters on the same socket. If the
> performance difference is relevant, it should be described as a separate
> level in the associativity property.
you mean, the associativity as array of  <board> <socket> <cluster>
>
>         Arnd
thanks
ganapat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
