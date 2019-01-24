From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5] arm64: dts: marvell: Add device tree for uDPU board
Date: Thu, 24 Jan 2019 17:51:43 +0100
Message-ID: <20190124165143.GK482@lunn.ch>
References: <20190124163225.10863-1-vladimir.vid@sartura.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190124163225.10863-1-vladimir.vid@sartura.hr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vladimir Vid <vladimir.vid@sartura.hr>
Cc: devicetree@vger.kernel.org, Luis Torres <luis.torres@methode.com>, Jason Cooper <jason@lakedaemon.net>, Paul Arola <paul.arola@telus.com>, Gregory Clement <gregory.clement@bootlin.com>, Scott Roberts <scott.roberts@telus.com>, Luka Perkov <luka.perkov@sartura.hr>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

> +	leds {
> +		pinctrl-names = "default";
> +		compatible = "gpio-leds";
> +
> +		power1 {
> +			label = "power:green:led1";
> +			gpios = <&gpionb 11 GPIO_ACTIVE_LOW>;
> +		};

Documentation/leds/leds-class.txt

LED Device Naming
=================

Is currently of the form:

"devicename:colour:function"

Your device is not named 'power'.

     Andrew
