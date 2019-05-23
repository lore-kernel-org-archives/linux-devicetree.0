From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v13 2/4] arm64: dts: fsl: librem5: Add a device tree for
 the Librem5 devkit
Date: Thu, 23 May 2019 21:19:22 +0200
Message-ID: <20190523191922.GA3803@xo-6d-61-c0.localdomain>
References: <20190520142330.3556-1-angus@akkea.ca>
 <20190520142330.3556-3-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190520142330.3556-3-angus@akkea.ca>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, angus.ainslie@puri.sm, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi!

> This is for the development kit board for the Librem 5. The current level
> of support yields a working console and is able to boot userspace from
> the network or eMMC.
> 
> Additional subsystems that are active :

> - haptic motor

Haptic motor is not a LED. It should be controlled by input subsystem.

> +	pwmleds {
> +		compatible = "pwm-leds";
> +
> +		haptic {
> +			label = "librem5::haptic";
> +			pwms = <&pwm2 0 200000>;
> +			active-low;
> +			max-brightness = <255>;
> +			power-supply = <&reg_3v3_p>;
> +		};
> +	};

You can take a look at N900, that has reasonable interface.

Thanks,
										Pavel
