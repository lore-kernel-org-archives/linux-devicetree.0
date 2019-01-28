From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 0/3] at803x: Add quirk to disable SmartEEE
Date: Mon, 28 Jan 2019 19:23:49 +0100
Message-ID: <9118a1cc-7ad7-cdfc-4925-d609efbc8265@gmail.com>
References: <20190125125513.23656-1-ccaione@baylibre.com>
 <20190125130612.npknjuzjmny4yohg@e5254000004ec.dyn.armlinux.org.uk>
 <20190125184330.dm3kaoewvbwddacy@xps>
 <a8b8e82f-2b68-ed9d-6106-0542dddc1181@gmail.com>
 <20190125191947.um4w4e5jpsv2kcxc@e5254000004ec.dyn.armlinux.org.uk>
 <3e09ef54-f817-2659-4e9e-74a88a80cbcc@gmail.com>
 <20190128104620.3e724lfm5xv5il4x@xps>
 <20190128155739.yyftnu7a5hz6if7d@e5254000004ec.dyn.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190128155739.yyftnu7a5hz6if7d@e5254000004ec.dyn.armlinux.org.uk>
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
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Carlo Caione <ccaione@baylibre.com>
Cc: mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, abailon@baylibre.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, aisheng.dong@nxp.com, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On 28.01.2019 16:57, Russell King - ARM Linux admin wrote:
> On Mon, Jan 28, 2019 at 10:46:20AM +0000, Carlo Caione wrote:
>> On 25/01/19 20:27, Heiner Kallweit wrote:
>>> OK, then the description of the referenced patch isn't fully correct
>>> and SmartEEE and EEE are partially compatible, and the problem is
>>> just that we don't know exactly to which extent.
>>
>> Reading from the datasheet at [0] it seems that SmartEEE is compatible with
>> EEE but it's something different.
> 
> As I understand it, SmartEEE is just like normal EEE as far as the link
> partner is concerned.  The difference is between the PHY and MAC.  What
> follows is a simplified understanding of the differences.
> 
> In conventional EEE, the MAC takes part in EEE - the local MAC requests
> that its attached PHY enters LPI mode, which signals to the link partner
> PHY that the data stream on the link is going to pause.  When the local
> MAC wants to transmit, it first has to signal to the attached PHY that
> the link should be woken up, and the MAC has to wait for the link to
> exit LPI before transmitting.
> 
> With SmartEEE, the decision to enter LPI mode is taken not by the local
> MAC but by the PHY instead, since SmartEEE is designed to produce power
> savings for MACs that do not support LPI.  Of course, they won't achieve
> the same power saving as real EEE, but they do help to reduce the power
> dissipation in the PHY.
> 
> PHYs that support this buffer some data from the MAC, and that buffering
> has to be sufficient for the delay in the link coming out of LPI mode
> without losing data.
> 
> As far as the link partner is concerned, EEE and SmartEEE appear the
> same.
> 
>> With SmartEEE the PHY can actually enter LPI state even if this is not
>> supported by the link partner since the LPI pattern is generated inside the
>> PHY itself, so auto-implementing a sort of EEE.
> 
> It sounds to me like you have this the wrong way round.  SmartEEE isn't
> about the link partner not supporting LPI, it's about the local MAC not
> supporting EEE, but still getting some power savings.
> 
> EEE (of either kind) can only be entered on the link when both the
> local PHY and remote PHY indicate support for EEE, and have negotiated
> that they support EEE.
> 
> Most of the power dissipation is from driving the signals into the
> network cable (which is a lossy environment) to ensure that the far
> end has sufficient signal to keep the link established.  SmartEEE is
> about giving a way to enter 802.3az EEE mode on the _cable_ with a
> MAC that does not support EEE.
> 
> I've monitored the signals on a link with an Atheros AR8035 with
> SmartEEE mode enabled, and a Marvell 88e1514 PHY in a Marvell switch
> on the other end, and seen the signals on the cable quiesce as a
> result of SmartEEE, but only when _both_ partners are set to allow
> EEE in the negotiated link mode.
> 

If SmartEEE is compatible with EEE on a PHY level, then I'd expect that
advertisement of SmartEEE at different speeds can be controlled via the
standard EEE MMD regs. Is this the case?
