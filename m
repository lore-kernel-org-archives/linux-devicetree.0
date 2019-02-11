From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCH v2 2/3] mfd: syscon: Add optional clock support
Date: Mon, 11 Feb 2019 17:32:30 +0100
Message-ID: <01d49f11-a68e-1674-e6b7-d1b87aa973c9@st.com>
References: <1544604495-4082-1-git-send-email-fabrice.gasnier@st.com>
 <1544604495-4082-3-git-send-email-fabrice.gasnier@st.com>
 <CAK8P3a1MucNG86=bXwVVsasGBOLJ67kuRSpoeneF6M5aB6GmQA@mail.gmail.com>
 <9e0ee154-a399-9bff-3beb-adfd9d6c6fee@st.com>
 <CAK8P3a0kV4-OF7JPwM9cEqxaPvNM9dFZdyZetc47t+D5izkFwQ@mail.gmail.com>
 <47a3fe9f-8adb-8f47-e7c1-342f8fc318aa@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <47a3fe9f-8adb-8f47-e7c1-342f8fc318aa@st.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@st.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 1/28/19 2:20 PM, Fabrice Gasnier wrote:
> On 1/16/19 4:11 PM, Arnd Bergmann wrote:
>> On Wed, Jan 16, 2019 at 3:10 PM Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
>>>
>>> On 1/16/19 1:14 PM, Arnd Bergmann wrote:
>>>> (sorry for the late reply, I just realized that I had never sent out the
>>>> mail after Lee asked me for a review last year and I had drafted
>>>> my reply).
>>>
>>> Hi Arnd,
>>>
>>> Many thanks for reviewing, no worries :-)
>>>
>>>>
>>>> On Wed, Dec 12, 2018 at 9:48 AM Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
>>>>>
>>>>> Some system control registers need to be clocked, so the registers can
>>>>> be accessed. Add an optional clock and attach it to regmap.
>>>>>
>>>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
>>>>
>>>> This looks ok to me in principle, but I have one question: When we
>>>> do a clk_get() and clk_prepare() as part of regmap_mmio_attach_clk(),
>>>> does that change the behavior of syscon nodes that are otherwise
>>>> unused?
>>>
>>> I'm not sure I correctly understand this question. I don't think it will
>>> change the behavior for "unused" nodes. These should remain unused with
>>> this patch.
>>
>> What I mean is that nodes that listed as 'compatible="syscon"' get
>> probed by the syscon driver even when no other driver references
>> them, and that in turn would acquire the clock, right?
> 
> Hi Arnd,
> 
> Sorry for the late reply.
> 
> When no other driver references them, nothing happens at probe time on
> the clock: no calls to get/prepare... the clock.
> 
> => The clock will remain unrequested & unused until another driver calls
> one of "of_syscon_register()" variants:
> - syscon_node_to_regmap
> - syscon_regmap_lookup_by_compatible
> - syscon_regmap_lookup_by_phandle
> 
> When another driver references them (e.g. one of the above calls), then
> it will acquire the optional clock and use it, e.g.:
> - clk_prepare() upon of_syscon_register() variants
> - clk_enable & clk_disable when accessing the registers
> 
> I hope this clarifies.
> 
> Please advise,
> Best Regards,
> Fabrice

Hi Arnd,

Gentlemen reminder for this. I would appreciate to have your
feedback.

Many thanks,
Fabrice

> 
>>
>>>> I think we have a bunch of devices that started out as a syscon but
>>>> then we added a proper driver for them, which would handle the
>>>> clocks explicitly. Is it guaranteed that this will keep working (including
>>>> shutting down the clocks when they are unused) if we have two drivers
>>>> that call clk_get() on the same device node?
>>>
>>> I'd expect nothing wrong happens when two drivers call clk_get() for the
>>> same clock.
>>> Are there some case where two drivers are bind (e.g. syscon driver +
>>> another driver) for the same piece of hardware ?
>>
>> You won't actually have two drivers binding to the same device, but you
>> could have a driver and a syscon user that does relies on the
>> syscon_regmap_lookup_by_*() functions.
>>
>> I think we've had a couple of cases where we started out representing
>> a device as syscon, and then later decided that a high-level abstraction
>> would be needed because syscon didn't quite support all the needed
>> features.
>>
>> Since each syscon node should also have a more specific
>> compatible value, you can then have another driver that binds
>> to that compatible string.
>>
>>       Arnd
>>
