From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] spi/pl022: Devicetree support w/o platform data
Date: Tue, 18 Sep 2012 23:22:28 +0200
Message-ID: <CACRpkdacODp0QTiZyBX46Bm61_98QN=X+GJJ7G44AXx9Eq2BHw@mail.gmail.com>
References: <1347976433-1176-1-git-send-email-stigge@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1347976433-1176-1-git-send-email-stigge@antcom.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: arnd@arndb.de, broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, STEricsson_nomadik_linux@list.st.com, devicetree-discuss@lists.ozlabs.org, aletes.xgr@gmail.com, kevin.wells@nxp.com, srinivas.bakki@nxp.com
List-Id: devicetree@vger.kernel.org

On Tue, Sep 18, 2012 at 3:53 PM, Roland Stigge <stigge@antcom.de> wrote:

> Even with devicetree support, we needed platform data to provide some data,
> leading to mixed device tree and platform data. This patch makes it possible to
> provide all that information via device tree. Now, the data must be provided
> via platform data _or_ device tree completely.
>
> Only in case of DMA where a callback specification is necessary (dma_filter()),
> platform data is the only option.
>
> Signed-off-by: Roland Stigge <stigge@antcom.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
