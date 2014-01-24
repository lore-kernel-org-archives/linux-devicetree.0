From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 0/2] DT updates for Hummingboard and new Cubox-i
Date: Fri, 24 Jan 2014 23:09:31 +0800
Message-ID: <20140124150927.GA2780@S2101-09.ap.freescale.net>
References: <20140116182211.GX15937@n2100.arm.linux.org.uk>
 <20140119031816.GD16158@S2101-09.ap.freescale.net>
 <20140119185246.GB28056@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140119185246.GB28056@quad.lixom.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, arm@kernel.org, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 19, 2014 at 10:52:46AM -0800, Olof Johansson wrote:
> I'm well aware that the DT branch has not been merged, and that's because
> there has been no consensus from DT maintainers on the massive rework
> you did as the base of the branch.

I guess the 'massive rework' you're talking about is the patch series
that begins with 'ARM: dts: imx6qdl: make pinctrl nodes board specific'?
If so, I hope you would agree that we're trying to solve a real
problem [1], even though the solution does not look like the best to
you.

So which specific part of the solution are you objecting to?  Those
MX6QDL_*_PINGRP macros defined in imx6qdl-pingrp.h?  If that's the
case, I can send a follow-up patch to kill the macros by filling in the
pin group definitions directly.  The pros is that the pin group
definitions for given board will be more intuitive, and the cons is that
the change set will be even more massive, because the same multi-lines
pin group definitions will be duplicated in multiple board dts files,
which use the same group of pins for given device.

Or any other better idea?

> 
> Given the timing, it's not looking like it will be resolved in time for
> the 3.14 merge window (which might open today).

That's frustrating and will be surprising a lot of people who expect to
see their board support in 3.14 release.

Shawn


[1] http://thread.gmane.org/gmane.linux.ports.arm.kernel/275912/
