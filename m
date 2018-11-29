From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 01/10] ARM64: dts: amlogic: Add all CPUs in cooling maps
Date: Wed, 28 Nov 2018 16:35:03 -0800
Message-ID: <7hd0qod8lk.fsf@baylibre.com>
References: <cover.1542362530.git.viresh.kumar@linaro.org> <2778d0d4813cc56be851719846afecbab5f2e657.1542362530.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2778d0d4813cc56be851719846afecbab5f2e657.1542362530.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, arm@kernel.org, Carlo Caione <carlo@caione.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Viresh Kumar <viresh.kumar@linaro.org> writes:

> Each CPU can (and does) participate in cooling down the system but the
> DT only captures a handful of them, normally CPU0, in the cooling maps.
> Things work by chance currently as under normal circumstances its the
> first CPU of each cluster which is used by the operating systems to
> probe the cooling devices. But as soon as this CPU ordering changes and
> any other CPU is used to bring up the cooling device, we will start
> seeing failures.
>
> Also the DT is rather incomplete when we list only one CPU in the
> cooling maps, as the hardware doesn't have any such limitations.
>
> Update cooling maps to include all devices affected by individual trip
> points.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Queued for v4.21,

Thanks!

Kevin
