From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: regulator: Fix yaml verification for
 fixed-regulator schema
Date: Mon, 7 Oct 2019 08:08:18 -0500
Message-ID: <CAL_JsqL3sAwjKAJPZbbqg8k_R80kE9d9nbBaxWGt76RCMVMZFQ@mail.gmail.com>
References: <20191007102552.19808-1-alexandre.torgue@st.com> <20191007102552.19808-4-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007102552.19808-4-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Ripard <mripard@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Alexandru Ardelean <alexaundru.ardelean@analog.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, netdev <netdev@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 7, 2019 at 5:26 AM Alexandre Torgue <alexandre.torgue@st.com> wrote:
>
> This commit fixes an issue seen during yaml check ("make dt_binding_check").
> Compatible didn't seem to be seen as a string.
>
> Reported issue:
> "properties:compatible:enum:0: {'const': 'regulator-fixed'}
> is not of type 'string'"
> And
> "properties:compatible:enum:1: {'const': 'regulator-fixed-clock'}
> is not of type 'string'"
>
> Fixes: 9c86d003d620 ("dt-bindings: regulator: add regulator-fixed-clock binding")
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

There's already a fix queued up.

Rob
