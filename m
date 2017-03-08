From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 3/4] soc/imx: add new GPC driver
Date: Wed, 8 Mar 2017 11:57:58 +0100
Message-ID: <20170308105756.GA17029@x250>
References: <20170217190246.14881-1-l.stach@pengutronix.de>
 <20170217190246.14881-3-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170217190246.14881-3-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: devicetree@vger.kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 17, 2017 at 08:02:45PM +0100, Lucas Stach wrote:
> This is an almost complete re-write of the previous GPC power gating control
> code found in the IMX architecture code. It supports both the old and the new
> DT binding, allowing more domains to be added later and generally makes the
> driver easier to extend, while keeping compatibility with existing DTBs.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

I applied #1 ~ #3, with #2 and #3 merged into one to avoid possible
git bisect issue.

Shawn
