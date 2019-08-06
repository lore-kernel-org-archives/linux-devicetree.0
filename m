From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Drop PMU node
Date: Tue, 6 Aug 2019 22:14:39 +0100
Message-ID: <36e60078-7dd5-9c07-ffa1-6092d8c70fa8@arm.com>
References: <20190806140135.4739-1-anarsoul@gmail.com>
 <89402d22-d432-9551-e787-c8ede16dbe5f@arm.com>
 <CA+E=qVfh7mirJhRsDTeuAVgG55ia936uFSFVKR0N5Pn4GCF1UA@mail.gmail.com>
 <E1hv5vZ-0000jN-M8@stardust.g4.wien.funkfeuer.at>
 <CA+E=qVdHOtebR6xjpwTY_Whp0cHLtv82YULmxLPSEzdLN9TnVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CA+E=qVdHOtebR6xjpwTY_Whp0cHLtv82YULmxLPSEzdLN9TnVg@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, "Jared D . McNeill" <jmcneill@netbsd.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 2019-08-06 9:52 pm, Vasily Khoruzhick wrote:
> On Tue, Aug 6, 2019 at 1:19 PM Harald Geyer <harald@ccbib.org> wrote:
>>
>> Vasily Khoruzhick writes:
>>> On Tue, Aug 6, 2019 at 7:35 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>>>
>>>> On 06/08/2019 15:01, Vasily Khoruzhick wrote:
>>>>> Looks like PMU in A64 is broken, it generates no interrupts at all and
>>>>> as result 'perf top' shows no events.
>>>>
>>>> Does something like 'perf stat sleep 1' at least count cycles correctly?
>>>> It could well just be that the interrupt numbers are wrong...
>>>
>>> Looks like it does, at least result looks plausible:
>>
>> I'm using perf stat regularly (cache benchmarks) and it works fine.
>>
>> Unfortunately I wasn't aware that perf stat is a poor test for
>> the interrupts part of the node, when I added it. So I'm not too
>> surprised I got it wrong.
>>
>> However, it would be unfortunate if the node got removed completely,
>> because perf stat would not work anymore. Maybe we can only remove
>> the interrupts or just fix them even if the HW doesn't work?
> 
> I'm not familiar with PMU driver. Is it possible to get it working
> without interrupts?

Yup - you get a grumpy message from the driver, it will refuse sampling 
events (the ones which weren't working anyway), and if you measure 
anything for long enough that a counter overflows you'll get wonky 
results. But for counting hardware events over relatively short periods 
it'll still do the job.

Robin.
