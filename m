From: Jagan Teki <jagan@openedev.com>
Subject: Re: [PATCH v7 0/5] ARM: dts: imx6q: Add Engicam i.CoreM6 dts
Date: Tue, 18 Oct 2016 17:30:28 +0530
Message-ID: <CAD6G_RQyLtgJw=djPTmY5t7UVwzuZpj0xM0HjchLQjq7P5hMOg@mail.gmail.com>
References: <1476437243-13297-1-git-send-email-jteki@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1476437243-13297-1-git-send-email-jteki@openedev.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jagan Teki <jteki@openedev.com>, Michael Trimarchi <michael@amarulasolutions.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Fri, Oct 14, 2016 at 2:57 PM, Jagan Teki <jteki@openedev.com> wrote:
> This is series add dts support for Engicam I.Core M6 qdl modules. just
> rebased on top of linux-next of previous set[1].
>
> [1] http://www.spinics.net/lists/kernel/msg2358233.html
>
> Jagan Teki (5):
>   ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual initial support
>   ARM: dts: imx6q: Add Engicam i.CoreM6 DualLite/Solo initial support
>   ARM: dts: imx6qdl-icore: Add usbhost support
>   ARM: dts: imx6qdl-icore: Add usbotg support
>   ARM: dts: imx6qdl-icore: Add FEC support
>
>  arch/arm/boot/dts/Makefile           |   2 +
>  arch/arm/boot/dts/imx6dl-icore.dts   |  59 ++++++++
>  arch/arm/boot/dts/imx6q-icore.dts    |  59 ++++++++
>  arch/arm/boot/dts/imx6qdl-icore.dtsi | 271 +++++++++++++++++++++++++++++++++++
>  4 files changed, 391 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6dl-icore.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-icore.dts
>  create mode 100644 arch/arm/boot/dts/imx6qdl-icore.dtsi

Can you pick this series?

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
