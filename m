From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 0/3] clk: stm32: Add clock driver for STM32F4[23]xxx
 devices
Date: Mon, 22 Jun 2015 15:48:32 -0700
Message-ID: <20150622224832.GI22132@codeaurora.org>
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org>
 <1433966978-24422-1-git-send-email-daniel.thompson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1433966978-24422-1-git-send-email-daniel.thompson@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linaro-kernel@lists.linaro.org, Mike Turquette <mturquette@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, patches@linaro.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Kamil Lulko <rev13@wp.pl>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Andreas Farber <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 06/10, Daniel Thompson wrote:
> This patchset implements a clock driver for STM32F42xxx and STM32F43xxx
> series devices. It supports decoding the state configured by the
> bootloader (PLL, clock select, bus dividers) and all the gates clocks.
> It does not currently support the I2S and SAI PLLs.
> 
> Relies on "Add support to STMicroeletronics STM32 family" v9 by Maxime
> Coquelin: http://thread.gmane.org/gmane.linux.kernel/1961049 .
> 

I applied 1 and 2. Looks like #3 should go through arm-soc at
some later time?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
