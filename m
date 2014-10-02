From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] regulator: add mxs regulator driver
Date: Thu, 2 Oct 2014 13:18:26 -0300
Message-ID: <CAOMZO5BzUEsOt_J6YBPOjg2BQdiYW6Y9thys+8Ri5j05znjV8w@mail.gmail.com>
References: <1411779588-22031-1-git-send-email-stefan.wahren@i2se.com>
	<1411779588-22031-3-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411779588-22031-3-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Shawn Guo <shawn.guo@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 26, 2014 at 9:59 PM, Stefan Wahren <stefan.wahren@i2se.com> wrote:

> +config REGULATOR_MXS
> +       tristate "Freescale MXS on-chip regulators"
> +       depends on ARCH_MXS
> +       default y if ARCH_MXS

I would suggest removing this 'default y if ARCH_MXS' line. Thanks
