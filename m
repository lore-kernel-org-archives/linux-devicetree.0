From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH] ARM: dts: imx6ull: update vdd_soc voltage for 900MHz
 operating point
Date: Wed, 12 Sep 2018 10:28:11 +0200
Message-ID: <d989e700-0cf1-607a-b333-bdead49ae813@i2se.com>
References: <1536740009-32735-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536740009-32735-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Hi Anson,

Am 12.09.2018 um 10:13 schrieb Anson Huang:
> Update VDD_SOC voltage to 1.25V for 900MHz operating point
> according to datasheet Rev. 1.3, 08/2018, 25mV is added to
> the minimum allowed values to cover power supply ripple.

is there a reason why the new datasheet isn't published yet?

Regards
Stefan
