From: Carlo Caione <ccaione@baylibre.com>
Subject: Re: [PATCH 0/3] at803x: Add quirk to disable SmartEEE
Date: Fri, 25 Jan 2019 18:48:46 +0000
Message-ID: <20190125184330.dm3kaoewvbwddacy@xps>
References: <20190125125513.23656-1-ccaione@baylibre.com>
 <20190125130612.npknjuzjmny4yohg@e5254000004ec.dyn.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190125130612.npknjuzjmny4yohg@e5254000004ec.dyn.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, abailon@baylibre.com, kernel@pengutronix.de, fabio.estevam@nxp.com, hkallweit1@gmail.com, shawnguo@kernel.org, aisheng.dong@nxp.com, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On 25/01/19 13:06, Russell King - ARM Linux admin wrote:
>On Fri, Jan 25, 2019 at 12:55:10PM +0000, Carlo Caione wrote:
>> SmartEEE, compatible with IEEE802.3az standard, is designed to include
>> legacy MAC without EEE capability into the power saving system. SmartEEE
>> is enabled by default configuration on AR8031 after power-on or hardware
>> reset.
>>
>> Unfortunately this is proved causing issues for certain hw
>> configurations.  We add a quirk to optionally disable SmartEEE.
>
>It may be a good idea to detail what "certain hw configurations" are
>and/or what the "issues" are, so it's easier to find this if/when
>others encounter the same issue.

This fix was upstreamed from the imx downstream kernel so I do not have 
much informations on that but something is reported in the U-Boot fix 
for the same problem at [0] so I'll add more info in the next revision.

Cheers,

[0] https://patchwork.ozlabs.org/patch/1015783/

-- 
Carlo Caione
