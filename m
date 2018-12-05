From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: mediatek: fix the PCIe MAC clock parent
Date: Wed, 05 Dec 2018 12:30:28 -0800
Message-ID: <154404182868.88331.17985605359797731500@swboyd.mtv.corp.google.com>
References: <2e828830d051ae641cfd55a6590cb243539d6ca8.1543991319.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2e828830d051ae641cfd55a6590cb243539d6ca8.1543991319.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Weijie Gao <weijie.gao@mediatek.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

Quoting Ryder Lee (2018-12-04 22:41:10)
> The PCIe function doesn't work as the clock tree of MAC layer is wrong.
> Hence fix the clock table.
> =

> Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---

Applied to clk-next
