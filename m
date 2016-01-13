From: James Liao <jamesjj.liao@mediatek.com>
Subject: Re: [PATCH v3 0/6] Add clock support for Mediatek MT2701
Date: Wed, 13 Jan 2016 11:01:46 +0800
Message-ID: <1452654106.2657.0.camel@mtksdaap41>
References: <1452587470-61506-1-git-send-email-jamesjj.liao@mediatek.com>
	 <5694D106.2030009@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <5694D106.2030009@openwrt.org>
Sender: linux-clk-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi John,

On Tue, 2016-01-12 at 11:10 +0100, John Crispin wrote:
> Hi James,
> 
> On 12/01/2016 09:31, James Liao wrote:
> > This patchset is based on 4.4-rc7, add clock and reset controller support
> > for Mediatek MT2701.
> > 
> > This patchset also refined makefile and Kconfig to support configurable
> > multiple SoC clock support.
> > 
> > changes since v2:
> > - Fix ethsys definition.
> > - Replace read-modify-write with regmap_update_bits() in clock operations.
> > - Move mt2701-resets.h to include/dt-bindings/reset/.
> > - Add hifsys reset patch from John Crispin.
> 
> thanks for folding the fixup.
> 
> i have been testing your V2 on MT7623 for several days now and updated
> to V3 this morning which works just as well. feel free to add
> 
> Tested-by: John Crispin <blogic@openwrt.org>

Thanks for your help.


Best regards,

James



