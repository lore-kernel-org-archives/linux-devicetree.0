From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] clk: exynos5420: Add 5800 specific clocks
Date: Fri, 2 May 2014 12:35:48 -0700
Message-ID: <CAD=FV=XThT8Ep1HUvzMEzv2cYNDkUKxdyV_WnbHdM07ppYHM9w@mail.gmail.com>
References: <1399035821-25096-1-git-send-email-arun.kk@samsung.com>
	<1399035821-25096-2-git-send-email-arun.kk@samsung.com>
	<4431329.kolHX05ZMV@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <4431329.kolHX05ZMV@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olofj@google.com>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Arun Kumar <arunkk.samsung@gmail.com>, Andrew Bresticker <abrestic@chromium.org>
List-Id: devicetree@vger.kernel.org

Arnd,

On Fri, May 2, 2014 at 11:52 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Friday 02 May 2014 18:33:39 Arun Kumar K wrote:
>> From: Alim Akhtar <alim.akhtar@samsung.com>
>>
>> Exynos5800 clock structure is mostly similar to 5420 with only
>> a small delta changes. So the 5420 clock file is re-used for
>> 5800 also. The common clocks for both are seggreagated and few
>> clocks which are different for both are separately initialized.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>
> This isn't about your specific patch, but every time I see a new
> exynos variant get supported, it comes with a clock driver patch
> that is at least as big as all the other patches combined.
>
> New variants come out all the time now, and we are starting to
> accumulate huge amounts of clock definitions both in the source
> and the binary. I think we should try to come up with a better
> way to represent the clocks. I don't think any other SoC
> family is nearly as bad as Exynos, either because they have
> much fewer models, or because they abstract their clocks more
> and put all the tables into DT.
>
> I'm definitely not saying no to the exynos5800 addition for this,
> but I'm starting to get a little annoyed, and I think it would be
> good to come up with a new clock binding before we see 64-bit
> Exynos variants.

One thing to note: your suggestion will almost certainly not be
conducive to get stable device trees.  IMHO there's pretty much a zero
chance that you could properly describe all of the exynos clocks in
the first, second, third, or twentieth attempt.  That means that if
anyone ever took it in their head to actually ship a device tree that
wasn't bundled with the kernel that it would probably be wrong.

Declaring just "I have exynos5800 clocks" means that you're not
relying on the device tree.


The clocks are pretty table-based as-is, and I think that's about the
best you're going to get.


NOTE: one could argue that possibly the 5420 and 5800 are different
enough that they ought to have separate tables.  I don't feel like I'm
in enough of an ownership position to make that tradeoff either way,
though.

-Doug
