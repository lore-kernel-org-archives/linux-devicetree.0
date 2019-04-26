From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 2/3] dmaengine: imx-sdma: Only check ratio on parts
 that support 1:1
Date: Fri, 26 Apr 2019 17:18:40 +0530
Message-ID: <20190426114840.GV28103@vkoul-mobl>
References: <20190328133828.20999-1-angus@akkea.ca>
 <20190329152130.18411-1-angus@akkea.ca>
 <20190329152130.18411-3-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190329152130.18411-3-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: angus.ainslie@puri.sm, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Dan Williams <dan.j.williams@intel.com>, Lucas Stach <l.stach@pengutronix.de>, Carlo Caione <ccaione@baylibre.com>, Daniel Baluta <daniel.baluta@nxp.com>, Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 29-03-19, 08:21, Angus Ainslie (Purism) wrote:
> On imx8mq B0 chip, AHB/SDMA clock ratio 2:1 can't be supported,
> since SDMA clock ratio has to be increased to 250Mhz, AHB can't reach
> to 500Mhz, so use 1:1 instead.
> 
> To limit this change to the imx8mq for now this patch also adds an
> im8mq-sdma compatible string.

Applied, thanks

-- 
~Vinod
