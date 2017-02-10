From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v4 0/9] ARM: dts: support I2SE Duckbill devices
Date: Fri, 10 Feb 2017 15:45:15 +0100
Message-ID: <a6386810-1e99-130a-5fdf-02cce13d0fc4@i2se.com>
References: <1486626169-20022-1-git-send-email-michael.heimpold@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1486626169-20022-1-git-send-email-michael.heimpold@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michael Heimpold <michael.heimpold@i2se.com>, shawnguo@kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: fabio.estevam@nxp.com, devicetree@vger.kernel.org, frowand.list@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am 09.02.2017 um 08:42 schrieb Michael Heimpold:
> This series updates/adds Device Tree support for I2SE's Duckbill
> device family.
>
> The Duckbill devices are small, pen-drive sized boards based on
> NXP's i.MX28 SoC. While the initial variants (Duckbill series) were
> equipped with a micro SD card slot only, the latest generation
> (Duckbill 2 series) have an additional internal eMMC onboard.
>
> Both device generations consists of four "family members":
>
> - Duckbill/Duckbill 2: generic board, intended to be used as
>   baseboard for custom designs and/or as development board
>
> - Duckbill EnOcean/Duckbill 2 EnOcean: come with an EnOcean
>   daugther board equipped with the popular TCM310 module
>
> - Duckbill 485/Duckbill 2 485: as the name implies, these
>   devices are intended to be used as Ethernet - RS485 converters
>
> - Duckbill SPI/Duckbill 2 SPI: not sold separately, but used
>   in I2SE's development kits for Green PHY HomePlug Powerline
>   communication
>
> Because the Duckbill series is EOL, this patch series only adds
> support for the latest Duckbill 2 series devices. However,
> support for the generic Duckbill board was already mainline,
> so update it to match vendor tree DT.

I'm fine with the complete series.

Regards
