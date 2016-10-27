From: Jagan Teki <jagan@openedev.com>
Subject: Re: [PATCH v8 0/3] ARM: dts: imx6q: Add Engicam i.CoreM6 dts
Date: Thu, 27 Oct 2016 14:17:19 +0530
Message-ID: <CAD6G_RRHcyyJ-ibB1yazrOaDGndPLmJWXqXgC=r=2W7Ya0fmrw@mail.gmail.com>
References: <1477037153-20484-1-git-send-email-jteki@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1477037153-20484-1-git-send-email-jteki@openedev.com>
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
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Michael Trimarchi <michael@amarulasolutions.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Fri, Oct 21, 2016 at 1:35 PM, Jagan Teki <jteki@openedev.com> wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
>
> This is series add dts support for Engicam I.Core M6 qdl modules. just
> rebased on top of linux-next.
>
> Jagan Teki (3):
>   ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual initial support
>   ARM: dts: imx6q: Add Engicam i.CoreM6 DualLite/Solo initial support
>   ARM: dts: imx6qdl-icore: Add FEC support
>
>  arch/arm/boot/dts/Makefile           |   2 +
>  arch/arm/boot/dts/imx6dl-icore.dts   |  59 ++++++++
>  arch/arm/boot/dts/imx6q-icore.dts    |  59 ++++++++
>  arch/arm/boot/dts/imx6qdl-icore.dtsi | 265 +++++++++++++++++++++++++++++++++++
>  4 files changed, 385 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6dl-icore.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-icore.dts
>  create mode 100644 arch/arm/boot/dts/imx6qdl-icore.dtsi

Please let me know if you have any inputs on this?

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
