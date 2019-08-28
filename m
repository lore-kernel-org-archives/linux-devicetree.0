From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 06/15] arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
Date: Tue, 27 Aug 2019 17:32:38 -0700
Message-ID: <5d65cba7.1c69fb81.a9cde.25a1@mx.google.com>
References: <cover.1566907161.git.amit.kucheria@linaro.org> <f32c05c08669a9a886935149ac40423cd7001dfb.1566907161.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f32c05c08669a9a886935149ac40423cd7001dfb.1566907161.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, agross@kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, marc.w.gonzalez@free.fr, masneyb@onstation.org
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Amit Kucheria (2019-08-27 05:14:02)
> msm8916 uses sensors 0, 1, 2, 4 and 5. Sensor 3 is NOT used. Fixup the
> device tree so that the correct sensor ID is used and as a result we can
> actually check the temperature for the cpu2_3 sensor.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
