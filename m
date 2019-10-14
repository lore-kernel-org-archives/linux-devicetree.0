From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: vf610-zii-scu4-aib: Specify
 'i2c-mux-idle-disconnect'
Date: Mon, 14 Oct 2019 19:37:06 +0800
Message-ID: <20191014113704.GO12262@dragon>
References: <20191004054115.26082-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191004054115.26082-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, Cory Tusar <cory.tusar@zii.aero>, Jeff White <jeff.white@zii.aero>, Rick Ramstetter <rick@anteaterllc.com>, Lucas Stach <l.stach@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 03, 2019 at 10:41:15PM -0700, Andrey Smirnov wrote:
> Specify 'i2c-mux-idle-disconnect' for both I2C switches present on the
> board, since both are connected to the same parent bus and all of
> their children have the same I2C address.
> 
> Fixes: ca4b4d373fcc ("ARM: dts: vf610: Add ZII SCU4 AIB board")
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Cory Tusar <cory.tusar@zii.aero>
> Cc: Jeff White <jeff.white@zii.aero>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> Shawn:
> 
> If this is possible, I'd like this one to go into 5.4.

Okay, applied as fix.

Shawn
