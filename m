From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v3 2/4] Documentation: arm64/arm: dt bindings for numa.
Date: Tue, 6 Jan 2015 10:58:28 +0530
Message-ID: <CAFpQJXUWGW2M+mzv5apz0CjZnjM7UMHCZYWDcH3NaqT4PKRLnQ@mail.gmail.com>
References: <1420011208-7051-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
	<1420011208-7051-3-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
	<5205211.ZMrS3F6Zab@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5205211.ZMrS3F6Zab@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Roy Franz <roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,


On Sat, Jan 3, 2015 at 2:47 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 31 December 2014 13:03:26 Ganapatrao Kulkarni wrote:
>> DT bindings for numa map for memory, cores and IOs using arm,associa=
tivity
>> device node property.
>>
>> Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni@caviumnetwor=
ks.com>
>> ---
>>  Documentation/devicetree/bindings/arm/numa.txt | 198 ++++++++++++++=
+++++++++++
>>  1 file changed, 198 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/numa.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/numa.txt b/Docume=
ntation/devicetree/bindings/arm/numa.txt
>> new file mode 100644
>> index 0000000..4f51e25
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/numa.txt
>> @@ -0,0 +1,198 @@
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> +NUMA binding description.
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> +1 - Introduction
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Systems employing a Non Uniform Memory Access (NUMA) architecture c=
ontain
>> +collections of hardware resources including processors, memory, and=
 I/O buses,
>> +that comprise what is commonly known as a =C3=A2=E2=82=AC=C5=93NUMA=
 node=C3=A2=E2=82=AC .
>> +Processor accesses to memory within the local NUMA node is generall=
y faster
>> +than processor accesses to memory outside of the local NUMA node.
>> +DT defines interfaces that allow the platform to convey NUMA node
>> +topology information to OS.
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> +2 - arm,associativity
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The mapping is done using arm,associativity device property.
>> +this property needs to be present in every device node which needs =
to to be
>> +mapped to numa nodes.
>> +
>> +arm,associativity property is set of 32-bit integers. representing =
the
>> +board id, socket id and core id.
>> +
>> +ex:
>> +     /* board 0, socket 0, core 0 */
>> +     arm,associativity =3D <0 0 0x000>;
>> +
>> +     /* board 1, socket 0, core 8 */
>> +     arm,associativity =3D <1 0 0x08>;
>
> This is way too specific to Cavium machines. Most other vendors will =
not (at first)
> have multiple boards or multiple sockets, but need to represent multi=
ple clusters
> and/or SMT threads instead. Also the wording suggests that this is on=
ly relevant
> for NUMA, which I don't think is helpful because we will also want to=
 describe
> the topology within one NUMA node for locality.
>
> I think we should stick to the powerpc definition here and not define=
 what the
> levels mean at the binding level. Something like:
>
> "Each level of topology defines a boundary in the system at which a s=
ignificant
> difference in performance can be measured between cross-device access=
es within
> a single location and those spanning multiple locations. The first ce=
ll always
> contains the broadest subdivision within the system, while the last c=
ell enumerates
> the individual devices, such as an SMT thread of a CPU, or a bus brid=
ge within
> an SoC".
Ok,, i will change as suggested.
>
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> +3 - arm,associativity-reference-points
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> +This property is a set of 32-bit integers, each representing an ind=
ex into
>> +the arm,associativity nodes. The first integer is the most signific=
ant
>> +NUMA boundary and the following are progressively less significant =
boundaries.
>> +There can be more than one level of NUMA.
>> +
>> +Ex:
>> +     arm,associativity-reference-points =3D <0 1>;
>> +     The board Id(index 0) used first to calculate the associativit=
y (node
>> +     distance), then follows the  socket id(index 1).
>> +
>> +     arm,associativity-reference-points =3D <1 0>;
>> +     The socket Id(index 1) used first to calculate the associativi=
ty,
>> +     then follows the board id(index 0).
>> +
>> +     arm,associativity-reference-points =3D <0>;
>> +     Only the board Id(index 0) used to calculate the associativity=
=2E
>> +
>> +     arm,associativity-reference-points =3D <1>;
>> +     Only socket Id(index 1) used to calculate the associativity.
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> +4 - Example dts
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Example: 2 Node system consists of 2 boards and each board having o=
ne socket
>> +and 8 core in each socket.
>
> I think the example should also include a PCI controller.
Yes, i will add pci.
>
>> +
>> +     arm,associativity-reference-points =3D <0 1>;
>
> This doesn't really match the associativity properties, because the
> second level in the cpus nodes is completely meaningless and should
> not be listed as a secondary reference point.
agreed, will remove second entry.
>
>         Arnd

thanks
ganapat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
