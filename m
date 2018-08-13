From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx7ulp: update pinfunc header file
Date: Mon, 13 Aug 2018 17:01:51 -0600
Message-ID: <20180813230151.GA28201@rob-hp-laptop>
References: <1532988635-4726-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532988635-4726-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Tue, Jul 31, 2018 at 06:10:35AM +0800, Anson Huang wrote:
> The i.MX7ULP B0 chip has some pin changes for USB and VIU
> module, update pinfunc header file accordingly.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  arch/arm/boot/dts/imx7ulp-pinfunc.h | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
