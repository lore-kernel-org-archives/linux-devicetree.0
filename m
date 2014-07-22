From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [RFC V2] devicetree: Dialog Semiconductor consolidate existing
 vendor prefixes to standardise on 'dlg'
Date: Tue, 22 Jul 2014 09:38:28 +0800
Message-ID: <20140722013827.GM8537@dragon>
References: <201407151520.s6FFKcjB009745@swsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <201407151520.s6FFKcjB009745@swsrvapps-01.diasemi.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Opensource [Steve Twiss]" <stwiss.opensource@diasemi.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Mark Brown <broonie@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, LINUX SH <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Philipp Zabel <p.zabel@pengutronix.de>, Florian Vaussard <florian.vaussard@epfl.ch>, DEVICE TREE <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Arnaud Ebalard <arno@natisbad.org>, Rob Herring <robh+dt@kernel.org>, LINUX ARM KERNEL <linux-arm-kernel@lists.infradead.org>, Martin Fuzzey <mfuzzey@parkeon.com>, Support Opensource <support.opensource@diasemi.com>, LINUX KERNEL <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 15, 2014 at 04:03:31PM +0100, Opensource [Steve Twiss] wrote:
> From: Opensource [Steve Twiss] <stwiss.opensource@diasemi.com>
> 
> This patch series updates the device tree vendor prefix for
> Dialog Semiconductor.
> 
> Various methods are currently used throughout the kernel: 'diasemi',
> 'dialog' and 'dlg'. Others have also been suggested.
> 
> This patch set aims to consolidate the usage of the vendor prefix to
> use a common standard. The prefix 'dlg' is used.

...

> Signed-off-by: Opensource [Steve Twiss] <stwiss.opensource@diasemi.com>

...

>  arch/arm/boot/dts/imx53-smd.dts                    |  2 +-
>  arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi       |  2 +-

Acked-by: Shawn Guo <shawn.guo@freescale.com>
