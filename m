From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/4] dt: fsl-imx-esdhc.txt: Fix gpio number assignment
Date: Mon, 11 Jun 2012 07:22:06 -0300
Message-ID: <CAOMZO5ARs6wFn+HVF97GM=WkEY91+17fn3mPTcPeKX5UPjO2ZQ@mail.gmail.com>
References: <1339349050-3105-1-git-send-email-festevam@gmail.com>
	<4FD529B0.6010401@gmail.com>
	<CAOMZO5A-QUA_i0HOWm-dZq6pbcFPMyuQbX+1N3hr7NVbRhjxVw@mail.gmail.com>
	<4FD56FE1.3000800@gmail.com>
	<20120611065011.GN30400@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120611065011.GN30400@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Rob Herring <robherring2@gmail.com>, grant.likely@secretlab.ca, Fabio Estevam <fabio.estevam@freescale.com>, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

Hi Sascha,

On Mon, Jun 11, 2012 at 3:50 AM, Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Traditionally I started counting at 0 no matter what the datasheet told.
> Now we go to match the numbering with the datasheets, which of course
> can be confusing while transitioning this.
> Fabios patch is correct, there is no gpio0 in the devicetree.

Who could pick this patch series?

Thanks,

Fabio Estevam
