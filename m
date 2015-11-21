From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 03/14] DEVICETREE: Add PIC32 clock binding documentation
Date: Sat, 21 Nov 2015 21:49:20 +0100
Message-ID: <7182714.6Xmo6Noc6V@wuerfel>
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com> <1448065205-15762-4-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448065205-15762-4-git-send-email-joshua.henderson@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joshua Henderson <joshua.henderson@microchip.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Purna Chandra Mandal <purna.mandal@microchip.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 20 November 2015 17:17:15 Joshua Henderson wrote:
> +/* PIC32 specific clks */
> +pic32_clktree {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       reg = <0x1f801200 0x200>;
> +       compatible = "microchip,pic32-clk";
> +       interrupts = <12>;
> +       ranges;
> +
> +       /* secondary oscillator; external input on SOSCI pin */
> +       SOSC:sosc_clk {
> +               #clock-cells = <0>;
> +               compatible = "microchip,pic32-sosc";
> +               clock-frequency = <32768>;
> +               reg = <0x1f801200 0x10   /* enable reg */
> +                       0x1f801390 0x10>; /* status reg */
> +               microchip,bit-mask = <0x02>; /* enable mask */
> +               microchip,status-bit-mask = <0x10>; /* status-mask*/
> +       };
> 

If you want to use the reg property in this way for each cell,
at least use a 'ranges' that only translates the actual registers
like this

	ranges = <0 0x1f801200 0x200>

	sosc_clk {
		...
		reg = <0x000 0x10>, <0x190 0x10>;
		...
	};

	Arnd
