From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] s5p-jpeg: Enable instantiation from device tree
Date: Thu, 9 May 2013 20:20:36 +0530
Message-ID: <CAK9yfHx-o-3oYj8hMKzQK7N3CD7=tUwbxcHG-9gA25yfRjky2Q@mail.gmail.com>
References: <1368103198-16485-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1368103198-16485-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-media@vger.kernel.org, a.hajda@samsung.com, hj210.choi@samsung.com, sw0312.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, George Joseph <george.jp@samsung.com>, "aditya.ps" <aditya.ps@samsung.com>, sunil joshi <joshi@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi Sylwester,

George from my team is working on adding JPEG IP support for 4412 and
5250 SoCs which is quite different from 4210.
In this regard he has refactored the driver to accomodate the changes
required for the new IP and also added DT support.
The patches are almost ready and would be submitted in the next couple
of days. This is FYI :)



On 9 May 2013 18:09, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> This patch adds device tree support for the S5P/Exynos SoC
> JPEG codec IP block.
>
> Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

-- 
With warm regards,
Sachin
