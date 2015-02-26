From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH v5 1/6] clk: add of_clk_get_parent_rate function
Date: Wed, 25 Feb 2015 22:13:15 -0800
Message-ID: <54EEB97B.6080006@broadcom.com>
References: <rjui@broadcom.com>
 <1423097705-22939-1-git-send-email-rjui@broadcom.com>
 <1423097705-22939-2-git-send-email-rjui@broadcom.com>
 <20150226055406.GB28214@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150226055406.GB28214@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, bcm-kernel-feedback-list@broadcom.com, Stephen Boyd <sboyd@codeaurora.org>, Scott Branden <sbranden@broadcom.com>, Matt Porter <mporter@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Anatol Pomazau <anatol@google.com>, Dmitry Torokhov <dtor@google.com>, Alex Elder <elder@linaro.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Sascha,

On 2/25/2015 9:54 PM, Sascha Hauer wrote:
> Hi Ray,
> 
> On Wed, Feb 04, 2015 at 04:55:00PM -0800, Ray Jui wrote:
>> Sometimes a clock needs to know the rate of its parent before itself is
>> registered to the framework. An example is that a PLL may need to
>> initialize itself to a specific VCO frequency, before registering to the
>> framework. The parent rate needs to be known, for PLL multipliers and
>> divisors to be configured properly.
>>
>> Introduce helper function of_clk_get_parent_rate, which can be used to
>> obtain the parent rate of a clock, given a device node and index.
> 
> I can't see how this patch helps you. First it's not guaranteed that
> the parent is already registered, what do you do in this case?

In the case when clock parent is not found, as you can see from the
code, it simply returns zero, just like other clk get rate APIs.

I thought the order of clock registration is based on order of the clock
nodes in device tree. It makes sense to me to declare the parent clock
before a child clock, so it's guaranteed that the parent is registered
before the child.

> Then the clock framework doesn't require that you initialize the PLL
> before registering. That can be done in the clk ops later.

Sure it's not mandatory. But what's wrong with me choosing to initialize
the PLL clock to a known frequency before registering it to the framework?

Ray
