From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 08/11] ARM: dts: Prepare Actions Semi S500 and LeMaker
 Guitar
Date: Fri, 24 Feb 2017 01:59:23 +0100
Message-ID: <61878112-690f-ca5d-152b-68196f563e83@suse.de>
References: <20170215165528.10052-1-afaerber@suse.de>
 <20170215165528.10052-9-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170215165528.10052-9-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, support@lemaker.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, mp-cs@actions-semi.com
List-Id: devicetree@vger.kernel.org

Am 15.02.2017 um 17:55 schrieb Andreas Färber:
> +		gic: interrupt-controller@b0021000 {
> +			compatible = "arm,cortex-a9-gic";
> +			reg = <0xb0021000 0x1000>,
> +			      <0xb0020100 0x0100>;
> +		};

This was lacking:

			interrupt-controller;
			#interrupt-cells = <3>;

leading to a hang when mapping an irq.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
