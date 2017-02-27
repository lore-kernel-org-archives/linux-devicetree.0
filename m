From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] reset: Add i.MX7 SRC reset driver
Date: Mon, 27 Feb 2017 14:54:08 -0600
Message-ID: <20170227205408.ajeu3stjpl45dnqf@rob-hp-laptop>
References: <20170221161331.17012-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170221161331.17012-1-andrew.smirnov@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 21, 2017 at 08:13:31AM -0800, Andrey Smirnov wrote:
> Add reset controller driver exposing various reset faculties,
> implemented by System Reset Controller IP block.
> 
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
> 
> Changes since v3 (see [v3]):
> 
> 	- Convert code IMX7_RESET_PCIEPHY to change G_RST and BTNRST
>           simultaneously to make all resets be representable as
>           signal->bit in signal->offset register
> 
> 	- Convert assert/deassert subroutines to be special cases of a
>           common reset subroutine
> 
> Changes since v2 (see [v2]):
> 
> 	- Fix typos
> 
> 	- Kconfig/Makefile chagnes account for alphabetical sorting of
>           those files
> 
> 	- Remove redundant includes
> 
> 	- Make use of regmap_attach_dev and avoid storing refernce to
>           struct *dev in private data
> 
> 	- Change code and headers to expose almost all of the reset
>           related bits in SRC IP block
> 
> Changes since v1 (see [v1]):
> 
> 	- Various small DT bindings description fixes as per feedback
>           from Rob Herring
> 
> 
> [v1] https://lkml.org/lkml/2017/2/6/554
> [v2] https://lkml.org/lkml/2017/2/13/488
> [v3] https://lkml.org/lkml/2017/2/20/344
> 
> 
>  .../devicetree/bindings/reset/fsl,imx7-src.txt     |  47 ++++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/reset/Kconfig                              |   8 ++
>  drivers/reset/Makefile                             |   2 +
>  drivers/reset/reset-imx7.c                         | 158 +++++++++++++++++++++
>  include/dt-bindings/reset/imx7-reset.h             |  62 ++++++++
>  5 files changed, 277 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
>  create mode 100644 drivers/reset/reset-imx7.c
>  create mode 100644 include/dt-bindings/reset/imx7-reset.h
