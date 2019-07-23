From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] arm: dts: imx6qdl: add gpio expander pca9535
Date: Tue, 23 Jul 2019 16:02:35 +0800
Message-ID: <20190723080234.GO15632@dragon>
References: <20190719104615.5329-1-gilles.doffe@savoirfairelinux.com>
 <20190722075341.e4ve45rneusiogtk@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190722075341.e4ve45rneusiogtk@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Gilles DOFFE <gilles.doffe@savoirfairelinux.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, rennes@savoirfairelinux.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, jerome.oufella@savoirfairelinux.com, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 22, 2019 at 09:53:41AM +0200, Marco Felsch wrote:
> Hi Gilles,
> 
> can you adapt the patch title, I assumed that the base dtsi is adding a
> gpio-expander which makes no sense.

More specifically, the prefix should be something like:

  'ARM: dts: imx6qdl-rex: ...'

Shawn
