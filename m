From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 2/2] ARM: dts: armada388-clearfog: add SFP module support
Date: Sun, 4 Mar 2018 15:19:28 +0200
Message-ID: <20180304131928.pxm545alwhmf5u6j@sapphire.tkos.co.il>
References: <20180227160135.GU9418@n2100.armlinux.org.uk>
 <E1eqhha-0004l3-Rd@rmk-PC.armlinux.org.uk>
 <20180304121324.ut3d3i2vpdopae7o@sapphire.tkos.co.il>
 <20180304124905.GF9418@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="4cwqguc3mevke6qq"
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180304124905.GF9418@n2100.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org


--4cwqguc3mevke6qq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Russell,

On Sun, Mar 04, 2018 at 12:49:06PM +0000, Russell King - ARM Linux wrote:
> On Sun, Mar 04, 2018 at 02:13:24PM +0200, Baruch Siach wrote:
> > On Tue, Feb 27, 2018 at 04:02:02PM +0000, Russell King wrote:
> > > Add SFP module support for Clearfog using the SFP phylink support.
> > > 
> > > Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> > 
> > Tested-by: Baruch Siach <baruch@tkos.co.il>
> > 
> > Tested on Clearfog base with kernel version 4.16-rc3. The SFP module is 1G 
> > copper Linktel LX1801CNR.
> 
> Thanks for testing.
> 
> Please also send the "ethtool -m eth2 raw on > foo.bin" output as well
> so I can build a database of module EEPROMs, which allows me to validate
> the SFP parsing code against.  Alternatively, please send the "hex on"
> if you think that's more convenient.

Here are both. Binary file md5sum: 3635c7ceff2127d4d6bf04339b657440

Offset		Values
------		------
0x0000:		03 04 00 00 00 00 08 00 00 00 00 01 0d 00 00 00 
0x0010:		00 00 64 00 4c 49 4e 4b 54 45 4c 20 20 20 20 20 
0x0020:		20 20 20 20 00 00 00 00 4c 58 31 38 30 31 43 4e 
0x0030:		52 20 20 20 20 20 20 20 31 2e 30 20 00 00 00 94 
0x0040:		00 10 00 00 31 31 37 32 36 32 33 39 32 37 20 20 
0x0050:		20 20 20 20 31 37 30 36 32 38 20 20 00 00 00 50 
0x0060:		00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
0x0070:		00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
0x0080:		ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
0x0090:		ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
0x00a0:		ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
0x00b0:		ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
0x00c0:		ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
0x00d0:		ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
0x00e0:		ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
0x00f0:		ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

--4cwqguc3mevke6qq
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="sfp.bin"
Content-Transfer-Encoding: base64

AwQAAAAACAAAAAABDQAAAAAAZABMSU5LVEVMICAgICAgICAgAAAAAExYMTgwMUNOUiAgICAg
ICAxLjAgAAAAlAAQAAAxMTcyNjIzOTI3ICAgICAgMTcwNjI4ICAAAABQAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////w==

--4cwqguc3mevke6qq
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--4cwqguc3mevke6qq--
