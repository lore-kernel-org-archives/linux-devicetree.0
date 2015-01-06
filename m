From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v3 3/4] arm64:thunder: Add initial dts for Cavium's
 Thunder SoC in 2 Node topology.
Date: Tue, 6 Jan 2015 15:04:26 +0530
Message-ID: <CAFpQJXXnM==4AmmNHf8yp2x0aK4Lnp2cy-4JpzuxsgXX3A=J4A@mail.gmail.com>
References: <1420011208-7051-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
	<1420011208-7051-4-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
	<1741288.B6kbjm5Uq5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1741288.B6kbjm5Uq5@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Roy Franz <roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 3, 2015 at 2:47 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 31 December 2014 13:03:27 Ganapatrao Kulkarni wrote:
>> +
>> +     memory@00000000 {
>> +             device_type = "memory";
>> +             reg = <0x0 0x00000000 0x0 0x80000000>;
>> +             /* board 0, socket 0, no specific core */
>> +             arm,associativity = <0 0 0xffff>;
>> +     };
>> +
>> +     memory@10000000000 {
>> +             device_type = "memory";
>> +             reg = <0x100 0x00000000 0x0 0x80000000>;
>> +             /* board 1, socket 0, no specific core */
>> +             arm,associativity = <1 0 0xffff>;
>> +     };
>> +};
>
> So no memory in any other socket?
>
>> +             cpu@00f {
>> +                     device_type = "cpu";
>> +                     compatible = "cavium,thunder", "arm,armv8";
>> +                     reg = <0x0 0x00f>;
>> +                     enable-method = "psci";
>> +                     arm,associativity = <0 0 0x00f>;
>> +             };
>> +             cpu@100 {
>> +                     device_type = "cpu";
>> +                     compatible = "cavium,thunder", "arm,armv8";
>> +                     reg = <0x0 0x100>;
>> +                     enable-method = "psci";
>> +                     arm,associativity = <0 0 0x100>;
>> +             };
>
> What is the 0x100 offset in the last-level topology field? Does this have
> no significance to topology at all? I would expect that to be something
> like cluster number that is relevant to caching and should be represented
> as a separate level.
i did not understand, can you please explain little more about "
should be represented as a separate level."
at present, i have put the hwid of a cpu.
>
> In contrast, the level-two topology information seems to always be
> zero for all CPUs, so you could probably leave that one out.
>
>> +     soc {
>> +             compatible = "simple-bus";
>> +             #address-cells = <2>;
>> +             #size-cells = <2>;
>> +             ranges;
>
> The soc node is missing a topology information, please add one.
ok, will be added.
>
>         Arnd

thanks
ganapat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
