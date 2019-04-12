From: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH 0/3] at803x: Add quirk to disable SmartEEE
Date: Fri, 12 Apr 2019 03:25:54 +0300
Message-ID: <20190412002554.8880-1-olteanv@gmail.com>
References: <20190130104709.ganb2vuvzbxqkmxy@e5254000004ec.dyn.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190130104709.ganb2vuvzbxqkmxy@e5254000004ec.dyn.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux@armlinux.org.uk, ccaione@baylibre.com, f.fainelli@gmail.com, hkallweit1@gmail.com
Cc: mark.rutland@arm.com, andrew@lunn.ch, devicetree@vger.kernel.org, s.hauer@pengutronix.de, leoyang.li@nxp.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, olteanv@gmail.com, shawnguo@kernel.org, aisheng.dong@nxp.com, linux-arm-kernel@lists.infradead.org, abailon@baylibre.com
List-Id: devicetree@vger.kernel.org

On Jan. 30, 2019, 10:47 a.m., Russell King - ARM Linux admin wrote:
> On Wed, Jan 30, 2019 at 10:16:39AM +0000, Carlo Caione wrote:
> > On 28/01/2019 19:04, Russell King - ARM Linux admin wrote:
> > 
> > Hi Russell,
> > 
> > > There is no "advertisement of SmartEEE" - it's just EEE.  That is
> > > because as far as the link partner is concerned, SmartEEE is just
> > > EEE.
> > > 
> > > Carlio posted a link to one of the datasheets for the family.  In
> > > there, it describes the EEE capability register, which describes
> > > what is supported, and the EEE wake error counter register.
> > > 
> > > It also describes the EEE advertisement and link parter advertisement
> > > registers.
> > > 
> > > All these registers correspond to the 802.3 section 45 defined MMD
> > > and address offsets found in Clause 45 compliant PHYs, and these
> > > registers control not only EEE but also SmartEEE.
> > > 
> > > Please stop thinking that SmartEEE is different on the link partner
> > > side from EEE - as far as the link partner is concerned, there is
> > > no difference.  The difference is all to do with the MAC side of
> > > the local PHY.
> > 
> > Thank you for clarifying how the SmartEEE is really working.
> > 
> > Now, the problem is that the MMD registers controlling the EEE (7.3c and
> > 7.3d, touched by the "eee-broken-*" property) are not the same as the ones
> > for the SmartEEE (3.805b, 3.805c, 3.805d). So, is it worth to add a new DT
> > property to deal also with the cases where we want to selectively disable
> > the SmartEEE?
> 
> That's because you're confusing what the registers are.  Please take
> the time to read the data sheet for the AR803x devices, and the 802.3
> specifications, and you will save yourself from asking a lot of
> questions by email.
> 
> 7.3c (or 7.60 in decimal) is the EEE advertisement register.  This is
>   what gets sent _to_ the link partner.
> 
> 7.3d (or 7.61 in decimal) is the EEE link partner ability register.
>   This is what the link partner sent to us _from_ its own EEE
>   advertisement register.
> 
> The eee-broken-* properties allow the EEE advertisement to be altered,
> thereby preventing EEE being negotiated for the various link modes.
> Disabling EEE for a particular link mode means that EEE (in any form)
> will not operate while the link is operating at that speed.
> 
> 3.805b, 3.805c, 3.805d in the AR803x family are specifically to do
> with the SmartEEE implementation.
> 
> 3.805b controls how much time between the link waking up and buffered
>   data already received from the MAC being sent.
> 3.805c controls the time from the last activity to entering low power
>   mode, additional bits in 3.805d.
> 3.805d contains the SmartEEE enable bit, as well as the additional bits
>   from 3.805c.
> 
> Most of these registers are only useful when you have a MAC that has no
> EEE functionality - that is where SmartEEE can be enabled to provide the
> power savings, and in order to implement EEE, there are various timeouts
> required by the protocol.  SmartEEE allows these timeouts to be
> programmed via the above register.
> 
> When using a MAC that has EEE functionality, SmartEEE should be disabled
> via 3.805d to allow _full_ 802.3az EEE (from local MAC to link partner)
> to operate, rather than SmartEEE (from local PHY to link partner.)
> 
> Otherwise, using the existing "eee-broken-*" properties to disable the
> link modes where EEE fails would be the correct way forward, and should
> be used in preference to disabling SmartEEE.
> 
> However, no one has mentioned what the problem that is trying to be
> addressed.  Is it data corruption?  Is it that the link fails?  Is it
> lost packets?  Is it that the MAC supports EEE?  I think there needs to
> be some better understanding of the problem at hand before trying to
> address it.


Hi Russell, Heiner, Carlo, Florian,

You could have copied me when referencing the U-boot patch.

It is indeed correct that disabling regular EEE advertisement does also disable
SmartEEE. Somehow I hadn't taken this thought one step further to realize that
the regular eee-broken-1000t DT binding is enough to take care of this.

In my case it was indeed a situation of packet loss when the PHY should have
buffered it, and nobody debugged it to find the root cause. While true that the
Layerscape MACs in general need to disable EEE advertisement, in this
particular case I can't rule out an electrical issue on the PHY's voltage
rails. This is especially plausible since the MDIO interface of this PHY needed
some rework anyway, whereas the RGMII side presented no more packet loss after
disabling the PHY's low power mode.

Thank you,
-Vladimir
