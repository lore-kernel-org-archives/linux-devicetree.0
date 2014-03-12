From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 4/6] pinctrl: st: Use ARRAY_SIZE instead of raw value
 for number of delays
Date: Wed, 12 Mar 2014 09:39:18 +0000
Message-ID: <20140312093918.GF5672@lee--X1>
References: <1394614210-15698-1-git-send-email-maxime.coquelin@st.com>
 <1394614210-15698-5-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394614210-15698-5-git-send-email-maxime.coquelin@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime COQUELIN <maxime.coquelin@st.com>
Cc: Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Stuart Menefy <stuart.menefy@st.com>, Linus Walleij <linus.walleij@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

> This patch replaces the raw values with ARRAY_SIZE for assigning the
> ninput_delays and noutput_delays fields of STiH416's st_pctl_data str=
uct.
>=20
> CC: Lee Jones <lee.jones@linaro.org>
> Acked-by: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Signed-off-by: Maxime Coquelin <maxime.coquelin@st.com>
> ---
>  drivers/pinctrl/pinctrl-st.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
