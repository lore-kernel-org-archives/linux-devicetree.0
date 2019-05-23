From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH 6/8] dt-bindings: net: stmmac: Convert the binding to a
 schemas
Date: Thu, 23 May 2019 11:25:09 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B92BA5B@DE02WEMBXB.internal.synopsys.com>
References: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
 <ba1a5d8ad34a8c9ab99f504c04fbe65bde42081b.1558605170.git-series.maxime.ripard@bootlin.com>
 <78EB27739596EE489E55E81C33FEC33A0B92B864@DE02WEMBXB.internal.synopsys.com>
 <20190523110715.ckyzpec3quxr26cp@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190523110715.ckyzpec3quxr26cp@flea>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Jose Abreu <Jose.Abreu@synopsys.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, =?iso-8859-1?Q?Antoine_T=E9nart?= <antoine.tenart@bootlin.com>
List-Id: devicetree@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Thu, May 23, 2019 at 12:07:15

> You can then run make dtbs_check, and those YAML files will be used to
> validate that any devicetree using those properties are doing it
> properly. That implies having the right node names, properties, types,
> ranges of values when relevant, and so on.

Thanks but how can one that's developing know which bindings it shall use=20
? Is this not parsed/prettified and displayed in some kind of webpage ?

Just that now that the TXT is gone its kind of "strange" to look at YAML=20
instead of plain text and develop/use the bindings.

Thanks,
Jose Miguel Abreu
