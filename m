From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 2/6] pinctrl: st: Enhance the controller to manage
 unavailable registers
Date: Wed, 12 Mar 2014 09:38:25 +0000
Message-ID: <20140312093825.GE5672@lee--X1>
References: <1394614210-15698-1-git-send-email-maxime.coquelin@st.com>
 <1394614210-15698-3-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394614210-15698-3-git-send-email-maxime.coquelin@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime COQUELIN <maxime.coquelin@st.com>
Cc: Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Stuart Menefy <stuart.menefy@st.com>, Linus Walleij <linus.walleij@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

> From: Giuseppe Cavallaro <peppe.cavallaro@st.com>
>=20
> This patch adds a new logic inside the st pinctrl to manage
> an unsupported scenario: some sysconfig are not available!
>=20
> This is the case of STiH407 where, although documented, the
> following registers from SYSCFG_FLASH have been removed from the SoC.
>=20
> SYSTEM_CONFIG3040
>    Output Enable pad control for all PIO Alternate Functions
> and
> SYSTEM_ CONFIG3050
>    Pull Up pad control for all PIO Alternate Functions
>=20
> Without managing this condition an imprecise external abort
> will be detect.
>=20
> To do this the patch also reviews the st_parse_syscfgs
> and other routines to manipulate the registers only if
> actually available.
> In any case, for example the st_parse_syscfgs detected
> an error condition but no action was made in the
> st_pctl_probe_dt.
>=20
> Acked-by: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Acked-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>
> Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Signed-off-by: Maxime Coquelin <maxime.coquelin@st.com>
> ---
>  drivers/pinctrl/pinctrl-st.c | 104 +++++++++++++++++++++++++--------=
----------
>  1 file changed, 61 insertions(+), 43 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
