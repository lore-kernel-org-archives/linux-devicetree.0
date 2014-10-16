From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 0/5] Berlin BG2 AHCI and SATA PHY
Date: Thu, 16 Oct 2014 14:53:25 +0200
Message-ID: <20141016125325.GA17079@kwain>
References: <1413042073-14253-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413042073-14253-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

On Sat, Oct 11, 2014 at 05:41:08PM +0200, Sebastian Hesselbarth wrote:
> This patch set catches up with latest Berlin improvements provided
> by Antoine - in particular SATA PHY support and AHCI generic for
> Berlin BG2.
>=20
> Marvell BSP code for BG2 suggests more differences between the two
> PHY revisions found on BG2 and BG2Q, but the only important one seems
> to be the PHY_BASE used in AHCI vendor-specific registers. I also
> confirmed that power_off does indeed power off the PHY on BG2, too
> (It wasn't very clear in BSP code).
>=20
> Anyway, I have tested this on BG2-based Sony NSZ-GS7 and attached
> SATA HDD is successfully detected and partitions are displayed.
>=20
> The patches are currently based on next-20141009 and I plan to resend
> once v3.18-rc1 drops. A branch based on next-20141009 with this patch=
es
> applied can be found on
>=20
> git://git.infradead.org/users/hesselba/linux-berlin.git devel/bg2-sat=
a-v1
>=20
> Patch 1 prepares phy-berlin-sata to support different PHY_BASE addres=
ses
> by moving the constant to driver private data.
>=20
> Patches 2 and 3 add a new compatible to driver and DT documentation t=
hat
> reflects the differences between BG2Q and BG2 SATA PHY.
>=20
> Patches 4 and 5 finally add DT nodes to both Berlin2 SoC dtsi and Son=
y
> NSZ-GS7 board DT file. SATA plug on NSZ-GS7 is unpopulated but can be
> very easily equipped with SATA receptable and some 0402 caps. I decid=
ed
> to enable SATA by default although not all users may populate it.

Apart for the little comment, you can add:
Acked-by : Antoine Tenart <antoine.tenart@free-electrons.com>

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
