From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 2/2] arm: dts: meson: Fix IRQ trigger type for macirq
Date: Thu, 10 Jan 2019 16:21:14 -0800
Message-ID: <7hpnt4qc1x.fsf@baylibre.com>
References: <20181207105231.25593-1-ccaione@baylibre.com>
 <20181207105231.25593-3-ccaione@baylibre.com>
 <CAFBinCAbOdPnsH4TLLBmMnR5tS+jHfHagWudVLjaH6X89vtgDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFBinCAbOdPnsH4TLLBmMnR5tS+jHfHagWudVLjaH6X89vtgDQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Carlo Caione <ccaione@baylibre.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, ingrassia@epigenesys.com
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Carlo,
>
> On Fri, Dec 7, 2018 at 11:52 AM Carlo Caione <ccaione@baylibre.com> wrote:
>>
>> A long running stress test on a custom board shipping an AXG SoCs and a
>> Realtek RTL8211F PHY revealed that after a few hours the connection
>> speed would drop drastically, from ~1000Mbps to ~3Mbps. At the same time
>> the 'macirq' (eth0) IRQ would stop being triggered at all and as
>> consequence the GMAC IRQs never ACKed.
>>
>> After a painful investigation the problem seemed to be due to a wrong
>> defined IRQ type for the GMAC IRQ that should be LEVEL_HIGH instead of
>> EDGE_RISING.
>>
>> The change in the macirq IRQ type also solved another long standing
>> issue affecting this SoC/PHY where EEE was causing the network
>> connection to die after stressing it with iperf3 (even though much
>> sooner). It's now possible to remove the 'eee-broken-1000t' quirk as
>> well.
> (disclaimer: I was not able to reproduce this bug without your
> patches, but I didn't run iperf3 for more than a couple of minutes)
> I did test your patch with and without my "Meson8b RGMII Ethernet pin
> cleanup" from [0] which shows that there's another performance related
> problem:
> 1) before and after your patch receive speeds were fine (above
> 700Mbit/s and no transmit errors / retries in iperf3) but the transmit
> speed was bad (<200Mbit/s and >1500 retries in perf3)
> 2) transmit errors (when Odroid-C1 is sending) are not occurring
> anymore after my patch from [0]
>
> thus I believe your patch is fine, especially since we already have
> IRQ_TYPE_LEVEL_HIGH for the dwc2 controllers
>
>> Fixes: 9c15795a4f96 ("ARM: dts: meson8b-odroidc1: ethernet support")
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> I wonder if Kevin can send this as a fix for v4.20

Queued as a fix for v5.0-rc

Kevin
