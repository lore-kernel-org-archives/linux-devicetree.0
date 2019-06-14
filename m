From: "Leonidas P. Papadakos" <papadakospan@gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: add clock for the watchdog pclk on
 rk3328
Date: Fri, 14 Jun 2019 22:47:06 +0300
Message-ID: <1560541626.1367.2@gmail.com>
References: <20190605235714.22432-1-papadakospan@gmail.com>
 <5657669.4RvfzeBcXs@phil> <1560506054.1367.0@gmail.com>
 <2207770.HSO279VB62@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2207770.HSO279VB62@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, itdaniher@gmail.com
List-Id: devicetree@vger.kernel.org


ok. I have tested the conversion on the platforms I did convert there,
> so I'll just apply the 2 patches later on.
> 
> Should I wait on you respinning the rk3328 watchdog patch, or just
> add the rk3328 watchdog pclk myself?
> 
> 
> Heiko
> 

Would be awesome if you added it yourself. You seem to understand this 
a lot better.

Also, I checked out the patch you CCed me on and I'm happy to see that 
the reused code has been replaced with a single unified macro. So much 
tidier.

As far as I understand then, it's a case of adding the pclk id, the 
sgrf thing and enable it in the dts. Cool!
Hoping to see it in 5.3
