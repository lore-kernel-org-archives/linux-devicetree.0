From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] s5p-jpeg: Enable instantiation from device tree
Date: Fri, 10 May 2013 09:13:52 +0530
Message-ID: <CAK9yfHwLm=2fDXqR-LWTwYTE3ETJ1HqkyadKVkAxpT+-dFzh1w@mail.gmail.com>
References: <1368103198-16485-1-git-send-email-s.nawrocki@samsung.com>
	<CAK9yfHx-o-3oYj8hMKzQK7N3CD7=tUwbxcHG-9gA25yfRjky2Q@mail.gmail.com>
	<518BC61E.3040202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <518BC61E.3040202@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-media@vger.kernel.org, a.hajda@samsung.com, hj210.choi@samsung.com, sw0312.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, George Joseph <george.jp@samsung.com>, "aditya.ps" <aditya.ps@samsung.com>, sunil joshi <joshi@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi Sylwester,

On 9 May 2013 21:21, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> Hi Sachin,
>
> On 05/09/2013 04:50 PM, Sachin Kamat wrote:
>> George from my team is working on adding JPEG IP support for 4412 and
>> 5250 SoCs which is quite different from 4210.
>> In this regard he has refactored the driver to accomodate the changes
>> required for the new IP and also added DT support.
>> The patches are almost ready and would be submitted in the next couple
>> of days. This is FYI :)
>
> That's greats news, since on our side currently nobody has been working
> on the Exynos4x12+ JPEG codec support. I just prepared a patch adding
> DT matching table and checked the driver gets initialized on Exynos4x12.
> So it is at least usable on Exynos4210 in 3.11. I should not have listed
> "samsung,exynos4212-jpeg" in the driver, since it is missing adaptations
> for Exynos4x12 SoCs.

Right.

> We have plenty time to add proper support for the JPEG IP in 3.11. I'm
> looking forward to review and test your patches.

Thanks.

>Can you use the $subject
> patch as a base of your work ? ;-) Or is it rather useless ?

It is not useless per se. But I am afraid it might not apply directly
due to the refactoring.
However we will be happy to use your documentation for the bindings :)

>
> FYI, I will be mostly offline for next 2 weeks.

OK.

-- 
With warm regards,
Sachin
