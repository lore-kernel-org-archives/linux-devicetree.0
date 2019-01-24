From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert fixed-clock binding to json-schema
Date: Thu, 24 Jan 2019 14:50:31 -0800
Message-ID: <154837023198.136743.2813500611695220769@swboyd.mtv.corp.google.com>
References: <20190110221903.3990-4-robh@kernel.org> <154722865051.169631.16957443589975628047@swboyd.mtv.corp.google.com> <CAL_JsqJzNBYCMWbZtR37eZd4yx2kc590V+q3603Hg=kG2bZwhw@mail.gmail.com> <154723284041.169631.6622751321828044091@swboyd.mtv.corp.google.com> <CAL_JsqJFyC3AXwbd8PoJS1wZ5BSokAPcFi=4FF2DQ6yFi0XwCw@mail.gmail.com> <154724656826.169631.7419387360923471292@swboyd.mtv.corp.google.com> <CABGGiswYYpm-7T9e6F_Mp6FdU-JFDC8xV_JR1E6cgiz32A0u_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABGGiswYYpm-7T9e6F_Mp6FdU-JFDC8xV_JR1E6cgiz32A0u_Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring (2019-01-11 15:09:58)
>=20
> make dtbs_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/file/=
to/test
>=20
> It will check only the schema specified and check all the DT files
> against only that schema (plus any referenced schema if you use a
> top-level 'allOf'. See the GIC schema patch[2] for an example of
> that).
>=20
> I'm running the schema check for patches in the DT patchwork instance.
> For example, here's this patch[1]. So as long as it has my R-by, then
> it should be good. I'm not yet running the schema check on DT files
> because generally there are warnings and I don't intend to fix them
> for everyone. But maybe I should anyways so we at least have the data.
>=20

Ok. I'll apply this patch to clk-next with my small fixes rolled in.
