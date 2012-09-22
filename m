From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2] spi/pl022: Devicetree support w/o platform data
Date: Sat, 22 Sep 2012 12:14:18 -0400
Message-ID: <20120922161418.GW4495@opensource.wolfsonmicro.com>
References: <1347976433-1176-1-git-send-email-stigge@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1347976433-1176-1-git-send-email-stigge@antcom.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: arnd@arndb.de, grant.likely@secretlab.ca, linus.walleij@linaro.org, lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, STEricsson_nomadik_linux@list.st.com, devicetree-discuss@lists.ozlabs.org, aletes.xgr@gmail.com, kevin.wells@nxp.com, srinivas.bakki@nxp.com
List-Id: devicetree@vger.kernel.org

On Tue, Sep 18, 2012 at 03:53:53PM +0200, Roland Stigge wrote:
> Even with devicetree support, we needed platform data to provide some data,
> leading to mixed device tree and platform data. This patch makes it possible to
> provide all that information via device tree. Now, the data must be provided
> via platform data _or_ device tree completely.

Applied, thanks.
