From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH v3 00/11] clk: imx8: add new clock binding for better pm
 support
Date: Thu, 25 Jul 2019 20:48:47 +0800
Message-ID: <CAA+hA=TkrwzWbJQu7Cc6njdQSP--u=Zf+=FcPg-wCZ=rRXoRuQ@mail.gmail.com>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: devicetree <devicetree@vger.kernel.org>, sboyd@kernel.org, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Rob & Stephen & Shawn,

Could you help review this patchset?
We're pretty stuck here for a long time and a lot continued work are blocked.
We really need your kind help.

The related DT patches could be found here:
https://patchwork.kernel.org/cover/11046341/

Regards
Aisheng

On Tue, Jul 16, 2019 at 11:23 PM Dong Aisheng <aisheng.dong@nxp.com> wrote:
>
> This is a follow up of this patch series.
> https://patchwork.kernel.org/cover/10924029/
> [V2,0/2] clk: imx: scu: add parsing clocks from device tree support
>
> This patch series is a preparation for the MX8 Architecture improvement.
> As for IMX SCU based platforms like MX8QM and MX8QXP, they are comprised
> of a couple of SS(Subsystems) while most of them within the same SS
> can be shared. e.g. Clocks, Devices and etc.
>
> However, current clock binding is using SW IDs for device tree to use
> which can cause troubles in writing the common <soc>-ss-xx.dtsi file for
> different SoCs.
>
> This patch series aims to introduce a new binding which is more close to
> hardware and platform independent and can makes us write a more general
> drivers for different SCU based SoCs.
>
> Another important thing is that on MX8, each Clock resource is associated
> with a power domain. So we have to attach that clock device to the power
> domain in order to make it work properly. Further more, the clock state
> will be lost when its power domain is completely off during suspend/resume,
> so we also introduce the clock state save&restore mechanism.
>
> ChangeLog:
> v2->v3:
>  * change scu clk into two cells binding
>  * add clk pm patches to ease the understand of the changes
> v1->v2:
>  * SCU clock changed to one cell clock binding inspired by arm,scpi.txt
>    Documentation/devicetree/bindings/arm/arm,scpi.txt
>  * Add required power domain property
>  * Dropped PATCH 3&4 first, will send the updated version accordingly
>    after the binding is finally determined,
>
> Dong Aisheng (11):
>   dt-bindings: firmware: imx-scu: new binding to parse clocks from
>     device tree
>   dt-bindings: clock: imx-lpcg: add support to parse clocks from device
>     tree
>   clk: imx: scu: add two cells binding support
>   clk: imx: scu: bypass cpu power domains
>   clk: imx: scu: allow scu clk to take device pointer
>   clk: imx: scu: add runtime pm support
>   clk: imx: scu: add suspend/resume support
>   clk: imx: imx8qxp-lpcg: add parsing clocks from device tree
>   clk: imx: lpcg: allow lpcg clk to take device pointer
>   clk: imx: clk-imx8qxp-lpcg: add runtime pm support
>   clk: imx: lpcg: add suspend/resume support
>
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt  |  12 +-
>  .../devicetree/bindings/clock/imx8qxp-lpcg.txt     |  34 +++-
>  drivers/clk/imx/clk-imx8qxp-lpcg.c                 | 103 ++++++++++
>  drivers/clk/imx/clk-imx8qxp.c                      |   9 +-
>  drivers/clk/imx/clk-lpcg-scu.c                     |  41 +++-
>  drivers/clk/imx/clk-scu.c                          | 216 ++++++++++++++++++++-
>  drivers/clk/imx/clk-scu.h                          |  50 ++++-
>  include/dt-bindings/firmware/imx/rsrc.h            |  17 ++
>  8 files changed, 452 insertions(+), 30 deletions(-)
>
> --
> 2.7.4
>
