Return-Path: <SRS0=uMBV=XC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:12736 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392149AbfIGLvn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 7 Sep 2019 07:51:43 -0400
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 5/6] ARM: dts: Configure interconnect target module for omap3 sgx
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7x+WxFSU4e72ESu0UUKj_RGfNCOkHS4zvjmwQVoZ_t13Nw@mail.gmail.com>
Date: Sat, 7 Sep 2019 13:51:28 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <26DDC0FB-C954-4169-AA08-E39BDDFF2E4A@goldelico.com>
References: <20190814131408.57162-1-tony@atomide.com> <20190814131408.57162-6-tony@atomide.com> <CAHCN7x+WxFSU4e72ESu0UUKj_RGfNCOkHS4zvjmwQVoZ_t13Nw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>, =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, devicetree <devicetree@vger.kernel.org>, =?utf-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, moaz korena <moaz@korena.xyz>, Merlijn Wajer <merlijn@wizzup.org>, =?utf-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, Philipp Rossak <embed3d@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>, linux-clk <linux-clk@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Adam,

> Am 19.08.2019 um 21:12 schrieb Adam Ford <aford173@gmail.com>:
>=20
> On Wed, Aug 14, 2019 at 8:14 AM Tony Lindgren <tony@atomide.com> =
wrote:
>>=20
>> Looks like omap34xx OCP registers are not readable unlike on =
omap36xx.
>> We use SGX revision register instead of the OCP revision register for
>> 34xx and do not configure any SYSCONFIG register unlike for 36xx.
>>=20
>> I've tested that the interconnect target module enables and idles
>> just fine with PM runtime control via sys:
>>=20
>> # echo on > $(find /sys -name control | grep \/5000); rwmem =
0x5000fe10
>> # rwmem 0x50000014      # SGX revision register on 36xx
>> 0x50000014 =3D 0x00010205
>=20
> For an OMAP3530, I got:
> # echo on > $(find /sys -name control | grep \/5000)
> # devmem 0x50000014
> 0x00010201
>=20
> Does 0x00010201 seem reasonable?  I am not sure where to find this in
> the TRM unless it's located elsewhere, but  [1] seems to lead me to
> believe this is correct.

I got on dm3730:

root@letux:~# echo on =
>/sys/devices/platform/68000000.ocp/5000fe00.target-module/50000000.sgx/po=
wer/control
root@letux:~# /usr/bin/arm-linux-gnueabihf/devmem2 0x50000014
/dev/mem opened.
Memory mapped at address 0xb6fc0000.
Value at address 0x50000014 (0xb6fc0014): 0x10205
root@letux:~#=20

which indicates ES5.0, as expected for dm3730.

BR,
Nikolaus
