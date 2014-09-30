From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4] ARM: shmobile: r8a7790: link PCI USB devices to USB PHY
Date: Tue, 30 Sep 2014 12:08:29 +0200
Message-ID: <2349534.Ie3QeIWjJF@wuerfel>
References: <6141061.UF13qqqgfz@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <6141061.UF13qqqgfz@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, horms@verge.net.au, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux-usb@vger.kernel.org, magnus.damm@gmail.com
List-Id: devicetree@vger.kernel.org

On Monday 29 September 2014 22:21:59 Sergei Shtylyov wrote:
> +
> +               usb@0,1 {
> +                       reg = <0x800 0 0 0 0>;
> +                       device_type = "pci";
> +                       phys = <&usb0 0>;
> +                       phy-names = "usb";
> +               };
> +
> +               usb@0,2 {

Nice to see this actually works!

The patch looks good to me, but I wasn't sure if the ARM PCI code handled
of_nodes correctly.

We frequently get people asking for the same functionality on USB device,
which should really work the same way, so I guess I can point them at
this now.

	Arnd
