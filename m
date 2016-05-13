From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [RESEND PATCH 2/2 v6] arc: axs10x: Add DT bindings for I2S PLL
 Clock
Date: Fri, 13 May 2016 18:40:15 +0530
Message-ID: <5735D237.1060700@synopsys.com>
References: <cover.1461258787.git.joabreu@synopsys.com>
 <e98c3f738b3a8f6755793959d89b4e43c9410fb1.1461258787.git.joabreu@synopsys.com>
 <57305472.2000507@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57305472.2000507@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: linux-clk@vger.kernel.org, Carlos Palminha <CARLOS.PALMINHA@synopsys.com>, Rob Herring <robh@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 09 May 2016 02:42 PM, Jose Abreu wrote:
> Can you apply this to arc-next? Main driver was already merged into clk-next. We
> still have to check how to deal with the parent clock frequency that will change
> in the next firmware release.

Done ! although note that this might *not* be bisectable if this goes ahead of
driver in 4.7-rc1 !
