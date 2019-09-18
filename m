From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: documentation: add clock bindings information for Agilex
Date: Tue, 17 Sep 2019 21:51:58 -0700
Message-ID: <20190918045159.CCE9721848@mail.kernel.org>
References: <20190918013459.15966-1-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918013459.15966-1-dinguyen@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: dinguyen@kernel.org, devicetree@vger.kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, Dinh Nguyen <dinh.nguyen@intel.com>
List-Id: devicetree@vger.kernel.org

Quoting Dinh Nguyen (2019-09-17 18:34:58)
> From: Dinh Nguyen <dinh.nguyen@intel.com>
>=20
> Document the Agilex clock bindings, and add the clock header file. The
> clock header is an enumeration of all the different clocks on the Agilex
> platform.
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>

This needs a signed-off-by from your intel address as that's the author.

> ---
>  .../devicetree/bindings/clock/intc_agilex.txt | 20 ++++++
>  include/dt-bindings/clock/agilex-clock.h      | 70 +++++++++++++++++++
>  2 files changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/intc_agilex.t=
xt
>  create mode 100644 include/dt-bindings/clock/agilex-clock.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/intc_agilex.txt b/Do=
cumentation/devicetree/bindings/clock/intc_agilex.txt
> new file mode 100644
> index 000000000000..bfec71420511
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/intc_agilex.txt
> @@ -0,0 +1,20 @@
> +Device Tree Clock bindings for Intel's SoCFPGA Agilex platform
> +
> +This binding uses the common clock binding[1].

Can you write this binding in YAML? That way we can verify the simple
usage of it easily.

> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible : shall be
> +       "intel,agilex-clkmgr"
> +
> +- reg : shall be the control register offset from CLOCK_MANAGER's base f=
or the clock.

I don't quite understand what this means. What is the CLOCK_MANAGER
base for the clock? Doesn't this describe an offset to a clock
controller which provides more than one clk?

> +
> +- #clock-cells : from common clock binding, shall be set to 1.
> +
> +Example:
> +       clkmgr: clock-controller@ffd10000 {
> +               compatible =3D "intel,agilex-clkmgr";
> +               reg =3D <0xffd10000 0x1000>;
> +               #clock-cells =3D <1>;
> +       };
