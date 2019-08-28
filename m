From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 05/15] arm: dts: msm8974: thermal: Add thermal zones for each sensor
Date: Tue, 27 Aug 2019 17:32:21 -0700
Message-ID: <5d65cb96.1c69fb81.2e8ad.2450@mx.google.com>
References: <cover.1566907161.git.amit.kucheria@linaro.org> <5b26d4410b50387fcacae939d97f9f75853e69ea.1566907161.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5b26d4410b50387fcacae939d97f9f75853e69ea.1566907161.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, agross@kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, marc.w.gonzalez@free.fr, masneyb@onstation.org
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Amit Kucheria (2019-08-27 05:14:01)
> msm8974 has 11 sensors connected to a single TSENS IP. Define a thermal
> zone for each of those sensors to expose the temperature of each zone.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Tested-by: Brian Masney <masneyb@onstation.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
