From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v3 0/2] Support for Axentia TSE-850
Date: Thu, 1 Dec 2016 08:02:57 +0100
Message-ID: <b8bf3670-b925-c35f-7f03-5324a1dd1f9c@axentia.se>
References: <1480510102-24587-1-git-send-email-peda@axentia.se>
 <5198068.r9o6jcztHW@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5198068.r9o6jcztHW@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On 2016-11-30 23:25, Arnd Bergmann wrote:
> On Wednesday, November 30, 2016 1:48:20 PM CET Peter Rosin wrote:
>> Hi!
>>
>> changes v2 -> v3
>> - document the new compatible strings prefixed with "axentia,".
>>
>> changes v1 -> v2
>> - squash the fixup into the correct patch, sorry for the noise.
>>
>> After finally having all essintial drivers upstreamed (the
>> last ones are currently in -next) I would like to have the
>> dts and the defconfig also upstreamed.
>>
>> Cheers,
>> Peter
>>
>> Peter Rosin (2):
>>   ARM: dts: add devicetree for the Axentia TSE-850
>>   ARM: tse850_defconfig: add Axentia TSE-850
>>
>>  Documentation/devicetree/bindings/arm/axentia.txt |  19 ++
>>  MAINTAINERS                                       |   8 +
>>  arch/arm/boot/dts/Makefile                        |   1 +
>>  arch/arm/boot/dts/axentia-linea.dtsi              |  53 +++++
>>  arch/arm/boot/dts/axentia-tse850-3.dts            | 276 ++++++++++++++++++++++
>>  arch/arm/configs/tse850_defconfig                 | 223 +++++++++++++++++
>>  6 files changed, 580 insertions(+)
> 
> Hi Peter,
> 
> I'm a bit confused. Are these just boards using the sama5d31 SoC,
> or something else?

No no, it's just what it seems, a cpu module with a sama5d31 and a
board using it (a couple more boards using the cpu module coming
later). I just didn't know about the naming conventions.

> Normally, dts files are picked up by the SoC platform maintainers
> and named with a prefix for that soc.

I was starting to wonder about the deafening silence, now I know
the reason...

> Also, we don't normally add a defconfig file for a specific
> machine, just add the options you want to sama5_defconfig
> and multi_v7_defconfig, and send all patches to the
> at91 maitainers.

I'll make some changes, thank you very much for the pointers!

Cheers,
Peter
