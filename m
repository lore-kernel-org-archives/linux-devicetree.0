From: Carlo Caione <ccaione@baylibre.com>
Subject: Re: [PATCH 0/3] at803x: Add quirk to disable SmartEEE
Date: Mon, 28 Jan 2019 10:46:20 +0000
Message-ID: <20190128104620.3e724lfm5xv5il4x@xps>
References: <20190125125513.23656-1-ccaione@baylibre.com>
 <20190125130612.npknjuzjmny4yohg@e5254000004ec.dyn.armlinux.org.uk>
 <20190125184330.dm3kaoewvbwddacy@xps>
 <a8b8e82f-2b68-ed9d-6106-0542dddc1181@gmail.com>
 <20190125191947.um4w4e5jpsv2kcxc@e5254000004ec.dyn.armlinux.org.uk>
 <3e09ef54-f817-2659-4e9e-74a88a80cbcc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <3e09ef54-f817-2659-4e9e-74a88a80cbcc@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, Russell King - ARM Linux admin <linux@armlinux.org.uk>, robh+dt@kernel.org, abailon@baylibre.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, aisheng.dong@nxp.com, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On 25/01/19 20:27, Heiner Kallweit wrote:

/cut
>>> Thanks for the link. According to the description SmartEEE works 
>>> only if
>>> both link partners support it (hence are Atheros PHY's). I would assume
>>> that this usually isn't the case, shouldn't the feature be an opt-in
>>> therefore?
>>
>> I'm not convinced about that - I've been using AtherOS SmartEEE with
>> i.MX6 for quite some time (I have patches which allow me to read out
>> the stats via ethtool, and configure it - they're specific to the
>> FEC driver though.)  SmartEEE works just like EEE for me, and I
>> notice no problems.
>>
>> I have i.MX6 boards connected to Netgear GS116 and similar switches,
>> and also Marvell DSA switches on other platforms.
>>
>> This is why I said above about "more detail".  Then maybe folk would
>> know what to look for to see whether there is a problem.
>>
>OK, then the description of the referenced patch isn't fully correct
>and SmartEEE and EEE are partially compatible, and the problem is
>just that we don't know exactly to which extent.

Reading from the datasheet at [0] it seems that SmartEEE is compatible 
with EEE but it's something different.

With SmartEEE the PHY can actually enter LPI state even if this is not 
supported by the link partner since the LPI pattern is generated inside 
the PHY itself, so auto-implementing a sort of EEE.

So AFAICT EEE and SmartEEE are two different things requiring two 
different properties in the DTS if we want to have the possibility to 
disable it.

Cheers,

[0] 
https://media.digikey.com/pdf/Data%20Sheets/CSR%20PDFs/AR8031_DS_(Atheros)_Rev1.0_Aug2011.pdf

-- 
Carlo Caione
