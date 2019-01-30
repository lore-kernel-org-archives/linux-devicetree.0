From: Carlo Caione <ccaione@baylibre.com>
Subject: Re: [PATCH 0/3] at803x: Add quirk to disable SmartEEE
Date: Wed, 30 Jan 2019 10:16:39 +0000
Message-ID: <5b7fa0ee-eea9-d92f-5cdf-6c1b83a61c89@baylibre.com>
References: <20190125125513.23656-1-ccaione@baylibre.com>
 <20190125130612.npknjuzjmny4yohg@e5254000004ec.dyn.armlinux.org.uk>
 <20190125184330.dm3kaoewvbwddacy@xps>
 <a8b8e82f-2b68-ed9d-6106-0542dddc1181@gmail.com>
 <20190125191947.um4w4e5jpsv2kcxc@e5254000004ec.dyn.armlinux.org.uk>
 <3e09ef54-f817-2659-4e9e-74a88a80cbcc@gmail.com>
 <20190128104620.3e724lfm5xv5il4x@xps>
 <20190128155739.yyftnu7a5hz6if7d@e5254000004ec.dyn.armlinux.org.uk>
 <9118a1cc-7ad7-cdfc-4925-d609efbc8265@gmail.com>
 <20190128190401.zzus6m6fjxpyf36d@e5254000004ec.dyn.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190128190401.zzus6m6fjxpyf36d@e5254000004ec.dyn.armlinux.org.uk>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, abailon@baylibre.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, aisheng.dong@nxp.com, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On 28/01/2019 19:04, Russell King - ARM Linux admin wrote:

Hi Russell,

> There is no "advertisement of SmartEEE" - it's just EEE.  That is
> because as far as the link partner is concerned, SmartEEE is just
> EEE.
> 
> Carlio posted a link to one of the datasheets for the family.  In
> there, it describes the EEE capability register, which describes
> what is supported, and the EEE wake error counter register.
> 
> It also describes the EEE advertisement and link parter advertisement
> registers.
> 
> All these registers correspond to the 802.3 section 45 defined MMD
> and address offsets found in Clause 45 compliant PHYs, and these
> registers control not only EEE but also SmartEEE.
> 
> Please stop thinking that SmartEEE is different on the link partner
> side from EEE - as far as the link partner is concerned, there is
> no difference.  The difference is all to do with the MAC side of
> the local PHY.

Thank you for clarifying how the SmartEEE is really working.

Now, the problem is that the MMD registers controlling the EEE (7.3c and 
7.3d, touched by the "eee-broken-*" property) are not the same as the 
ones for the SmartEEE (3.805b, 3.805c, 3.805d). So, is it worth to add a 
new DT property to deal also with the cases where we want to selectively 
disable the SmartEEE?

Thanks,

--
Carlo Caione
