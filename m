From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v3] arm64: dts: marvell: Add device tree for uDPU board
Date: Tue, 15 Jan 2019 17:37:36 +0100
Message-ID: <8736ptri5r.fsf@FE-laptop>
References: <20190111172055.30451-1-vladimir.vid@sartura.hr>
 <20190115144421.29968-1-vladimir.vid@sartura.hr>
 <20190115161608.GA25888@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190115161608.GA25888@lunn.ch> (Andrew Lunn's message of "Tue,
 15 Jan 2019 17:16:08 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, Luis Torres <luis.torres@methode.com>, Paul Arola <paul.arola@telus.com>, Luka Perkov <luka.perkov@sartura.hr>, Vladimir Vid <vladimir.vid@sartura.hr>, Scott Roberts <scott.roberts@telus.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,
 
 On mar., janv. 15 2019, Andrew Lunn <andrew@lunn.ch> wrote:

> Hi Vladimir
>
> Ah, i did not notice early. You need to Cc: the Marvell mvebu
> maintainers. They are the ones who will accept this patch.
>
>
>> +	leds {
>> +		pinctrl-names = "default";
>> +		compatible = "gpio-leds";
>> +
>> +		power@487 {
>> +			label = "power:green:led1";
>> +			gpios = <&gpionb 11 GPIO_ACTIVE_LOW>;
>> +			default-state = "off";
>> +		};
>
> I'm a bit out of date with dtc warnings. I think the @487 will
> generate a warning because there is no reg property?
>
> Gregory, do you know?

I confirm that if there is no reg then there should not have a @XXX.

Gregory


>
> Thanks
> 	Andrew
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
