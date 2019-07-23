From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8mq: fix SAI compatible
Date: Tue, 23 Jul 2019 07:37:00 +0000
Message-ID: <946f4bb2c0843588d3fc011080c2d331111fabc7.camel@nxp.com>
References: <20190717095436.28154-1-l.stach@pengutronix.de>
 <20190723073342.GG15632@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190723073342.GG15632@dragon>
Content-Language: en-US
Content-ID: <D2CB440358F6AC448D3C8042E058D4AF@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-07-23 at 15:33 +0800, Shawn Guo wrote:
> Add Daniel for comment.
> 
> On Wed, Jul 17, 2019 at 11:54:36AM +0200, Lucas Stach wrote:
> > The i.MX8M SAI block is not compatible with the i.MX6SX one, as the
> > register layout has changed due to two version registers being
> > added
> > at the beginning of the address map. Remove the bogus compatible.
> > 
> > Fixes: 8c61538dc945 "arm64: dts: imx8mq: Add SAI2 node"
> 
> The format should be the following.  I can fix it when applying
> though.
> 
> Fixes: 8c61538dc945 ("arm64: dts: imx8mq: Add SAI2 node")
> 
> Shawn
> 
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
