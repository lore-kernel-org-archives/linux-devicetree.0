From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH v3 3/4] arm64:thunder: Add initial dts for Cavium's
 Thunder SoC in 2 Node topology.
Date: Wed, 07 Jan 2015 09:18:50 +0100
Message-ID: <2298510.9qAQRQ2lzi@wuerfel>
References: <1420011208-7051-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
 <3372289.4AUgcSNZN5@wuerfel>
 <CAFpQJXUB8=XhmAn9-SPKaRHoTaTDynfD8xd-mVJOYrAwo50Rzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFpQJXUB8=XhmAn9-SPKaRHoTaTDynfD8xd-mVJOYrAwo50Rzg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ganapatrao Kulkarni <gpkulkarni@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Steve Capper <steve.capper@linaro.org>, Al Stone <al.stone@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Leif Lindholm <leif.lindholm@linaro.org>, Roy Franz <roy.franz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Ganapatrao Kulkarni <ganapatrao.kulkarni@caviumnetworks.com>, msalter@redhat.com, Grant Likely <grant.likely@linaro.org>, jchandra@broadcom.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Hanjun Guo <hanjun.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 07 January 2015 12:37:51 Ganapatrao Kulkarni wrote:
> Hi Arnd,
> 
> On Wed, Jan 7, 2015 at 1:32 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tuesday 06 January 2015 15:04:26 Ganapatrao Kulkarni wrote:
> >> On Sat, Jan 3, 2015 at 2:47 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> >> > On Wednesday 31 December 2014 13:03:27 Ganapatrao Kulkarni wrote:
> >> >> +             cpu@00f {
> >> >> +                     device_type = "cpu";
> >> >> +                     compatible = "cavium,thunder", "arm,armv8";
> >> >> +                     reg = <0x0 0x00f>;
> >> >> +                     enable-method = "psci";
> >> >> +                     arm,associativity = <0 0 0x00f>;
> >> >> +             };
> >> >> +             cpu@100 {
> >> >> +                     device_type = "cpu";
> >> >> +                     compatible = "cavium,thunder", "arm,armv8";
> >> >> +                     reg = <0x0 0x100>;
> >> >> +                     enable-method = "psci";
> >> >> +                     arm,associativity = <0 0 0x100>;
> >> >> +             };
> >> >
> >> > What is the 0x100 offset in the last-level topology field? Does this have
> >> > no significance to topology at all? I would expect that to be something
> >> > like cluster number that is relevant to caching and should be represented
> >> > as a separate level.
> >>
> >> i did not understand, can you please explain little more about "
> >> should be represented as a separate level."
> >> at present, i have put the hwid of a cpu.
> >
> > From what I undertand, the hwid of the CPU contains the "cluster" number in
> > this bit position, so you typically have a shared L2 or L3 cache between
> > all cores within a cluster, but separate caches in other clusters.
> >
> > If this is the case, there will be a measurable difference in performance
> > between two processes sharing memory when running on the same cluster,
> > or when running on different clusters on the same socket. If the
> > performance difference is relevant, it should be described as a separate
> > level in the associativity property.
> you mean, the associativity as array of  <board> <socket> <cluster>

No, that would leave out the core number, which is required to identify
the individual thread. I meant adding an extra level such as

<board> <socket> <cluster> <core>

A lot of machines will leave out the <board> number because they are
built with SoCs that don't have a long-distance coherency protocol.

	Arnd
