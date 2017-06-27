From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v1 1/6] DT bindings: add bindings for ov965x camera module
Date: Tue, 27 Jun 2017 07:48:15 +0200
Message-ID: <39501C78-7B81-4803-94C1-25DFA06EA526@goldelico.com>
References: <1498143942-12682-1-git-send-email-hugues.fruchet@st.com> <1498143942-12682-2-git-send-email-hugues.fruchet@st.com> <D5629236-95D8-45B6-9719-E8B9796FEC90@goldelico.com> <64e3005d-31df-71f2-762b-2c1b1152fc2d@st.com> <5cd25a47-f3be-8c40-3940-29f26a245076@kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <5cd25a47-f3be-8c40-3940-29f26a245076@kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: Sylwester Nawrocki <snawrocki@kernel.org>
Cc: Hugues FRUCHET <hugues.fruchet@st.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick FERTRE <yannick.fertre@st.com>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org


> Am 26.06.2017 um 22:04 schrieb Sylwester Nawrocki =
<snawrocki@kernel.org>:
>=20
> On 06/26/2017 12:35 PM, Hugues FRUCHET wrote:
>>> What I am missing to support the GTA04 camera is the control of the =
optional "vana-supply".
>>> So the driver does not power up the camera module when needed and =
therefore probing fails.
>>>=20
>>>    - vana-supply: a regulator to power up the camera module.
>>>=20
>>> Driver code is not complex to add:
>=20
>> Yes, I saw it in your code, but as I don't have any programmable =
power
>> supply on my setup, I have not pushed this commit.
>=20
> Since you are about to add voltage supplies to the DT binding I'd =
suggest
> to include all three voltage supplies of the sensor chip. Looking at =
the OV9650
> and the OV9655 datasheet there are following names used for the =
voltage supply
> pins:
>=20
> AVDD - Analog power supply,
> DVDD - Power supply for digital core logic,
> DOVDD - Digital power supply for I/O.

The latter two are usually not independently switchable from the SoC =
power
the module is connected to.

And sometimes DVDD and DOVDD are connected together.

So the driver can't make much use of knowing or requesting them because =
the
1.8V supply is always active, even during suspend.

>=20
> I doubt the sensor can work without any of these voltage supplies, =
thus
> regulator_get_optional() should not be used. I would just use the =
regulator
> bulk API to handle all three power supplies.

The digital part works with AVDD turned off. So the LDO supplying AVDD =
should
be switchable to save power (&vaux3 on the GTA04 device).

But not all designs can switch it off. Hence the idea to define it as an
/optional/ regulator. If it is not defined by DT, the driver simply =
assumes
it is always powered on.

So in summary we only need AVDD switched for the GTA04 - but it does not
matter if the others are optional properties. We would not use them.

It does matter if they are mandatory because it adds DT complexity (size
and processing) without added function.

BR and thanks,
Nikolaus
