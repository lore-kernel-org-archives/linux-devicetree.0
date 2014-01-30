From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [RFC] dtc: add ability to make nodes conditional on them being
 referenced
Date: Thu, 30 Jan 2014 13:44:48 +0100
Message-ID: <20140130134448.682ab850@ipc1.ka-ro>
References: <1578575.rVWgTPdq1W@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1578575.rVWgTPdq1W@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

Heiko St=C3=BCbner wrote:
> From: Heiko Stuebner <heiko.stuebner@bqreaders.com>
>=20
> On i.MX, which carries a lot of pin-groups of which most are unused o=
n
> individual boards, they noticed that this plehora of nodes also resul=
ts
> in the runtime-lookup-performance also degrading [0].
>=20
> A i.MX-specific solution defining the pingroups in the board files bu=
t
> using macros to reference the pingroup-data was not well received
>=20
> This patch is trying to solve this issue in a more general way, by
> adding the ability to mark nodes as needing to be referenced somewher=
e
> in the tree.
>=20
> To mark a node a needing to be referenced it must be prefixed with
> /delete-unreferenced/. This makes dtc check the nodes reference-statu=
s
> when creating the flattened tree, dropping it if unreferenced.
>=20
> For example, the i.MX6SL pingroup
>=20
> 	/delete-uneferenced/ pinctrl_ecspi1_1: ecspi1grp-1 {
                 ^^
s/unef/unref/
not really important here, but bad for copy/pasters


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
