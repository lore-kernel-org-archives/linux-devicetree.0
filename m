From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: ti,sci-clk: Add support for
 parsing clock info from DT
Date: Thu, 7 Feb 2019 10:59:59 +0200
Message-ID: <2a22b7f4-8ac4-184e-6c69-f324488614ee@ti.com>
References: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
 <1546954223-9738-2-git-send-email-t-kristo@ti.com>
 <20190121210449.GB7851@bogus> <7ce7bd25-b5c4-f99d-fda6-0f21376f2204@ti.com>
 <ab8707fb-e632-5be9-9fdb-4b1fb3cb26ba@ti.com>
 <154947523891.74891.8214442349263473281@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <154947523891.74891.8214442349263473281@swboyd.mtv.corp.google.com>
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
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ssantosh@kernel.org
List-Id: devicetree@vger.kernel.org

On 06/02/2019 19:47, Stephen Boyd wrote:
> Quoting Tero Kristo (2019-02-05 00:25:40)
>> On 22/01/2019 09:33, Tero Kristo wrote:
>>> On 21/01/2019 23:04, Rob Herring wrote:
>>>> At first, I thought this was an either/or thing. Use firmware or use DT,
>>>> but it is really only get the clocks used in the DT from firmware.
>>>>
>>>> Why wouldn't you just always do that? I can think of 3 cases:
>>>> reparenting, debug and overlays. This breaks reparenting and overlays,
>>>> right? Debug could be handled with some userspace trigger to get all the
>>>> clocks.
>>>
>>> Re-parenting this does not break, as the scan still checks every
>>> possible parent of a clock scanned. Overlays are broken for sure, as we
>>> don't know which overlays we would be applying, and what clocks would be
>>> in them. Debug is kind of broken as we only scan a small portion of the
>>> clocks.
>>>
>>>>
>>>> Why scan any of the clocks up front? Why not just create the clocks on
>>>> demand? If an unknown clock id is requested, then create the clock and
>>>> query the firmware at that point. That would avoid the DT scan too.
>>>> Maybe there's some issues in the clk framework preventing that, but
>>>> that's not really a DT problem.
>>>
>>> The very initial version I did a couple of years back, did scan the
>>> clocks based on need, and registered them dynamically. Stephen shot down
>>> this based on the assessment that there might be locking issues with the
>>> common clock framework with this approach leading into potential
>>> deadlock situations.
> 
> It's an interesting idea to limit the scope of clks that are registered
> to only the leaf and whatever up to the root of the tree is involved in
> the working set of the kernel.
> 
>>
>> So Rob, what is the final call on this binding? Ack/NAK? If NAK, shall I
>> implement a kernel cmdline param to select the parsing method or what is
>> preferred? Doing it build time with a simple Kconfig seems too limiting.
>>
> 
> Is the problem a performance problem where probing the firmware for all
> the clks is costly and time intensive?

Yes this is pretty expensive, as there can be quite a large amount of 
clocks on a SoC, and each clock must be probed separately.

> So instead of doing that we're
> describing some of the details in DT? Why can't we describe the clk tree
> in C code with some data structure that indicates parent child linkages?
> This is how every other SoC is doing this so far.

We can obviously do that also, however it is "neat" that we can probe 
the available clocks from the device, and don't need to hardcode 
anything kernel side... and neither maintain the clock data. If we want 
to go the hardcoded way, I can create tools to autogenerate the kernel 
side clock data from the clock dump of a running system though, and use 
the built-in clock data if it is available, retaining the existing probe 
method basically for new devices.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
