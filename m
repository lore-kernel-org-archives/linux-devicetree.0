From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 8/8] ARM: brcmstb: dts: add a reference DTS for
 Broadcom 7445
Date: Fri, 17 Jan 2014 21:06:55 +0100
Message-ID: <201401172106.55668.arnd@arndb.de>
References: <1389986367-4010-1-git-send-email-marc.ceeeee@gmail.com>
 <1389986367-4010-9-git-send-email-marc.ceeeee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1389986367-4010-9-git-send-email-marc.ceeeee@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Carino <marc.ceeeee@gmail.com>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Christian Daudt <bcm@fixthebug.org>, linux-kernel@vger.kernel.org, Matt Porter <matt.porter@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Friday 17 January 2014, Marc Carino wrote:
> +       serial@f0406b00 {
> +               compatible = "ns16550a";
> +               reg = <0x00 0xf0406b00 0x00 0x20>;
> +               reg-shift = <2>;
> +               reg-io-width = <4>;
> +               interrupts = <0 75 0x4>;
> +               clock-frequency = <0x4d3f640>;
> +       };
> +
> +       rdb {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "simple-bus";
> +               ranges = <0 0x00 0xf0000000 0x1000000>;
> +
> +               sun_top_ctrl: syscon@404000 {
> +                       compatible = "brcm,bcm7445-sun-top-ctrl",
> +                                    "syscon";
> +                       reg = <0x404000 0x51c>;
> +               };
> +

Yes, this looks better, but as a minor comment, the serial device above
should really be part of the rdb bus now, since that encompasses the
0xf0000000 device range.

	Arnd
