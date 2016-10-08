From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] bindings: add compatible "fsl, ls1043-ucc-hdlc" to
 bindings
Date: Sat, 8 Oct 2016 17:22:41 -0500
Message-ID: <57f99974.920b9d0a.5b72e.d3aa@mx.google.com>
References: <1475034038-7217-1-git-send-email-qiang.zhao@nxp.com>
 <1475034038-7217-3-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2603217065821997352=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1475034038-7217-3-git-send-email-qiang.zhao@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Zhao Qiang <qiang.zhao@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, xiaobo.xie@nxp.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============2603217065821997352==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Length: 870

On Wed, Sep 28, 2016 at 11:40:38AM +0800, Zhao Qiang wrote:
> Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> ---
>  Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt
> index 03c7416..325e3e2 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt
> @@ -45,7 +45,7 @@ Example:
>  * HDLC
>  
>  Currently defined compatibles:
> -- fsl,ucc-hdlc
> +- "fsl,ucc-hdlc", "fsl,ls1043-ucc-hdlc"

What's the relationship of these 2 compatibles? Both should be specified 
for LS1043 or ...? The former only applies to certain SoCs? Rework this 
text to answer these questions.

Rob

>From robh@kernel.org Sat Oct  8 17:24:05 2016
From: Rob Herring <robh@kernel.org>
To: Meng Yi <meng.yi@nxp.com>
Cc: stefan@agner.ch, mark.rutland@arm.com, daniel@ffwll.ch,
	ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5] drm/fsl-dcu: Implement gamma_lut atomic crtc
 properties
Message-ID: <20161008222405.GA9413@rob-hp-laptop>
References: <1475051069-24452-1-git-send-email-meng.yi@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475051069-24452-1-git-send-email-meng.yi@nxp.com>
X-Mutt-References: <1475051069-24452-1-git-send-email-meng.yi@nxp.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 17:26:22 -0500
Status: RO
Content-Length: 1236
Lines: 28

On Wed, Sep 28, 2016 at 04:24:29PM +0800, Meng Yi wrote:
> Gamma correction is optional and can be used to adjust the color
> output values to match the gamut of a particular TFT LCD panel
> 
> Split the DCU regs into "regs", "palette", "gamma" and "cursor".
> Create a second regmap for gamma memory space using little endian.
> The registers after the first address space are not accessed yet,
> hence new device trees would even work with old kernels. Just new
> kernel need the new format so we can access the separate gamma
> reg space.
> 
> Suggested-by: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Meng Yi <meng.yi@nxp.com>
> ---
> Changes since V1:
> -created a second regmap for gamma
> -updated the DCU DT binding
> -removed Kconfig for gamma and enable gamma when valid data filled.
> -extended and simplified comment lines.
> ---
>  .../devicetree/bindings/display/fsl,dcu.txt        | 12 +++++++-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c         | 33 ++++++++++++++++++++
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          | 35 +++++++++++++++++++++-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h          |  7 +++++
>  4 files changed, 85 insertions(+), 2 deletions(-)

>From robh@kernel.org Sat Oct  8 17:28:02 2016
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, kishon@ti.com, carlo@caione.org,
	khilman@baylibre.com, mark.rutland@arm.com, johnyoun@synopsys.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] Documentation: dt-bindings: update the
 meson-usb2-phy example
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20161001121900.1168-1-martin.blumenstingl@googlemail.com>
 <20161001121900.1168-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161001121900.1168-2-martin.blumenstingl@googlemail.com>
X-Mutt-References: <20161001121900.1168-2-martin.blumenstingl@googlemail.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 17:28:02 -0500
Status: RO
Content-Length: 565
Lines: 13

On Sat, Oct 01, 2016 at 02:18:58PM +0200, Martin Blumenstingl wrote:
> Update the example so the node name uses a dash (instead of an
> underscore) as per convention.
> Additionally it updates the example register offset to a real example
> (the old value was taken from a draft where there was an additional PHY
> bus).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/phy/meson-usb2-phy.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

>From robh@kernel.org Sat Oct  8 17:28:42 2016
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, kishon@ti.com, carlo@caione.org,
	khilman@baylibre.com, mark.rutland@arm.com, johnyoun@synopsys.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] Documentation: dt-bindings: rename meson-usb2-phy
 to meson8b-usb2-phy
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20161001121900.1168-1-martin.blumenstingl@googlemail.com>
 <20161001121900.1168-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161001121900.1168-3-martin.blumenstingl@googlemail.com>
X-Mutt-References: <20161001121900.1168-3-martin.blumenstingl@googlemail.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 17:28:42 -0500
Status: RO
Content-Length: 717
Lines: 13

On Sat, Oct 01, 2016 at 02:18:59PM +0200, Martin Blumenstingl wrote:
> The corresponding driver only supports the USB PHY on Meson8b and GXBB
> SoCs. Newer SoC versions are using a different USB PHY implementation,
> which will mean that a new driver is required. Thus make sure that our
> naming is specific enough so it does not conflict with upcoming drivers.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/phy/{meson-usb2-phy.txt => meson8b-usb2-phy.txt}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/phy/{meson-usb2-phy.txt => meson8b-usb2-phy.txt} (95%)

Acked-by: Rob Herring <robh@kernel.org>

>From robh@kernel.org Sat Oct  8 17:32:40 2016
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: add support for performing fake doorbell
Message-ID: <20161008223240.GA13162@rob-hp-laptop>
References: <20161001215817.25384-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20161001215817.25384-1-zajec5@gmail.com>
X-Mutt-References: <20161001215817.25384-1-zajec5@gmail.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 17:32:46 -0500
Status: RO
Content-Length: 1653
Lines: 36

On Sat, Oct 01, 2016 at 11:58:10PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Broadcom's Northstar XHCI controllers seem to need a special start
> procedure to work correctly. There isn't any official documentation on
> this, the problem is that controller doesn't detect any connected
> devices with default setup. Moreover connecting USB device to controller
> that doesn't run properly can cause SoC's watchdog issues.
> 
> A workaround that was successfully tested on multiple devices is to
> perform a fake doorbell. This patch adds code for doing that and a DT
> binding enabling it.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt |  2 +
>  drivers/usb/host/xhci-plat.c                       |  6 +++
>  drivers/usb/host/xhci.c                            | 63 ++++++++++++++++++++--
>  drivers/usb/host/xhci.h                            |  1 +
>  4 files changed, 69 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index 966885c..ce01b7f 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -26,6 +26,8 @@ Required properties:
>  Optional properties:
>    - clocks: reference to a clock
>    - usb3-lpm-capable: determines if platform is USB3 LPM capable
> +  - usb3-fake-doorbell: determines if controller requires a fake doorbell when
> +			starting it

You should use Northstar XHCI compatible string to enable this. Then the 
DT doesn't need updating.

Rob

>From robh@kernel.org Sat Oct  8 17:37:05 2016
From: Rob Herring <robh@kernel.org>
To: Jeremy McNicoll <jmcnicol@redhat.com>
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de,
	bjorn.andersson@linaro.org, git@kchr.de, jeremymc@redhat.com,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC V2 PATCH 01/12] msm8994 clocks: global clock support Global
 clock support for the msm8994 SOC.
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-2-git-send-email-jmcnicol@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1475375919-618-2-git-send-email-jmcnicol@redhat.com>
X-Mutt-References: <1475375919-618-2-git-send-email-jmcnicol@redhat.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 17:37:05 -0500
Status: RO
Content-Length: 852
Lines: 22

On Sat, Oct 01, 2016 at 07:38:28PM -0700, Jeremy McNicoll wrote:
> From: Bastian K�cher <git@kchr.de>
> 
> The clock definition was ported from the Google 3.10 kernel tree to
> work with the latest kernel.
> 
> Signed-off-by: Bastian K�cher <mail@kchr.de>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt         |    2 +

>  include/dt-bindings/clock/qcom,gcc-msm8994.h       |  145 ++

It's preferred to but bindings in separate patches.

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/qcom/Kconfig                           |    9 +
>  drivers/clk/qcom/Makefile                          |    1 +
>  drivers/clk/qcom/gcc-msm8994.c                     | 2501 ++++++++++++++++++++
>  5 files changed, 2658 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-msm8994.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8994.h

>From robh@kernel.org Sat Oct  8 17:41:05 2016
From: Rob Herring <robh@kernel.org>
To: Jeremy McNicoll <jmcnicol@redhat.com>
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de,
	bjorn.andersson@linaro.org, git@kchr.de, jeremymc@redhat.com,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC V2 PATCH 04/12] dt-bindings: qcom: Add msm8992 bindings
Message-ID: <20161008224105.GA18534@rob-hp-laptop>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-5-git-send-email-jmcnicol@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475375919-618-5-git-send-email-jmcnicol@redhat.com>
X-Mutt-References: <1475375919-618-5-git-send-email-jmcnicol@redhat.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 17:41:09 -0500
Status: RO
Content-Length: 712
Lines: 24

On Sat, Oct 01, 2016 at 07:38:31PM -0700, Jeremy McNicoll wrote:
> Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.txt b/Documentation/devicetree/bindings/arm/qcom.txt
> index 3e24518..fc5d5ee 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.txt
> +++ b/Documentation/devicetree/bindings/arm/qcom.txt
> @@ -22,6 +22,7 @@ The 'SoC' element must be one of the following strings:
>  	msm8916
>  	msm8974
>  	msm8996
> +	msm8992

What about 8994 and 8994v2?

>  
>  The 'board' element must be one of the following strings:
>  
> -- 
> 2.6.1
> 

>From robh@kernel.org Sat Oct  8 17:44:03 2016
From: Rob Herring <robh@kernel.org>
To: Jeremy McNicoll <jmcnicol@redhat.com>
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de,
	bjorn.andersson@linaro.org, git@kchr.de, jeremymc@redhat.com,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC V2 PATCH 05/12] msm8992: defconfig updates to support initrd
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-6-git-send-email-jmcnicol@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475375919-618-6-git-send-email-jmcnicol@redhat.com>
X-Mutt-References: <1475375919-618-6-git-send-email-jmcnicol@redhat.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 17:44:03 -0500
Status: RO
Content-Length: 877
Lines: 29

On Sat, Oct 01, 2016 at 07:38:32PM -0700, Jeremy McNicoll wrote:
> Given the mimimal hardware support for msm8992 currently enable
> a reasonable sized initrd for booting.
> 
> Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 26dc69a..d8dace3 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -21,6 +21,9 @@ CONFIG_CGROUP_HUGETLB=y
>  # CONFIG_NET_NS is not set
>  CONFIG_SCHED_AUTOGROUP=y
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_BLK_DEV_RAM=y

I don't think this is needed. Isn't the option above here enough?

> +CONFIG_BLK_DEV_RAM_COUNT=y
> +CONFIG_BLK_DEV_RAM_SIZE=16384
>  CONFIG_KALLSYMS_ALL=y
>  # CONFIG_COMPAT_BRK is not set
>  CONFIG_PROFILING=y
> -- 
> 2.6.1
> 

>From robh@kernel.org Sat Oct  8 17:45:10 2016
From: Rob Herring <robh@kernel.org>
To: Jeremy McNicoll <jmcnicol@redhat.com>
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de,
	bjorn.andersson@linaro.org, git@kchr.de, jeremymc@redhat.com,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC V2 PATCH 03/12] msm8994 clocks: fix mapping
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-4-git-send-email-jmcnicol@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475375919-618-4-git-send-email-jmcnicol@redhat.com>
X-Mutt-References: <1475375919-618-4-git-send-email-jmcnicol@redhat.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 17:45:10 -0500
Status: RO
Content-Length: 926
Lines: 29

On Sat, Oct 01, 2016 at 07:38:30PM -0700, Jeremy McNicoll wrote:
> The paren_map is used for looking up which value to write into
> and the cmd_rcgr is for configuring the parent muxing so a change
>  2 to 5 means that the 3rd parent should be mux #5 rather than #2.
> 
> Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
> ---
>  drivers/clk/qcom/gcc-msm8994.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This should be squashed.

> 
> diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
> index 3897cfd..39b40d4 100644
> --- a/drivers/clk/qcom/gcc-msm8994.c
> +++ b/drivers/clk/qcom/gcc-msm8994.c
> @@ -50,7 +50,7 @@ static const char * const gcc_xo_gpll0[] = {
>  static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
>  	{ P_XO, 0 },
>  	{ P_GPLL0, 1 },
> -	{ P_GPLL4, 2 },
> +	{ P_GPLL4, 5 },
>  };
>  
>  static const char * const gcc_xo_gpll0_gpll4[] = {
> -- 
> 2.6.1
> 

>From robh@kernel.org Sat Oct  8 17:47:37 2016
From: Rob Herring <robh@kernel.org>
To: Jeremy McNicoll <jmcnicol@redhat.com>
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de,
	bjorn.andersson@linaro.org, git@kchr.de, jeremymc@redhat.com,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC V2 PATCH 09/12] arm64: dts: move Huawei Angler (Nexus 6P)
 to qcom directory
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-10-git-send-email-jmcnicol@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475375919-618-10-git-send-email-jmcnicol@redhat.com>
X-Mutt-References: <1475375919-618-10-git-send-email-jmcnicol@redhat.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 17:47:37 -0500
Status: RO
Content-Length: 769
Lines: 16

On Sat, Oct 01, 2016 at 07:38:36PM -0700, Jeremy McNicoll wrote:
> Given that this is a MSM SoC and not a specific vendor created
> SoC moving associated device tree files to qcom directory.
> 
> Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
> ---
>  arch/arm64/boot/dts/huawei/Makefile                             | 5 -----
>  arch/arm64/boot/dts/qcom/Makefile                               | 4 ++--
>  arch/arm64/boot/dts/{huawei => qcom}/msm8994-angler-rev-101.dts | 2 +-

What tree are you based on? There's no huawei dir in mainline. You need 
to rebase everything.

>  3 files changed, 3 insertions(+), 8 deletions(-)
>  delete mode 100644 arch/arm64/boot/dts/huawei/Makefile
>  rename arch/arm64/boot/dts/{huawei => qcom}/msm8994-angler-rev-101.dts (96%)

>From robh@kernel.org Sat Oct  8 17:50:56 2016
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: ath9k-devel@lists.ath9k.org, devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com,
	mcgrof@do-not-panic.com, mark.rutland@arm.com, kvalo@codeaurora.org,
	chunkeey@googlemail.com, arend.vanspriel@broadcom.com,
	julian.calaby@gmail.com, bjorn@mork.no, linux@rempel-privat.de,
	nbd@nbd.name
Subject: Re: [PATCH v7 1/3] Documentation: dt: net: add ath9k wireless device
 binding
Message-ID: <20161008225056.GA25449@rob-hp-laptop>
References: <20160906214623.20424-1-martin.blumenstingl@googlemail.com>
 <20161002214743.2263-1-martin.blumenstingl@googlemail.com>
 <20161002214743.2263-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161002214743.2263-2-martin.blumenstingl@googlemail.com>
X-Mutt-References: <20161002214743.2263-2-martin.blumenstingl@googlemail.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 17:50:58 -0500
Status: RO
Content-Length: 2055
Lines: 56

On Sun, Oct 02, 2016 at 11:47:41PM +0200, Martin Blumenstingl wrote:
> Add documentation how devicetree can be used to configure ath9k based
> devices.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/net/wireless/qca,ath9k.txt | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt b/Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt
> new file mode 100644
> index 0000000..9b58ede
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt
> @@ -0,0 +1,30 @@
> +* Qualcomm Atheros ath9k wireless devices
> +
> +This node provides properties for configuring the ath9k wireless device. The
> +node is expected to be specified as a child node of the PCI controller to
> +which the wireless chip is connected.
> +
> +Required properties:
> +- compatible: For PCI and PCIe devices this should be an identifier following
> +		the format as defined in "PCI Bus Binding to Open Firmware"
> +		Revision 2.1. One of the possible formats is "pciVVVV,DDDD"
> +		where VVVV is the PCI vendor ID and DDDD is PCI device ID.

Are there some known values you can document here? Like the one in the 
example.

> +- reg: Address and length of the register set for the device.
> +
> +Optional properties:
> +- qca,no-eeprom: Indicates that there is no physical EEPROM connected to the
> +			ath9k wireless chip (in this case the calibration /
> +			EEPROM data will be loaded from userspace using the
> +			kernel firmware loader).
> +- mac-address: See ethernet.txt in the parent directory
> +- local-mac-address: See ethernet.txt in the parent directory
> +
> +
> +In this example, the node is defined as child node of the PCI controller:
> +&pci0 {
> +	ath9k@168c,002d {

wifi@...

> +		compatible = "pci168c,002d";
> +		reg = <0x7000 0 0 0 0x1000>;
> +		qca,no-eeprom;
> +	};
> +};
> -- 
> 2.10.0
> 

>From robh@kernel.org Sat Oct  8 18:08:17 2016
From: Rob Herring <robh@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Nicolas Pitre <nico@fluxnic.net>, Arnd Bergmann <arnd@arndb.de>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] net: smsc911x: add u16 workaround for pxa platforms
References: <1475485553-18747-1-git-send-email-robert.jarzmik@free.fr>
 <1475485553-18747-3-git-send-email-robert.jarzmik@free.fr>
 <20161003154624.GG7632@leverpostej>
 <20161003160913.GQ1041@n2100.armlinux.org.uk>
 <20161003164228.GA15313@leverpostej>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161003164228.GA15313@leverpostej>
X-Mutt-References: <20161003164228.GA15313@leverpostej>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 18:08:17 -0500
Status: RO
Content-Length: 2312
Lines: 61

On Mon, Oct 03, 2016 at 05:42:29PM +0100, Mark Rutland wrote:
> On Mon, Oct 03, 2016 at 05:09:13PM +0100, Russell King - ARM Linux wrote:
> > Please note that the binding doc for smsc,lan91c111.txt is slightly wrong
> > on two counts:
> > 
> > 1) compatible property:
> > 
> > compatible = "smsc,lan91c111";
> > 
> > vs the code:
> > 
> > static const struct of_device_id smc91x_match[] = {
> >         { .compatible = "smsc,lan91c94", },
> >         { .compatible = "smsc,lan91c111", },
> >         {},
> > };
> > MODULE_DEVICE_TABLE(of, smc91x_match);
> > 
> > So the binding document needs to mention that smsc,lan91c94 is a valid
> > compatible for this device.
> 
> Yes, it should.
> 
> > 2) reg-io-width property:
> > 
> > - reg-io-width : Mask of sizes (in bytes) of the IO accesses that
> >   are supported on the device.  Valid value for SMSC LAN91c111 are
> >   1, 2 or 4.  If it's omitted or invalid, the size would be 2 meaning
> >   16-bit access only.
>  
> > Moreover, look at the property name vs the binding description.  It's
> > property name says it's a width, but the description says it's a mask
> > of sizes - these really aren't the same thing.  Once you start
> > specifying these other legal masks, it makes a nonsense of the "width"
> > part of the name.  It's too late to try and fix this now though.
> 
> Indeed, as-is this is nonsense. :(
> 
> The best we can do here is to add a big fat notice regarding the
> misnaming; adding a new property is only giong to cause more confusion.

Just fix the text here removing the mask part. This is a common property 
and not a mask. The rest saying 1, 2, 4 being valid is correct. There 
are no occurences using this as a mask in kernel dts files either.

> 
> > The binding document really needs to get fixed - I'll try to cook up a
> > patch during this week to correct these points, but it probably needs
> > coordination if others are going to be changing this as well.
> 
> Thanks for handling both of these.
> 
> Given the historical rate of change of the binding document, I suspect
> the stuff for pxa platforms is going to be the only potential conflict.
> 
> Either all of that can go via the DT tree (independent of any new code),
> or we can ack the whole lot and it can all go via the net tree in one
> go.
> 
> Thanks,
> Mark.

>From robh@kernel.org Sat Oct  8 18:11:28 2016
From: Rob Herring <robh@kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Pitre <nico@fluxnic.net>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] net: smsc911x: add u16 workaround for pxa platforms
References: <1475485553-18747-1-git-send-email-robert.jarzmik@free.fr>
 <1475485553-18747-3-git-send-email-robert.jarzmik@free.fr>
 <20161003154624.GG7632@leverpostej>
 <87oa319zv8.fsf@belgarion.home>
 <20161003165032.GB15313@leverpostej>
 <871szx9rhc.fsf@belgarion.home>
 <87lgy27z4e.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lgy27z4e.fsf@belgarion.home>
X-Mutt-References: <87lgy27z4e.fsf@belgarion.home>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 18:11:28 -0500
Status: RO
Content-Length: 1947
Lines: 46

On Thu, Oct 06, 2016 at 08:47:13AM +0200, Robert Jarzmik wrote:
> Robert Jarzmik <robert.jarzmik@free.fr> writes:
> 
> > Mark Rutland <mark.rutland@arm.com> writes:
> >
> >> On Mon, Oct 03, 2016 at 06:11:23PM +0200, Robert Jarzmik wrote:
> >>> Mark Rutland <mark.rutland@arm.com> writes:
> >>> 
> >>> reg-u16-align4 tells that a specific hardware doesn't support 16 bit writes not
> >>> being 32 bits aligned, or said differently that a "store" 16 bits wide on an
> >>> address of the format 4*n + 2 deserves a special handling in the driver, while a
> >>> store 16 bits wide on an address of the format 4*n can follow the simple casual
> >>> case.
> >>
> >> If I've understood correctly, effectively the low 2 address lines to the
> >> device are hard-wired to zero, e.g. a 16-bit access to 4*n + 2 would go
> >> to 4*n + 0 on the device? Or is the failure case distinct from that?
> > It is distinct.
> >
> > The "awful truth" is that an FPGA lies between the system bus and the
> > smc91c111. And this FPGA cannot handle correctly the 4*n + 2 u16 writes.
> >
> >> Do we have other platforms where similar is true? e.g. u8 accesses
> >> requiring 16-bit alignment?
> >
> > Not really, ie. not with a alignement requirement.
> >
> > But there are of course these ones are handled by reg-io-width and the
> > SMC_USE_xxx_BITS flags as far as I understand it. These cases are when a
> > platform declares SMC91X_USE_16BIT or SMC91X_USE_32BIT, but not SMC91X_USE_8BIT,
> > which would make me think of :
> >  - CONFIG_SH_SH4202_MICRODEV,
> >  - CONFIG_M32R
> >  - several omap1 boards
> >  - 1 sa1100 board
> >  - several MMP and realview boards
> >
> > With all these platforms, each u8 access is replaced with a u16 access and a
> > mask / shift + mask.
> 
> Or so what should I call this entry if reg-u16-align4 is not a good candidate ?

This seems broken in a very platform specific way, so perhaps something 
named based on the platform.

Rob

>From robh@kernel.org Sat Oct  8 18:12:54 2016
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH 05/12] ASoC: sun4i-codec: Add support for A31 playback
 through headphone output
References: <20161003110804.28235-1-wens@csie.org>
 <20161003110804.28235-6-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161003110804.28235-6-wens@csie.org>
X-Mutt-References: <20161003110804.28235-6-wens@csie.org>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 18:12:54 -0500
Status: RO
Content-Length: 1032
Lines: 22

On Mon, Oct 03, 2016 at 07:07:57PM +0800, Chen-Yu Tsai wrote:
> The A31 has a similar codec to the A10/A20. The PCM parts are very
> similar, with just different register offsets. The analog paths are
> very different. There are more inputs and outputs.
> 
> The quirks structure is expanded to include different register offsets
> and separate callbacks for creating the ASoC card. Also the DMA burst
> length is increased to 8. While the A10 DMA engine supports bursts of
> 1, 4 and 8, the A31 engine only supports 1 and 8.
> 
> This patch adds support for the basic playback path of the A31 codec,
> from the DAC to the headphones. Headphone detection, microphone,
> signaling, other inputs/outputs and capture will be added later.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../devicetree/bindings/sound/sun4i-codec.txt      |   6 +-

Acked-by: Rob Herring <robh@kernel.org>

>  sound/soc/sunxi/sun4i-codec.c                      | 396 +++++++++++++++++----
>  2 files changed, 334 insertions(+), 68 deletions(-)

>From robh@kernel.org Sat Oct  8 18:13:40 2016
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH 10/12] ASoC: sun4i-codec: Add support for A31 board level
 audio routing
References: <20161003110804.28235-1-wens@csie.org>
 <20161003110804.28235-11-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161003110804.28235-11-wens@csie.org>
X-Mutt-References: <20161003110804.28235-11-wens@csie.org>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 18:13:40 -0500
Status: RO
Content-Length: 833
Lines: 20

On Mon, Oct 03, 2016 at 07:08:02PM +0800, Chen-Yu Tsai wrote:
> The A31 SoC's codec has various inputs, outputs and microphone bias
> supplies. These can be routed on the board in different ways, such as:
> 
>   - Microphones all use the MBIAS main microphone supply or one mic may
>     use the HBIAS supply, which supports headset detection and buttons.
> 
>   - Line Out may be routed to an audio jack, or an onboard speaker amp
>     with power controls.
> 
> Add support for specifying the audio routes in the device tree.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../devicetree/bindings/sound/sun4i-codec.txt      | 35 ++++++++++++++++++++++

Acked-by: Rob Herring <robh@kernel.org>

>  sound/soc/sunxi/sun4i-codec.c                      | 21 +++++++++++--
>  2 files changed, 54 insertions(+), 2 deletions(-)

>From robh@kernel.org Sat Oct  8 18:15:21 2016
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
	David Airlie <airlied@linux.ie>,
	Kevin Hilman <khilman@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Sekhar Nori <nsekhar@ti.com>, Frank Rowand <frowand.list@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	arm-soc <linux-arm-kernel@lists.infradead.org>,
	linux-drm <dri-devel@lists.freedesktop.org>,
	linux-devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3] drm: tilcdc: add a da850-specific compatible string
Message-ID: <20161008231521.GA10920@rob-hp-laptop>
References: <1475509519-29516-1-git-send-email-bgolaszewski@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475509519-29516-1-git-send-email-bgolaszewski@baylibre.com>
X-Mutt-References: <1475509519-29516-1-git-send-email-bgolaszewski@baylibre.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 18:15:24 -0500
Status: RO
Content-Length: 731
Lines: 19

On Mon, Oct 03, 2016 at 05:45:19PM +0200, Bartosz Golaszewski wrote:
> Due to some potential tweaks for the da850 LCDC (for example: the
> required memory bandwith settings) we need a separate compatible
> for the IP present on the da850 boards.
> 
> Suggested-by: Sekhar Nori <nsekhar@ti.com>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> v1 -> v2:
> - added the new compatible to the bindings documentation
> 
> v2 -> v3:
> - made the documentation more detailed
> 
>  Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt | 6 ++++--
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c                         | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

>From robh@kernel.org Sat Oct  8 18:18:48 2016
From: Rob Herring <robh@kernel.org>
To: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
Cc: devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	linux-hwmon@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v2] Documentation: dtb: lm87: Add hwmon binding
 documentation.
References: <20161004005123.2004-1-mahoda.ratnayaka@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161004005123.2004-1-mahoda.ratnayaka@alliedtelesis.co.nz>
X-Mutt-References: <20161004005123.2004-1-mahoda.ratnayaka@alliedtelesis.co.nz>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 18:18:48 -0500
Status: RO
Content-Length: 1948
Lines: 65

On Tue, Oct 04, 2016 at 01:51:23PM +1300, Mahoda Ratnayaka wrote:
> This patch adds lm87 hwmon device tree node documentation.
> 
> Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes since v1:
>      As suggested include all the changes are moved in
>      to the same patch and the all the optional properties
>      are now defined instead of using a single variable to
>      indicate those properties.
> 
>  Documentation/devicetree/bindings/hwmon/lm87.txt | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documentation/devicetree/bindings/hwmon/lm87.txt
> new file mode 100644
> index 0000000..ac578fff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/lm87.txt
> @@ -0,0 +1,29 @@
> +*LM87 hwmon sensor.
> +
> +Required properties:
> +- compatible: Should be
> +	"ti,lm87"
> +
> +- reg: I2C address
> +
> +optional properties:
> +- has-temp3: This configures pins 18 and 19 to be used as a second
> +             remote temperature sensing channel. By default the pins
> +             are configured as voltage input pins in0 and in5.
> +
> +- has-in6: When set, pin 5 is configured to be used as voltage input
> +           in6. Otherwise the pin is set as FAN1 input.
> +
> +- has-in7: When set, pin 6 is configured to be used as voltage input
> +           in6. Otherwise the pin is set as FAN2 input.

Should be in7 ^^^?

These need vendor prefixes. Or would they apply for multiple vendors of 
LM87?

> +
> +- has-vcc-5v: sets the nominal voltage for internal VCC measurement to 5V.
> +              Default is 3.3V.

This is set to what the supply voltage is? If so, use the regulator 
binding.

> +
> +Example:
> +
> +lm87@2e {
> +	compatible = "ti,lm87";
> +	reg = <0x2e>;
> +	has-temp3;
> +};
> -- 
> 2.10.0
> 

>From robh@kernel.org Sat Oct  8 18:23:15 2016
From: Rob Herring <robh@kernel.org>
To: John Garry <john.garry@huawei.com>
Cc: jejb@linux.vnet.ibm.com, martin.petersen@oracle.com,
	mark.rutland@arm.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
	john.garry2@mail.dcu.ie, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	hare@suse.com, Xiang Chen <chenxiang66@hisilicon.com>
Subject: Re: [PATCH v2 1/3] devicetree: bindings: scsi: hisi_sas add hip07
 support
References: <1475579471-11308-1-git-send-email-john.garry@huawei.com>
 <1475579471-11308-2-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475579471-11308-2-git-send-email-john.garry@huawei.com>
X-Mutt-References: <1475579471-11308-2-git-send-email-john.garry@huawei.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 18:23:15 -0500
Status: RO
Content-Length: 404
Lines: 12

On Tue, Oct 04, 2016 at 07:11:09PM +0800, John Garry wrote:
> Add support for hip07 chipset to hisi_sas controller.
> 
> Chipset hip07 has v2 hw.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>
> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> ---
>  Documentation/devicetree/bindings/scsi/hisilicon-sas.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>

>From robh@kernel.org Sat Oct  8 18:25:43 2016
From: Rob Herring <robh@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, nm@ti.com, sboyd@codeaurora.org,
	Viresh Kumar <vireshk@kernel.org>, linaro-kernel@lists.linaro.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>, d-gerlach@ti.com,
	broonie@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/8] PM / OPP: Reword binding supporting multiple
 regulators per device
References: <cover.1475581665.git.viresh.kumar@linaro.org>
 <ea6ba87d6514dcec7bee222b401ab904a78e67e6.1475581665.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea6ba87d6514dcec7bee222b401ab904a78e67e6.1475581665.git.viresh.kumar@linaro.org>
X-Mutt-References: <ea6ba87d6514dcec7bee222b401ab904a78e67e6.1475581665.git.viresh.kumar@linaro.org>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 18:25:43 -0500
Status: RO
Content-Length: 1242
Lines: 29

On Tue, Oct 04, 2016 at 05:26:43PM +0530, Viresh Kumar wrote:
> On certain platforms (like TI), DVFS for a single device (CPU) requires
> configuring multiple power supplies.
> 
> The OPP bindings already contains binding and example to explain this
> case, but it isn't sufficient. For example, there is no way for the code
> parsing these bindings to know which voltage values belong to which
> power supply. Also its not possible to know the order in which the
> supplies need to be configured while switching OPPs.
> 
> This patch tries to clarify on those details and does some minor changes
> as well.
> 
> Note that the bindings do not specify the order in which the regulators
> need to be programmed and the order in which the entries are added for
> the supplies.
> 
> The user of the bindings (like the kernel) shall know these details
> already and the DT is responsible to supply only the readings for the
> regulators.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  Documentation/devicetree/bindings/opp/opp.txt | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

>From robh@kernel.org Sat Oct  8 18:28:05 2016
From: Rob Herring <robh@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, mark.rutland@arm.com,
	horia.geanta@nxp.com, tudor-dan.ambarus@nxp.com,
	alexandru.porosanu@nxp.com, arnd@arndb.de,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: caam: add support for iMX6UL
References: <20161004133259.GA30071@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161004133259.GA30071@gmail.com>
X-Mutt-References: <20161004133259.GA30071@gmail.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 18:28:05 -0500
Status: RO
Content-Length: 453
Lines: 11

On Tue, Oct 04, 2016 at 09:32:59AM -0400, Marcus Folkesson wrote:
> i.MX6UL does only require three clocks to enable CAAM module.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  .../devicetree/bindings/crypto/fsl-sec4.txt        | 20 +++++++++++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/crypto/caam/ctrl.c                         | 35 ++++++++++++----------
>  2 files changed, 40 insertions(+), 15 deletions(-)

>From robh@kernel.org Sat Oct  8 18:29:40 2016
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-oxnas@lists.tuxfamily.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: oxnas: Update Pinctrl and GPIO for
 OX820 Support
Message-ID: <20161008232940.GA19861@rob-hp-laptop>
References: <20161004134148.23028-1-narmstrong@baylibre.com>
 <20161004134148.23028-4-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161004134148.23028-4-narmstrong@baylibre.com>
X-Mutt-References: <20161004134148.23028-4-narmstrong@baylibre.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 18:29:42 -0500
Status: RO
Content-Length: 955
Lines: 22

On Tue, Oct 04, 2016 at 03:41:48PM +0200, Neil Armstrong wrote:
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio_oxnas.txt       | 2 +-
>  Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt b/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
> index 928ed4f..9665147 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
> @@ -3,7 +3,7 @@
>  Please refer to gpio.txt for generic information regarding GPIO bindings.
>  
>  Required properties:
> - - compatible: "oxsemi,ox810se-gpio"
> + - compatible: "oxsemi,ox810se-gpio" or "oxsemi,ox820-gpio"

It is preferred to have one per line, but it's fine unless you respin 
the series.

Acked-by: Rob Herring <robh@kernel.org>

>From robh@kernel.org Sat Oct  8 18:32:09 2016
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jason Cooper <jason@lakedaemon.net>,
	Marc Zyngier <marc.zyngier@arm.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [RFC 02/10] dt-bindings: interrupt-controller: add DT binding
 for meson GPIO interrupt controller
References: <1475593708-10526-1-git-send-email-jbrunet@baylibre.com>
 <1475593708-10526-3-git-send-email-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1475593708-10526-3-git-send-email-jbrunet@baylibre.com>
X-Mutt-References: <1475593708-10526-3-git-send-email-jbrunet@baylibre.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 18:32:09 -0500
Status: RO
Content-Length: 1610
Lines: 33

On Tue, Oct 04, 2016 at 05:08:20PM +0200, Jerome Brunet wrote:
> This commit adds the device tree bindings description for Amlogic's GPIO
> interrupt controller available on the meson8, meson8b and gxbb SoC families
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../amlogic,meson-gpio-intc.txt                    | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
> new file mode 100644
> index 000000000000..bd4cceefcda1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
> @@ -0,0 +1,39 @@
> +Amlogic meson GPIO interrupt controller
> +
> +Meson SoCs contains an interrupt controller which is able watch the SoC pads
> +and generate an interrupt on edges or level. The controller is essentially a
> +256 pads to 8 GIC interrupt multiplexer, with a filter block to select edge
> +or level and polarity. We don’t expose all 256 mux inputs because the
> +documentation shows that upper part is not mapped to any pad. The actual number
> +of interrupt exposed depends on the SoC.
> +
> +Required properties:
> +
> +- compatible : should be: "amlogic,meson8-gpio-intc” or
> +  “amlogic,meson8b-gpio-intc” or “amlogic,gxbb-gpio-intc”

One per line please if you respin the series.

Acked-by: Rob Herring <robh@kernel.org>

>From robh@kernel.org Sat Oct  8 18:33:00 2016
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jason Cooper <jason@lakedaemon.net>,
	Marc Zyngier <marc.zyngier@arm.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [RFC 05/10] dt-bindings: pinctrl: meson: update gpio dt-bindings
Message-ID: <20161008233300.GA22543@rob-hp-laptop>
References: <1475593708-10526-1-git-send-email-jbrunet@baylibre.com>
 <1475593708-10526-6-git-send-email-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475593708-10526-6-git-send-email-jbrunet@baylibre.com>
X-Mutt-References: <1475593708-10526-6-git-send-email-jbrunet@baylibre.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 18:33:03 -0500
Status: RO
Content-Length: 500
Lines: 12

On Tue, Oct 04, 2016 at 05:08:23PM +0200, Jerome Brunet wrote:
> Add description for the interrupt-parent property of the gpio sub-node
> If provided here, this property must be a phandle to an interrupt
> controller suitable for meson pinctrl, like the meson gpio interrupt
> controller.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

>From robh@kernel.org Sat Oct  8 18:33:48 2016
From: Rob Herring <robh@kernel.org>
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
	David Airlie <airlied@linux.ie>,
	Mark Rutland <mark.rutland@arm.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: Add Sharp LQ150X1LG11 panel
 binding
References: <1475594961-5713-1-git-send-email-peda@axentia.se>
 <1475594961-5713-2-git-send-email-peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475594961-5713-2-git-send-email-peda@axentia.se>
X-Mutt-References: <1475594961-5713-2-git-send-email-peda@axentia.se>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 18:33:48 -0500
Status: RO
Content-Length: 427
Lines: 10

On Tue, Oct 04, 2016 at 05:29:20PM +0200, Peter Rosin wrote:
> The Sharp 15" LQ150X1LG11 panel is an XGA TFT LCD panel.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  .../bindings/display/panel/sharp,lq150x1lg11.txt   | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt

Acked-by: Rob Herring <robh@kernel.org>

>From robh@kernel.org Sat Oct  8 18:41:12 2016
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] devicetree/bindings: display: Add bindings for LVDS
 panels
References: <1475598210-26857-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1475598210-26857-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475598210-26857-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
X-Mutt-References: <1475598210-26857-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
X-Mutt-Fcc: ~/sent
Date: Sat, 8 Oct 2016 18:41:12 -0500
Status: RO
Content-Length: 6052
Lines: 170

On Tue, Oct 04, 2016 at 07:23:29PM +0300, Laurent Pinchart wrote:
> LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A.
> Multiple incompatible data link layers have been used over time to
> transmit image data to LVDS panels. This binding supports display panels
> compatible with the JEIDA-59-1999, Open-LDI and VESA SWPG
> specifications.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../bindings/display/panel/panel-lvds.txt          | 119 +++++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.txt b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> new file mode 100644
> index 000000000000..250861f2673e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> @@ -0,0 +1,119 @@
> +Generic LVDS Panel
> +==================
> +
> +LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
> +incompatible data link layers have been used over time to transmit image data
> +to LVDS panels. This bindings supports display panels compatible with the
> +following specifications.
> +
> +[JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
> +1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
> +[LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
> +Semiconductor
> +[VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
> +Electronics Standards Association (VESA)
> +
> +Device compatible with those specifications have been marketed under the
> +FPD-Link and FlatLink brands.
> +
> +
> +Required properties:
> +- compatible: shall contain "panel-lvds"

Maybe as a fallback, but on its own, no way.

> +- width-mm: panel display width in millimeters
> +- height-mm: panel display height in millimeters

This is already documented for all panels IIRC.

> +- data-mapping: the color signals mapping order, "jeida-18", "jeida-24"
> +  or "vesa-24"

Maybe this should be part of the compatible.

> +
> +Optional properties:
> +- label: a symbolic name for the panel

Could be for any panel or display connector.

> +- avdd-supply: reference to the regulator that powers the panel 
analog supply
> +- dvdd-supply: reference to the regulator that powers the panel digital supply

Which one has to be powered on first, what voltage, and with what time 
in between? This is why "generic" or "simple" bindings don't work.

> +- data-mirror: if set, reverse the bit order on all data lanes (6 to 0 instead
> +  of 0 to 6)
> +
> +Required nodes:
> +- One "panel-timing" node containing video timings, in accordance with the
> +  display timing bindings defined in
> +  Documentation/devicetree/bindings/display/display-timing.txt.

I'll let Thierry comment on this one.

> +- One "port" child node for the LVDS input port, in accordance with the
> +  video interface bindings defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +
> +LVDS data mappings are defined as follows.
> +
> +- "jeida-18" - 18-bit data mapping compatible with the [JEIDA], [LDI] and
> +  [VESA] specifications. Data are transferred as follows on 3 LVDS lanes.
> +
> +Slot	    0       1       2       3       4       5       6
> +	________________                         _________________
> +Clock	                \_______________________/
> +	  ______  ______  ______  ______  ______  ______  ______
> +DATA0	><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
> +DATA1	><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
> +DATA2	><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
> +
> +- "jeida-24" - 24-bit data mapping compatible with the [DSIM] and [LDI]
> +  specifications. Data are transferred as follows on 4 LVDS lanes.
> +
> +Slot	    0       1       2       3       4       5       6
> +	________________                         _________________
> +Clock	                \_______________________/
> +	  ______  ______  ______  ______  ______  ______  ______
> +DATA0	><__G2__><__R7__><__R6__><__R5__><__R4__><__R3__><__R2__><
> +DATA1	><__B3__><__B2__><__G7__><__G6__><__G5__><__G4__><__G3__><
> +DATA2	><_CTL2_><_CTL1_><_CTL0_><__B7__><__B6__><__B5__><__B4__><
> +DATA3	><_CTL3_><__B1__><__B0__><__G1__><__G0__><__R1__><__R0__><
> +
> +- "vesa-24" - 24-bit data mapping compatible with the [VESA] specification.
> +  Data are transferred as follows on 4 LVDS lanes.
> +
> +Slot	    0       1       2       3       4       5       6
> +	________________                         _________________
> +Clock	                \_______________________/
> +	  ______  ______  ______  ______  ______  ______  ______
> +DATA0	><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
> +DATA1	><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
> +DATA2	><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
> +DATA3	><_CTL3_><__B7__><__B6__><__G7__><__G6__><__R7__><__R6__><
> +
> +
> +Control signals are mapped as follows.
> +
> +CTL0: HSync
> +CTL1: VSync
> +CTL2: Data Enable
> +CTL3: 0
> +
> +
> +Example
> +-------
> +
> +panel {
> +	compatible = "mitsubishi,aa121td01", "panel-lvds";
> +	label = "lcd";

Kind of useless in your example.

> +
> +	width-mm = <261>;
> +	height-mm = <163>;
> +
> +	data-mapping = "jeida-24";
> +
> +	panel-timing {
> +		/* 1280x800 @60Hz */
> +		clock-frequency = <71000000>;
> +		hactive = <1280>;
> +		vactive = <800>;
> +		hsync-len = <70>;
> +		hfront-porch = <20>;
> +		hback-porch = <70>;
> +		vsync-len = <5>;
> +		vfront-porch = <3>;
> +		vback-porch = <15>;
> +	};
> +
> +	port {
> +		panel_in: endpoint {
> +			remote-endpoint = <&lvds_connector>;
> +		};
> +	};
> +};
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

>From robh@kernel.org Sat Oct  8 17:19:50 2016
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linus.walleij@linaro.org, peda@axentia.se, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	Wei.Chen@csr.com, stigge@antcom.de, vladimir_zapolskiy@mentor.com
Subject: Re: [PATCH v2] pinctrl: Add SX150X GPIO Extender Pinctrl Driver
References: <1474991325-1754-1-git-send-email-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474991325-1754-1-git-send-email-narmstrong@baylibre.com>
X-Mutt-Fcc: ~/sent
Status: RO
Date: Sat, 8 Oct 2016 20:07:21 -0500
Content-Length: 2549
Lines: 52

On Tue, Sep 27, 2016 at 05:48:45PM +0200, Neil Armstrong wrote:
> Since the I2C sx150x GPIO expander driver uses platform_data to manage
> the pins configurations, rewrite the driver as a pinctrl driver using
> pinconf to get/set pin configurations from DT or debugfs.
> 
> The pinctrl driver is functionnally equivalent as the gpio-only driver
> and can use DT for pinconf. The platform_data confirmation is dropped.
> 
> This patchset removed the gpio-only driver and selects the Pinctrl driver
> config instead. This patchset also migrates the gpio dt-bindings to pinctrl
> and add the pinctrl optional properties.
> 
> The driver was tested with a SX1509 device on a BeagleBone black with
> interrupt support and on an X86_64 machine over an I2C to USB converter.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> This is a fixed version that builds and runs on non-OF platforms and on
> arm based OF. The GPIO version is removed and the bindings are also moved
> to the pinctrl bindings.
> 
> One remaining question, should i2c_driver remove be implemented ?
> It would be quite hard to implement due to the interrupt controller.
> 
> Changes since v1 at http://lkml.kernel.org/r/1473166599-29266-1-git-send-email-narmstrong@baylibre.com:
>  - Fix Kconfig descriptions on pinctrl and gpio
>  - Fix Kconfig dependency
>  - Remove oscio support for non-789 devices
>  - correct typo in dt bindings
>  - remove probe reset for non-789 devices
> 
> Changes since RFC at http://lkml.kernel.org/r/1472130692-14404-1-git-send-email-narmstrong@baylibre.com:
>  - Put #ifdef CONFIG_OF/CONFIG_OF_GPIO to remove OF code for non-of platforms
>  - No more rely on OF_GPIO config
>  - Moved and enhanced bindings to pinctrl bindings
>  - Removed gpio-sx150x.c
>  - Temporary select PINCTRL_SX150X when GPIO_SX150X
>  - Temporary mark GPIO_SX150X as deprecated
> 
> 
>  .../gpio-sx150x.txt => pinctrl/pinctrl-sx150x.txt} |   46 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/gpio/Kconfig                               |   13 +-
>  drivers/gpio/Makefile                              |    1 -
>  drivers/pinctrl/Kconfig                            |   14 +
>  drivers/pinctrl/Makefile                           |    1 +
>  .../gpio-sx150x.c => pinctrl/pinctrl-sx150x.c}     | 1179 ++++++++++++--------
>  6 files changed, 782 insertions(+), 472 deletions(-)
>  rename Documentation/devicetree/bindings/{gpio/gpio-sx150x.txt => pinctrl/pinctrl-sx150x.txt} (40%)
>  rename drivers/{gpio/gpio-sx150x.c => pinctrl/pinctrl-sx150x.c} (24%)



--===============2603217065821997352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2603217065821997352==--
