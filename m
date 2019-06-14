From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/2] clk: rockchip: add clock for the watchdog pclk on
 rk3328
Date: Fri, 14 Jun 2019 12:31:58 +0200
Message-ID: <2207770.HSO279VB62@phil>
References: <20190605235714.22432-1-papadakospan@gmail.com>
 <5657669.4RvfzeBcXs@phil> <1560506054.1367.0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1560506054.1367.0@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Leonidas P. Papadakos" <papadakospan@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, itdaniher@gmail.com
List-Id: devicetree@vger.kernel.org

Hi,

Am Freitag, 14. Juni 2019, 11:54:14 CEST schrieb Leonidas P. Papadakos:
> 
> > Were you able yet to take a look at the clock-patches I Cc'ed you on
> > and look at reworking your patch accrodingly?
> > 
> > 
> > Thanks
> > Heiko
> > 
> My time is limited due to exams, and I have no knowledge on how the clk 
> stuff works, but I'll read up when I have the time. The patched you 
> CCed me on is certainly helpful in this regard

ok. I have tested the conversion on the platforms I did convert there,
so I'll just apply the 2 patches later on.

Should I wait on you respinning the rk3328 watchdog patch, or just
add the rk3328 watchdog pclk myself?


Heiko
