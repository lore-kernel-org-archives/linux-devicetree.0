From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clk: Add bindings for Fixed MMIO clock
Date: Wed, 14 Nov 2018 14:36:27 -0800
Message-ID: <154223498711.88331.11553475442681784637@swboyd.mtv.corp.google.com>
References: <1B94C733-F941-4403-9498-4BBB35B25345@global.cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1B94C733-F941-4403-9498-4BBB35B25345@global.cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Janek Kotas <jank@cadence.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Janek Kotas (2018-11-14 07:24:21)
> +
> +Required properties:
> +- compatible : shall be "fixed-mmio-clock".
> +- #clock-cells : from common clock binding; shall be set to 0.
> +- reg : Address and length of the clock value register set.
> +
> +Optional properties:
> +- clock-output-names : From common clock binding.
> +
> +Example:
> +sysclock: sysclock@fd020004 {
> +       #clock-cells =3D <0>;
> +       compatible =3D "fixed-mmio-clock";
> +       reg =3D <0xfd020004 0x4>;

Unfortunately this looks wrong and seems to be a way to split up a
hardware IP block into many little DT nodes to describe clks inside of a
clock controller. We don't do that style of clk drivers anymore.
