From: boris brezillon <b.brezillon@overkiz.com>
Subject: Re: [PATCH v5 06/17] clk: at91: add PMC pll clocks
Date: Thu, 28 Nov 2013 09:34:10 +0100
Message-ID: <52970002.3020405@overkiz.com>
References: <1384289513-3068-1-git-send-email-b.brezillon@overkiz.com>
 <1384293439-4525-1-git-send-email-b.brezillon@overkiz.com>
 <20131127214843.16819.59481@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131127214843.16819.59481@quantum>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Turquette <mturquette@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Ludovic Desroches <ludovic.desroches@atmel.com>, Josh Wu <josh.wu@atmel.com>, Richard Genoud <richard.genoud@gmail.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mike,

On 27/11/2013 22:48, Mike Turquette wrote:
> Quoting Boris BREZILLON (2013-11-12 13:57:19)
>> +static const struct clk_ops pll_ops = {
>> +       .prepare = clk_pll_prepare,
>> +       .is_prepared = clk_pll_is_ready,
>> +       .disable = clk_pll_disable,
>> +       .is_enabled = clk_pll_is_ready,
>> +       .recalc_rate = clk_pll_recalc_rate,
>> +       .round_rate = clk_pll_round_rate,
>> +       .set_rate = clk_pll_set_rate,
>> +};
> Hi Boris,
>
> It is a bit strange to see only a .prepare and .disable callback
> populated. What happens if a driver calls clk_disable and then
> clk_enable? You clock will still be disabled in hardware.

Oops, I haven't thought about that.
I did this because the clk_pll_disable does not sleep, but this is a big 
mistake :-(.

I'll fix this.

Thanks.

Best Regards,

Boris
> Regards,
> Mike
