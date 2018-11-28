From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/6] ARM: dts: ls1021a: Add all CPUs in cooling maps
Date: Wed, 28 Nov 2018 10:46:26 +0800
Message-ID: <20181128024625.GD20643@dragon>
References: <cover.1542362000.git.viresh.kumar@linaro.org>
 <4e3e13854a25a2c59a8202872191be329ae4d5f1.1542362000.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4e3e13854a25a2c59a8202872191be329ae4d5f1.1542362000.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>, devicetree@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 16, 2018 at 03:31:11PM +0530, Viresh Kumar wrote:
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

Applied, thanks.
