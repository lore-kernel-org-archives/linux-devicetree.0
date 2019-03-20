From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 0/6] ARM: dts: tq imx7 evaluation board
Date: Wed, 20 Mar 2019 17:12:00 +0800
Message-ID: <20190320091159.GI4980@dragon>
References: <20190304165630.18225-1-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190304165630.18225-1-bruno.thomsen@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: markus.niebel@tq-group.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 04, 2019 at 05:56:24PM +0100, Bruno Thomsen wrote:
> This patch series is an effort to get mainline kernel support for TQ
> boards with i.MX7 SoCs and is based on the vendor BSP. Products based
> on these TQMa7 modules such as smart grid infrastructure will be sold
> for many years with an expected field lifetime of up to two decades.
> During this long lifetime they need to receive security patches and
> new in-kernel security features. The typical device of this type does
> not use audio and video, so it has not been a focus area. This however
> could be worked on in the future if someone desire that functionality.
> 
> The following device trees has been tested on a 4.19 mainline kernel
> together with U-Boot 2019.01.
> 
> Working/tested:
> USB
> Ethernet
> SD
> Console
> Buttons
> 
> Not working/tested:
> Sound
> Video
> 
> No changes to MAINTAINERS are needed IMHO.
> 
> Bruno Thomsen (6):
>   dt-bindings: add vendor prefix for TQ Systems GmbH
>   dt-bindings: fsl: add compatible for i.MX7S generic board
>   dt-bindings: tq: add compatible for i.MX7 boards
>   ARM: dts: tq imx7 common board support
>   ARM: dts: tq imx7s board support
>   ARM: dts: tq imx7d board support

Please copy the following reviewers for new posting.

R:      Pengutronix Kernel Team <kernel@pengutronix.de>
R:      Fabio Estevam <festevam@gmail.com>

Shawn
