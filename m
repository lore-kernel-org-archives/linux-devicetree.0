From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v4 1/2] clk: pxa: export 32kHz PLL
Date: Thu, 05 Jul 2018 07:34:10 +0200
Message-ID: <87d0w2gsa5.fsf@belgarion.home>
References: <20180627194124.26366-1-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180627194124.26366-1-robert.jarzmik@free.fr> (Robert Jarzmik's
 message of "Wed, 27 Jun 2018 21:41:23 +0200")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Robert Jarzmik <robert.jarzmik@free.fr> writes:

> This clock is especially used by the RTC driver, so export it so that
> devicetree users can use it.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
> Since v2: fix missing parenthesis in clk-pxa25x.c and clk-pxa3xx.c

Hi Michael and Stephen,

Could you have a look please ?

Cheers.

--
Robert
