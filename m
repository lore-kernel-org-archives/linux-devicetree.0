From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v10 3/7] ARM: dts: enable hi4511 with device tree
Date: Wed, 16 Oct 2013 09:10:34 +0200
Message-ID: <201310160910.35093.arnd@arndb.de>
References: <1381828577-27998-1-git-send-email-haojian.zhuang@linaro.org>
 <201310152018.10908.arnd@arndb.de>
 <CAD6h2NTb8-8nSuaa6eQNYBFk3gv94TptZbX7xmz8WKFfCXZ5fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD6h2NTb8-8nSuaa6eQNYBFk3gv94TptZbX7xmz8WKFfCXZ5fg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Shaojie Sun <shaojie.sun@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Patch Tracking <patches@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@linaro.org>, John Stultz <john.stultz@linaro.org>, Olof Johansson <olof@lixom.net>, Mike Turquette <mturquette@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 16 October 2013, Haojian Zhuang wrote:
> > If you do that, it probably makes sense to move the clock controller under here
> > as well.
> Could I keep them into hi3620-clk.dtsi? Since both hi3620.dtsi &
> hi3620-clk.dtsi are not small, merge them together only make people
> reading hard.

Yes, of course. The location in the tree is independent of what file they
are in. I was just suggesting to have the "clocks" node under "amba".

	Arnd
