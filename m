From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] ARM: dts: imx6dl: SolidRun: add phy node with 100Mb/s
 max-speed
Date: Sun, 15 Sep 2019 09:30:00 +0300
Message-ID: <87muf6oyvr.fsf@tarshish>
References: <20190910155507.491230-1-tinywrkb@gmail.com>
 <20190910185033.GD9761@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20190910185033.GD9761@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, tinywrkb <tinywrkb@gmail.com>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Tue, Sep 10 2019, Andrew Lunn wrote:
> On Tue, Sep 10, 2019 at 06:55:07PM +0300, tinywrkb wrote:
>> Cubox-i Solo/DualLite carrier board has 100Mb/s magnetics while the
>> Atheros AR8035 PHY on the MicroSoM v1.3 CPU module is a 1GbE PHY device.
>>
>> Since commit 5502b218e001 ("net: phy: use phy_resolve_aneg_linkmode in
>> genphy_read_status") ethernet is broken on Cubox-i Solo/DualLite devices.
>
> Hi Tinywrkb
>
> You emailed lots of people, but missed the PHY maintainers :-(
>
> Are you sure this is the patch which broken it? Did you do a git
> bisect.

Tinywrkb confirmed to me in private communication that revert of
5502b218e001 fixes Ethernet for him on effected system.

He also referred me to an old Cubox-i spec that lists 10/100 Ethernet
only for i.MX6 Solo/DualLite variants of Cubox-i. It turns out that
there was a plan to use a different 10/100 PHY for Solo/DualLite
SOMs. This plan never materialized. All SolidRun i.MX6 SOMs use the same
AR8035 PHY that supports 1Gb.

Commit 5502b218e001 might be triggering a hardware issue on the affected
Cubox-i. I could not reproduce the issue here with Cubox-i and a Dual
SOM variant running v5.3-rc8. I have no Solo/DualLite variant handy at
the moment.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
