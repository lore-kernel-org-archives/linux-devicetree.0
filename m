From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 2/6] spmi: pmic-arb: convert to v2 irq interfaces to support hierarchical IRQ chips
Date: Fri, 11 Jan 2019 14:07:09 -0800
Message-ID: <154724442941.169631.5308212449003169927@swboyd.mtv.corp.google.com>
References: <20190110011258.17227-1-masneyb@onstation.org> <20190110011258.17227-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110011258.17227-3-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, andy.gross@linaro.org, bjorn.andersson@linaro.org, linus.walleij@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Brian Masney (2019-01-09 17:12:54)
> Convert the spmi-pmic-arb IRQ code to use the version 2 IRQ interface
> in order to support hierarchical IRQ chips. This is necessary so that
> spmi-gpio can be setup as a hierarchical IRQ chip with pmic-arb as the
> parent. IRQ chips in device tree should be usable from the start without
> the consumer having to make an additional call to gpio[d]_to_irq() to
> get the proper IRQ on the parent. Driver was tested on a LG Nexus 5
> (hammerhead) phone.
>=20
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v2:
> - None
>=20
> Changes since v1:
> - Add intspec variable to qpnpint_irq_domain_translate to reduce the
>   overall diff.
> - Remove irq_domain_disassociate hack.

I thought we would need to keep that around? And then dispose of the
hack later on. Won't this just wreck the world almost immediately
because the MFD is counting irqs from DT?
