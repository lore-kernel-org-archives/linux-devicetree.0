From: Maciej Purski <m.purski@samsung.com>
Subject: Re: [PATCH v6 0/5] Add coupled regulators mechanism
Date: Fri, 09 Mar 2018 13:50:20 +0100
Message-ID: <5cf960c5-73ab-fd53-fb68-b6f7f92ca3e7@samsung.com>
References: <CGME20180309122231eucas1p1b8e0a85a73b31aa07eac08f809face6e@eucas1p1.samsung.com>
        <1520598128-11768-1-git-send-email-m.purski@samsung.com>
        <20180309124234.GC5252@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20180309124234.GC5252@sirena.org.uk>
Content-language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org



On 03/09/2018 01:42 PM, Mark Brown wrote:
> On Fri, Mar 09, 2018 at 01:22:02PM +0100, Maciej Purski wrote:
> 
>> I would like to kindly ask Fabio Estevam and Tony Lindgren to test the patch
>> series on their boards.
> 
> That'd be great, yeah - I can run some tests with kernelci as well,
> though the latency is relatively high there.
> 
> Is it possible to respin this in terms of the test/coupled branch in my
> git tree?  There were a bunch of build fixes that got sent and I don't
> want to loose any of those.
> 

I have included those build fixes in my new patchset. I can extract the newest 
changes and rebase them against your test/coupled branch, if that's what you're 
asking for.
