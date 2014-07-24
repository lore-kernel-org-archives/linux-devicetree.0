From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RESEND RFC V2] devicetree: Dialog Semiconductor consolidate
 existing vendor prefixes to standardise on 'dlg'
Date: Thu, 24 Jul 2014 21:43:32 +0200
Message-ID: <1406231012.21800.13.camel@paszta.hi.pengutronix.de>
References: <201407241554.s6OFsqbW031651@swsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201407241554.s6OFsqbW031651@swsrvapps-01.diasemi.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Mark Brown <broonie@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, LINUX SH <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Shawn Guo <shawn.guo@freescale.com>, Guenter Roeck <linux@roeck-us.net>, DEVICE TREE <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Arnaud Ebalard <arno@natisbad.org>, Rob Herring <robh+dt@kernel.org>, LINUX ARM KERNEL <linux-arm-kernel@lists.infradead.org>, Martin Fuzzey <mfuzzey@parkeon.com>, Support Opensource <support.opensource@diasemi.com>, LINUX KERNEL <linux-kernel@vger.kernel.org>, Simon
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 24.07.2014, 16:46 +0100 schrieb Opensource [Steve
Twiss]:
> From: Steve Twiss <stwiss.opensource@diasemi.com>
> 
> This patch series updates the device tree vendor prefix for
> Dialog Semiconductor.
> 
> Various methods are currently used throughout the kernel: 'diasemi',
> 'dialog' and 'dlg'. Others have also been suggested.
> 
> This patch set aims to consolidate the usage of the vendor prefix to
> use a common standard. The prefix 'dlg' is used.
> 
> 
> Signed-off-by: Steve Twiss <stwiss.opensource@diasemi.com>
> 
> ---
> Checks performed with linux-next/next-20140715/scripts/checkpatch.pl
>  trivial-devices.txt       total: 0 errors, 0 warnings, 89 lines checked
>  da9210.txt                total: 0 errors, 0 warnings, 21 lines checked
>  vendor-prefixes.txt       total: 0 errors, 0 warnings, 149 lines checked
>  imx53-smd.dts             total: 0 errors, 2 warnings, 279 lines checked
>  imx6qdl-phytec-pfla02.dtsi total: 0 errors, 2 warnings, 357 lines checked
>  r8a7790-lager.dts         total: 0 errors, 3 warnings, 403 lines checked
>  r8a7791-koelsch.dts       total: 0 errors, 4 warnings, 461 lines checked
>  da9055-core.c             total: 0 errors, 0 warnings, 428 lines checked
> 
> This is a resend according to requests for e-mail reformatting and removal
> of '[]' in From: and Signed-off-by: tags. There are no patch alterations
> from RFC V2.
> 
> I am requesting Acks for the bindings and DTS(I) changes in this patch
> specifically the two remaining files r8a7790-lager.dts and r8a7791-koelsch.dts
> In a previous reply SHMobile was identified as needing to Ack this patch
> before it could proceed.
> - http://www.spinics.net/lists/arm-kernel/msg349289.html
> - https://lkml.org/lkml/2014/6/11/273
> 
> If there are problems with this request, can I get a quick explanation in
> the reply so I can fix it and move forwards please?
> 
> Please see this thread for latest comments:
> http://www.spinics.net/lists/arm-kernel/msg349809.html
> 
> Acked-by the following people so far:
> 
> - Rob Herring
>   http://www.spinics.net/lists/arm-kernel/msg349289.html
> 
> - Lee Jones
>   For the MFD changes:
>   http://www.spinics.net/lists/arm-kernel/msg349457.html
> 
> - Shawn Guo
>   arch/arm/boot/dts/imx53-smd.dts                    |  2 +-
>   arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi       |  2 +-

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
