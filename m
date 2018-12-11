From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] reset: imx7: Add support for i.MX8MQ IP block
 variant
Date: Tue, 11 Dec 2018 16:43:49 -0600
Message-ID: <20181211224349.GA30397@bogus>
References: <20181128043738.12714-1-andrew.smirnov@gmail.com>
 <20181128043738.12714-3-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181128043738.12714-3-andrew.smirnov@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com, p.zabel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>, cphealy@gmail.com, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Tue, Nov 27, 2018 at 08:37:37PM -0800, Andrey Smirnov wrote:
> Add bits and pieces needed to support IP block variant found on
> i.MX8MQ SoCs.
> 
> Cc: p.zabel@pengutronix.de
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: cphealy@gmail.com
> Cc: l.stach@pengutronix.de
> Cc: Leonard Crestez <leonard.crestez@nxp.com>
> Cc: "A.s. Dong" <aisheng.dong@nxp.com>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-imx@nxp.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  drivers/reset/Kconfig                    |   2 +-
>  drivers/reset/reset-imx7.c               | 106 +++++++++++++++++++++++
>  include/dt-bindings/reset/imx8mq-reset.h |  64 ++++++++++++++

This goes in the binding patch.

>  3 files changed, 171 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/reset/imx8mq-reset.h
