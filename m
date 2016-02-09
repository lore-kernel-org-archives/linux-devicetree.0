From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v7 6/9] ARM: dts: add pl330-broken-no-flushp quirk for rk3036 SoCs
Date: Tue, 09 Feb 2016 18:29:50 +0100
Message-ID: <1488837.V2iXLjBOmC@phil>
References: <1453460812-8498-1-git-send-email-wxt@rock-chips.com> <1453460812-8498-7-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453460812-8498-7-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: Vinod Koul <vinod.koul@intel.com>, Sonny Rao <sonnyrao@chromium.org>, shawn.lin@rock-chips.com, dianders@chromium.org, linux-rockchip@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 22. Januar 2016, 19:06:49 schrieb Caesar Wang:
> Pl330 integrated in rk3036 platform that doesn't support
> DMAFLUSHP function. So we add 'arm,pl330-broken-no-flushp' quirk
> for rk3036.
> 
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>

applied the 3 (4/9, 5/9, 6/9) dts patches to my dts32 branch for 4.6
(after fixing the patch subjects to match the general style-convention)
