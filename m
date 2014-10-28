From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v7 4/7] ARM: dts: Enable Broadcom Cygnus SoC
Date: Tue, 28 Oct 2014 17:10:24 +0100
Message-ID: <12464460.6zhqY1bzdG@wuerfel>
References: <1414011474-11821-5-git-send-email-sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414011474-11821-5-git-send-email-sbranden@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Scott Branden <sbranden@broadcom.com>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Russell King <linux@arm.linux.org.uk>, bcm-kernel-feedback-list@broadcom.com, Mike Turquette <mturquette@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Antti Palosaari <crope@iki.fi>, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, JD Zheng <jdzheng@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 22 October 2014 13:57:51 Scott Branden wrote:
> +
> +       aliases {
> +               serial0 = &uart3;
> +               serial1 = &uart0;
> +       };
> +
> +       chosen {
> +               bootargs = "console=ttyS0,115200 earlyprintk debug";
> +       };
> 

Please move the 'aliases' and 'chosen' node into the .dts files, these
are board specific, not SoC specific.

For chosen, please remove earlyprintk and debug, which don't normally
make sense unless you are debugging, and which will break in a multiplatform
kernel.

Please also add an "stdout-path = &uart3" property in chosen so that
earlycon can work. Note that earlycon is currently broken on arm32,
but we'll get there.

	Arnd
