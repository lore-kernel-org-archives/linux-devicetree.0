From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 6/6] watchdog: ts4600: add driver for TS-4600 watchdog
Date: Wed, 8 Feb 2017 15:50:14 -0600
Message-ID: <20170208215014.d2tblyu7olhph5qx@rob-hp-laptop>
References: <20170203194729.20995-1-sebastien.bourdelin@savoirfairelinux.com>
 <20170203194729.20995-7-sebastien.bourdelin@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170203194729.20995-7-sebastien.bourdelin@savoirfairelinux.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Cc: mark.rutland@arm.com, linus.walleij@linaro.org, will.deacon@arm.com, kris@embeddedarm.com, yamada.masahiro@socionext.com, wim@iguana.be, f.fainelli@gmail.com, damien.riegel@savoirfairelinux.com, linux@armlinux.org.uk, jonathanh@nvidia.com, treding@nvidia.com, linux@roeck-us.net, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, arnd@arndb.de, suzuki.poulose@arm.com, lucile.quirion@savoirfairelinux.com, fabio.estevam@nxp.com, kernel@savoirfairelinux.com, horms+renesas@verge.net.au, linux-arm-kernel@lists.infradead.org, mark@embeddedarm.com, linux-kernel@vger.kernel.org, kernel@pengutronix.de, olof@lixom.net, shawnguo@kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 03, 2017 at 02:47:29PM -0500, Sebastien Bourdelin wrote:
> This watchdog is instantiated in a FPGA and can only be access using a
> GPIOs bit-banged bus, called the NBUS by Technologic Systems.
> The watchdog is made of only one register, called the feed register.
> Writing to this register will re-arm the watchdog for a given time (and
> enable it if it was disable). It can be disabled by writing a special
> value into it.
> 
> ---
> Changes v1 -> v2:
>   - rebase on master
>   - retrieve the ts_nbus instantiated by the parent node (suggested by
>   Linus Walleij)
>   - rename the wdt by watchdog in the device tree and in the
>   documentation (suggested by Rob Herring)
>   - add a dependency to the TS_NBUS driver in the Kconfig (suggested by
>   Guenter Roeck)
>   - simplify the set_timeout function (suggested by Guenter Roeck)
>   - use the max_hw_heartbeat_ms callback instead of the max_timeout
>   callback (suggested by Guenter Roeck)
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
> ---
>  .../devicetree/bindings/watchdog/ts4600-wdt.txt    |  16 ++
>  arch/arm/boot/dts/imx28-ts4600-common.dtsi         |   5 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/watchdog/Kconfig                           |  11 ++
>  drivers/watchdog/Makefile                          |   1 +
>  drivers/watchdog/ts4600_wdt.c                      | 217 +++++++++++++++++++++
>  5 files changed, 250 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/ts4600-wdt.txt
>  create mode 100644 drivers/watchdog/ts4600_wdt.c
