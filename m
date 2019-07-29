From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: opp: Introduce opp-peak-KBps and opp-avg-KBps bindings
Date: Mon, 29 Jul 2019 10:23:15 -0700
Message-ID: <20190729172316.56A5A206DD@mail.kernel.org>
References: <20190726231558.175130-1-saravanak@google.com> <20190726231558.175130-2-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726231558.175130-2-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Georgi Djakov <georgi.djakov@linaro.org>, vincent.guittot@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, adharmap@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, sibis@codeaurora.org, bjorn.andersson@linaro.org, evgreen@chromium.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Saravana Kannan (2019-07-26 16:15:55)
> diff --git a/Documentation/devicetree/bindings/opp/opp.txt b/Documentatio=
n/devicetree/bindings/opp/opp.txt
> index 76b6c79604a5..b1eb49d6eab0 100644
> --- a/Documentation/devicetree/bindings/opp/opp.txt
> +++ b/Documentation/devicetree/bindings/opp/opp.txt
> @@ -83,9 +83,14 @@ properties.
> =20
>  Required properties:
>  - opp-hz: Frequency in Hz, expressed as a 64-bit big-endian integer. Thi=
s is a
> -  required property for all device nodes but devices like power domains.=
 The
> -  power domain nodes must have another (implementation dependent) proper=
ty which
> -  uniquely identifies the OPP nodes.
> +  required property for all device nodes but for devices like power doma=
ins or

s/but/except/

> +  bandwidth opp tables. The power domain nodes must have another (implem=
entation
> +  dependent) property which uniquely identifies the OPP nodes. The inter=
connect
> +  opps are required to have the opp-peak-KBps property.
> +
> +- opp-peak-KBps: Peak bandwidth in kilobytes per second, expressed as a =
32-bit
> +  big-endian integer. This is a required property for all devices that d=
on't
> +  have opp-hz. For example, bandwidth OPP tables for interconnect paths.
> =20
>  Optional properties:
>  - opp-microvolt: voltage in micro Volts.
> @@ -132,6 +137,10 @@ Optional properties:
>  - opp-level: A value representing the performance level of the device,
>    expressed as a 32-bit integer.
> =20
> +- opp-avg-KBps: Average bandwidth in kilobytes per second, expressed as a

Shouldn't that be a lower case k? kBps?

> +  32-bit big-endian integer. This property is only meaningful in OPP tab=
les
> +  where opp-peak-KBps is present.
> +
>  - clock-latency-ns: Specifies the maximum possible transition latency (in
>    nanoseconds) for switching to this OPP from any other OPP.
> =20
> diff --git a/Documentation/devicetree/bindings/property-units.txt b/Docum=
entation/devicetree/bindings/property-units.txt
> index e9b8360b3288..ef4c4a199efa 100644
> --- a/Documentation/devicetree/bindings/property-units.txt
> +++ b/Documentation/devicetree/bindings/property-units.txt
> @@ -41,3 +41,7 @@ Temperature
>  Pressure
>  ----------------------------------------
>  -kpascal       : kilopascal
> +
> +Throughput
> +----------------------------------------
> +-KBps          : kilobytes per second

Same comment.
