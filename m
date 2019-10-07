From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: net: adi: Fix yaml verification issue
Date: Mon, 7 Oct 2019 08:56:05 -0500
Message-ID: <CAL_JsqKFUTwjJefQvQE5aFmeJButYSLKm0RSpCHjSL=7pQHtxQ@mail.gmail.com>
References: <20191007102552.19808-1-alexandre.torgue@st.com> <20191007102552.19808-3-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007102552.19808-3-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Ripard <mripard@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Alexandru Ardelean <alexaundru.ardelean@analog.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, netdev <netdev@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 7, 2019 at 5:26 AM Alexandre Torgue <alexandre.torgue@st.com> wrote:
>
> This commit fixes an issue seen during yaml check ("make dt_binding_check").
> Each enum were not declared as uint32.
>
> "Documentation/devicetree/bindings/net/adi,adin.yaml:
> properties:adi,rx-internal-delay-ps:
> ..., 'enum': [1600, 1800, 2000, 2200, 2400], 'default': 2000}
> is not valid under any of the given schemas"

You need to update dtschema. I fixed this in the meta-schema last
week. Any property with a standard property unit suffix has a defined
type already, so we don't need to define it again here.

I also added '-bits' to standard units.

Rob
