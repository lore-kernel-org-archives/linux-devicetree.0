From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 06/18] ARM: imx: clk-gate2: allow custom gate
 configuration
Date: Thu, 31 Mar 2016 10:59:54 -0700
Message-ID: <f21855561b6cbf2d2a57508ed9470ed0@agner.ch>
References: <1457576219-7971-1-git-send-email-stefan@agner.ch>
 <1457576219-7971-7-git-send-email-stefan@agner.ch>
 <20160331113728.GA18833@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160331113728.GA18833@tiger>
Sender: linux-clk-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, kernel@pengutronix.de, sergeimir@emcraft.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2016-03-31 04:37, Shawn Guo wrote:
> On Wed, Mar 09, 2016 at 06:16:47PM -0800, Stefan Agner wrote:
>> The 2-bit gates found i.MX and Vybrid SoC support different clock
>> configuration:
>>
>> 0b00: clk disabled
>> 0b01: clk enabled in RUN mode but disabled in WAIT and STOP mode
>> 0b10: clk enabled in RUN, WAIT and STOP mode (only Vybrid)
>> 0b11: clk enabled in RUN and WAIT mode
>>
>> For some clocks, we might want to configure different behaviour,
>> e.g. a memory clock should be on even in STOP mode. Add a new
>> function imx_clk_gate2_cgr which allow to configure specific
>> gate values through the cgr_val parameter.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> It's not appropriate to use 'ARM:' as subject prefix any more, since
> clock drivers had been moved to drivers/clk.

Agreed. Evidence on how long I dragged those patches in my own tree :-/

> 
> I applied patch 6 ~ 9 with updating the subject prefix as below.
> 
> clk: imx: vf610: add suspend/resume support
> clk: imx: vf610: add WKPU unit
> clk: imx: vf610: leave DDR clock on
> clk: imx: clk-gate2: allow custom gate configuration

Thanks!

--
Stefan

