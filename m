From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 2/4] ARM: dts: Fix STi boards compatibles
Date: Tue, 20 May 2014 13:18:25 +0100
Message-ID: <20140520121825.GM24991@lee--X1>
References: <1400579192-17620-1-git-send-email-maxime.coquelin@st.com>
 <1400579192-17620-3-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1400579192-17620-3-git-send-email-maxime.coquelin@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime COQUELIN <maxime.coquelin@st.com>
Cc: Olof Johansson <olof@lixom.net>, Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

On Tue, 20 May 2014, Maxime COQUELIN wrote:

> The compatible strings have to be ordered from specific to generic.
> This patch fixes this for STi boards, which did the exact opposite.
>=20
> Cc: Olof Johansson <olof@lixom.net>
> Signed-off-by: Maxime Coquelin <maxime.coquelin@st.com>
> ---
>  arch/arm/boot/dts/stih415-b2000.dts | 2 +-
>  arch/arm/boot/dts/stih415-b2020.dts | 2 +-
>  arch/arm/boot/dts/stih416-b2000.dts | 3 +--
>  arch/arm/boot/dts/stih416-b2020.dts | 3 +--
>  4 files changed, 4 insertions(+), 6 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
