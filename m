From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: vf610-zii-dev: enable vf610 builtin temp sensor
Date: Sun, 20 May 2018 20:56:24 +0800
Message-ID: <20180520125623.GY26863@dragon>
References: <20180516063921.10406-1-nikita.yoush@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180516063921.10406-1-nikita.yoush@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Healy <cphealy@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 16, 2018 at 09:39:21AM +0300, Nikita Yushchenko wrote:
> Vybrid has single internal temperature sensor connected to both internal
> ADC modules.
> 
> vf610-zii-dev already has ADC0 enabled. Now, to get temperature sensor
> captured by iio_hwmon driver, need to configure iio_hwmon node to use
> that ADC.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Applied, thanks.
