From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: lantiq: Remove separate GPHY Firmware loader
Date: Mon, 25 Feb 2019 22:19:53 +0000
Message-ID: <MWHPR2201MB127707BA7F4A45AE606E803BC17A0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190222201347.29242-1-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190222201347.29242-1-hauke@hauke-m.de>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
Cc: Paul Burton <pburton@wavecomp.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "john@phrozen.org" <john@phrozen.org>, "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,

Hauke Mehrtens wrote:
> The separate GPHY Firmware loader driver is not used any more, the GPHY
> firmware is now loaded by the GSWIP switch driver which also makes use
> of the GPHY.
> Remove the old unused GPHY firmware loader driver.
>=20
> The GPHY firmware is useless without an Ethernet and switch driver, it
> should not harm if loading this does not work for system using an old
> device tree.
> I am not aware of any vendor separating the device tree from the kernel
> binary, it should be ok to remove this.
>=20
> The code and the functionality form this separate GPHY firmware loader
> was added to the gswip driver in commit 14fceff4771e ("net: dsa: Add
> Lantiq / Intel DSA driver for vrx200")
>=20
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
