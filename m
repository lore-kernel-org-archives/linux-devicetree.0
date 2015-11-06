From: Yoann Sculo <yoann@printk.fr>
Subject: Re: [PATCH 3/4] ARM: dts: kirkwood: add Seagate GoFlex Home
Date: Fri, 6 Nov 2015 17:05:55 +0100
Message-ID: <563CCFE3.7080603@printk.fr>
References: <1446675888-24495-1-git-send-email-luka.perkov@sartura.hr>
 <00000150d49a8745-1c2bc8d4-1333-46bb-bf0e-5508ef988c73-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <00000150d49a8745-1c2bc8d4-1333-46bb-bf0e-5508ef988c73-000000@email.amazonses.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Luka Perkov <luka.perkov@sartura.hr>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: gregory.clement@free-electrons.com, andrew@lunn.ch, jason@lakedaemon.net
List-Id: devicetree@vger.kernel.org

Hi Luka,

I tested your patch on the GoFlex Home.

> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		health {
> +			label = "status:green:health";
> +			gpios = <&gpio1 14 1>;
> +			linux,default-trigger = "default-on";
> +		};
> +		fault {
> +			label = "status:orange:fault";
> +			gpios = <&gpio1 15 1>;
> +		};
> +		misc {
> +			label = "status:white:misc";
> +			gpios = <&gpio1 8 1>;
> +			linux,default-trigger = "ide-disk";
> +		};
> +	};

I noticed green and orange leds were working fine (0 == off, 1 == on). 
But white led polarity is inverted (1 == off, 0 == on).

> +	partition@500000 {
> +		label = "pogoplug";
> +		reg = <0x0500000 0x2000000>;
> +	};

I don't think pogoplug is the proper label for this partition. It seems 
duplicated from "kirkwood-goflexnet.dts" I guess you could label it 
"data" for instance.

Tested-by: Yoann Sculo <yoann@printk.fr>

Yoann
