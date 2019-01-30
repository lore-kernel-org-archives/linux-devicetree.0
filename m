From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 0/3] at803x: Add quirk to disable SmartEEE
Date: Wed, 30 Jan 2019 10:47:09 +0000
Message-ID: <20190130104709.ganb2vuvzbxqkmxy@e5254000004ec.dyn.armlinux.org.uk>
References: <20190125130612.npknjuzjmny4yohg@e5254000004ec.dyn.armlinux.org.uk>
 <20190125184330.dm3kaoewvbwddacy@xps>
 <a8b8e82f-2b68-ed9d-6106-0542dddc1181@gmail.com>
 <20190125191947.um4w4e5jpsv2kcxc@e5254000004ec.dyn.armlinux.org.uk>
 <3e09ef54-f817-2659-4e9e-74a88a80cbcc@gmail.com>
 <20190128104620.3e724lfm5xv5il4x@xps>
 <20190128155739.yyftnu7a5hz6if7d@e5254000004ec.dyn.armlinux.org.uk>
 <9118a1cc-7ad7-cdfc-4925-d609efbc8265@gmail.com>
 <20190128190401.zzus6m6fjxpyf36d@e5254000004ec.dyn.armlinux.org.uk>
 <5b7fa0ee-eea9-d92f-5cdf-6c1b83a61c89@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5b7fa0ee-eea9-d92f-5cdf-6c1b83a61c89@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>
Cc: mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com, robh+dt@kernel.org, abailon@baylibre.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, aisheng.dong@nxp.com, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 30, 2019 at 10:16:39AM +0000, Carlo Caione wrote:
> On 28/01/2019 19:04, Russell King - ARM Linux admin wrote:
> 
> Hi Russell,
> 
> > There is no "advertisement of SmartEEE" - it's just EEE.  That is
> > because as far as the link partner is concerned, SmartEEE is just
> > EEE.
> > 
> > Carlio posted a link to one of the datasheets for the family.  In
> > there, it describes the EEE capability register, which describes
> > what is supported, and the EEE wake error counter register.
> > 
> > It also describes the EEE advertisement and link parter advertisement
> > registers.
> > 
> > All these registers correspond to the 802.3 section 45 defined MMD
> > and address offsets found in Clause 45 compliant PHYs, and these
> > registers control not only EEE but also SmartEEE.
> > 
> > Please stop thinking that SmartEEE is different on the link partner
> > side from EEE - as far as the link partner is concerned, there is
> > no difference.  The difference is all to do with the MAC side of
> > the local PHY.
> 
> Thank you for clarifying how the SmartEEE is really working.
> 
> Now, the problem is that the MMD registers controlling the EEE (7.3c and
> 7.3d, touched by the "eee-broken-*" property) are not the same as the ones
> for the SmartEEE (3.805b, 3.805c, 3.805d). So, is it worth to add a new DT
> property to deal also with the cases where we want to selectively disable
> the SmartEEE?

That's because you're confusing what the registers are.  Please take
the time to read the data sheet for the AR803x devices, and the 802.3
specifications, and you will save yourself from asking a lot of
questions by email.

7.3c (or 7.60 in decimal) is the EEE advertisement register.  This is
  what gets sent _to_ the link partner.

7.3d (or 7.61 in decimal) is the EEE link partner ability register.
  This is what the link partner sent to us _from_ its own EEE
  advertisement register.

The eee-broken-* properties allow the EEE advertisement to be altered,
thereby preventing EEE being negotiated for the various link modes.
Disabling EEE for a particular link mode means that EEE (in any form)
will not operate while the link is operating at that speed.

3.805b, 3.805c, 3.805d in the AR803x family are specifically to do
with the SmartEEE implementation.

3.805b controls how much time between the link waking up and buffered
  data already received from the MAC being sent.
3.805c controls the time from the last activity to entering low power
  mode, additional bits in 3.805d.
3.805d contains the SmartEEE enable bit, as well as the additional bits
  from 3.805c.

Most of these registers are only useful when you have a MAC that has no
EEE functionality - that is where SmartEEE can be enabled to provide the
power savings, and in order to implement EEE, there are various timeouts
required by the protocol.  SmartEEE allows these timeouts to be
programmed via the above register.

When using a MAC that has EEE functionality, SmartEEE should be disabled
via 3.805d to allow _full_ 802.3az EEE (from local MAC to link partner)
to operate, rather than SmartEEE (from local PHY to link partner.)

Otherwise, using the existing "eee-broken-*" properties to disable the
link modes where EEE fails would be the correct way forward, and should
be used in preference to disabling SmartEEE.

However, no one has mentioned what the problem that is trying to be
addressed.  Is it data corruption?  Is it that the link fails?  Is it
lost packets?  Is it that the MAC supports EEE?  I think there needs to
be some better understanding of the problem at hand before trying to
address it.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
