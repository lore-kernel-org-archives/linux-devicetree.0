From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH v2 1/2] ARM: at91: dts: add isi & ov2640 dt nodes for
 at91sam9m10g45ek board
Date: Thu, 30 Jul 2015 14:03:54 +0200
Message-ID: <55BA12AA.3030102@atmel.com>
References: <1434449315-9243-1-git-send-email-josh.wu@atmel.com> <20150618154537.GM27492@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150618154537.GM27492@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Josh Wu <josh.wu@atmel.com>
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Andrew Victor <linux@maxim.org.za>
List-Id: devicetree@vger.kernel.org

Le 18/06/2015 17:45, Alexandre Belloni a =E9crit :
> Hi,
>=20
> Seems good to me, a small comment below:
>=20
> On 16/06/2015 at 18:08:34 +0800, Josh Wu wrote :
>> @@ -1068,8 +1076,12 @@
>>  				clocks =3D <&isi_clk>;
>>  				clock-names =3D "isi_clk";
>>  				pinctrl-names =3D "default";
>> -				pinctrl-0 =3D <&pinctrl_isi>;
>> +				pinctrl-0 =3D <&pinctrl_isi_data_0_7>;
>=20
> I would say that the pinctrl is board specific so both pinctrl-names =
and
> pinctrl-0 should go to at91sam9m10g45ek.dts

I move it in the board file.

Otherwise:
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

and stacked on top of at91-4.3-dt.

Bye,
--=20
Nicolas Ferre
