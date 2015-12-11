From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/3] ARM: dts: rockchip: correct the name of REG8 for rk3288-evb-act8846
Date: Fri, 11 Dec 2015 12:33:24 +0100
Message-ID: <5012918.BpMjH3m3af@diego>
References: <1449726399-12507-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449726399-12507-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Chris

Am Donnerstag, 10. Dezember 2015, 13:46:37 schrieb Chris Zhong:
> According to the schematic, the name of REG8 should be vcc_tp, rather
> than vcca_tp.
> 
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>

applied all 3 to my dts32 branch for 4.5
[after making ARM in patch3 upper case ;-) ]


Thanks for keeping both board variants in sync
Heiko
