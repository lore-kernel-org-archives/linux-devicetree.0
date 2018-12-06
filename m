From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 0/4] imx7 sbc board support extensions
Date: Thu, 6 Dec 2018 11:01:48 +0800
Message-ID: <20181206030146.GB3987@dragon>
References: <20181204110741.6943-1-hohatzel@jusst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181204110741.6943-1-hohatzel@jusst.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans Ole Hatzel <hohatzel@jusst.de>
Cc: fabio.estevam@nxp.com, devicetree@vger.kernel.org, ilya@compulab.co.il, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Tue, Dec 04, 2018 at 12:07:37PM +0100, Hans Ole Hatzel wrote:
> The following patch series contains a number of extensions and fixes to
> the board support for the imx7 sbc.
> 
> Hans Ole Hatzel (4):
>   ARM: dts: imx7d: cl-som-imx7: fix pinctrl for i2c2
>   ARM: dts: imx7d: cl-som-imx7: WiLink8 WLAN support
>   ARM: dts: imx7d: sbc imx7: add uart2
>   ARM: dts: imx7d: sbc imx7: add uart5

I would suggest the subject and prefix like below.

 ARM: dts: imx7d-cl-som: fix pinctrl for i2c2
 ARM: dts: imx7d-cl-som: add WiLink8 WLAN support
 ARM: dts: imx7d-sbc: add uart2 device support
 ARM: dts: imx7d-sbc: add uart5 device support

Shawn

> 
>  arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 100 +++++++++++++++++++++++-
>  arch/arm/boot/dts/imx7d-sbc-imx7.dts    |   8 ++
>  2 files changed, 106 insertions(+), 2 deletions(-)
> 
> -- 
> 2.19.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
