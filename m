From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH v10 2/3] fpga manager: Add altera-ps-spi driver for
 Altera FPGAs
Date: Thu, 18 May 2017 13:46:59 +0200
Message-ID: <20170518134659.589b681b@crub>
References: <1495045422-19183-1-git-send-email-agust@denx.de>
        <1495045422-19183-2-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495045422-19183-2-git-send-email-agust@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: stillcompiling@gmail.com, joshua.clayton@uniwest.com, bst@pengutronix.de
Cc: linux-fpga@vger.kernel.org, atull@kernel.org, moritz.fischer@ettus.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, 17 May 2017 20:23:41 +0200
Anatolij Gustschin agust@denx.de wrote:
...
>+	conf->spi = spi;
>+	conf->config = devm_gpiod_get(&spi->dev, "nconfig", GPIOD_OUT_HIGH);

we should use GPIOD_OUT_LOW flags here. nCONFIG is low active, so
setting logical high will enable the signal (drive the pin low),
resulting in configuration reset for already initialised FPGAs when
loading/reloading the module.

Thanks,

Anatolij
