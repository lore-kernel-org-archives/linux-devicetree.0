From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] clk: Move vendor's Kconfig into CCF menu section
Date: Thu, 28 Jan 2016 12:27:52 +0100
Message-ID: <1934810.PcLUxJgllT@wuerfel>
References: <1453971537-5510-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453971537-5510-1-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Sascha Hauer <kernel@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 28 January 2016 16:58:57 James Liao wrote:
> Move all vendor's Kconfig into CCF menu section to prevent
> new drivers putting their Kconfig files in a wrong place.
> 
> Some Kconigs need to modify at the same time to avoid build
> warnings.
> 
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> ---
> This patch is based on v4.5-rc1.
> 
> changes since v1:
> - Modify s3c24xx and samsung's Kconfig to avoid build warngings.
> 
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>
