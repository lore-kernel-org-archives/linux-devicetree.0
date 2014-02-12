From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 0/3] of: functions to count number of elements and
 convert regulators
Date: Wed, 12 Feb 2014 09:25:29 +0000
Message-ID: <20140212092528.GA21992@e106331-lin.cambridge.arm.com>
References: <2573561.oCYNnnL0gm@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2573561.oCYNnnL0gm@phil>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: "grant.likely@linaro.org" <grant.likely@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On Tue, Feb 11, 2014 at 11:59:25PM +0000, Heiko St=C3=BCbner wrote:
> In a different thread [0] Mark Rutland suggested that drivers should =
not
> repeatedly open-code the counting of array elements in a property as =
well
> as handling the format and endianes of the DTB, as these should be li=
mited
> to the of_ helper functions.
>=20
> Therefore the first patch introduces a set of helper functions for co=
unting
> the number of u8,...,u64 elements in a property.
>=20
> The second and third patch convert the two regulator drivers that use=
 this
> pattern to instead use both of_property_count_u32_elemens as well as
> of_property_read_u32_index.
>=20
> gpio-regulator change tested on a s3c2416-based device, ti-abb-regula=
tor
> compile-tested only.

Cheers for this. All the patches look fine to me, so for the series:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks,
Mark.
