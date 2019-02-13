From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: remove unused definition for stm32mp1
Date: Wed, 13 Feb 2019 13:02:03 -0800
Message-ID: <155009172384.115909.11842128085275839689@swboyd.mtv.corp.google.com>
References: <20190213100714.15622-1-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213100714.15622-1-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting gabriel.fernandez@st.com (2019-02-13 02:07:14)
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>=20
> LTDC_K and ETHMAC_K are not used.

Ok, but do they exist? It's part of the binding so I don't see how it
hurts anything to describe what is there.

Also, please send patches to the linux-clk mailing list so patch
tracking can work.
