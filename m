From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 00/10] Marvell Berlin full clock support
Date: Thu, 29 May 2014 09:30:47 -0700
Message-ID: <20140529163047.10062.93368@quantum>
References: <1400517811-24668-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <20140529000713.10062.99196@quantum> <5386FBC3.1000003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5386FBC3.1000003@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jisheng Zhang <jszhang@marvell.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Sebastian Hesselbarth (2014-05-29 02:20:03)
> On 05/29/2014 02:07 AM, Mike Turquette wrote:
> > Quoting Sebastian Hesselbarth (2014-05-19 09:43:21)
> >> Mike,
> >>
> >> this is v2 of the Berlin SoC clock driver [1] but with a reworked DT
> >> binding as requested [2]. We decided to not even try to split up the chip
> >> control registers that deal with pinmux, padmux, clock, reset, and evil
> >> stuff we haven't even looked at. Instead we keep a single node that clock
> >> driver will remap early, while proper platform_drivers use a regmap
> >> instead. Although clock and other drivers share the same register range,
> >> they use individual registers exclusively.
> >>
> >> There are some functional fixes in the single clock drivers, I noticed
> >> while retesting each individial driver. There will be more to fixup but
> >> without any drivers actually using the clocks, it is hard to tell what
> >> isn't working now.
> >>
> >> Anyway, the current binding should match what you requested and having
> >> a clock driver for v3.16 will really be a huge benefit for us to work
> >> on more driver support.
> >>
> >> If you are fine with it, please take patches 2-7 and I'll pick up
> >> 1,8-10 in berlin branch.
> > 
> > Patches #2-7 applied to clk-next.
> 
> Thanks Mike, but please drop patch #2
>   ("clk: berlin: add binding include for Berlin SoC clock ids")
> before you push your clk-next branch, it already went through arm-soc.

Thanks for the heads-up. I've dropped the patch.

Regards,
Mike

> 
> Sorry,
>   Sebastian
