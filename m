From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 2/3] nvmem: add snvs_lpgpr driver
Date: Fri, 9 Jun 2017 11:20:01 +0100
Message-ID: <8b275308-d379-d78c-dec4-a9e9c6d94332@linaro.org>
References: <20170608165134.14971-1-o.rempel@pengutronix.de>
 <20170608165134.14971-3-o.rempel@pengutronix.de>
 <6babaffa-d782-309b-67e4-14dacb72383d@linaro.org>
 <20170609101115.umiaec2qdspkfag3@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170609101115.umiaec2qdspkfag3@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <ore@pengutronix.de>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org



On 09/06/17 11:11, Oleksij Rempel wrote:
> And SOC_IMX6 is already doing "select MFD_SYSCON", so I assume it should
> be enough to depend on it.

That should be good enough!!
