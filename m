From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/5] ARM: STi: DT: add keyscan for stih416
Date: Mon, 10 Mar 2014 11:52:33 +0000
Message-ID: <20140310115233.GQ14976@lee--X1>
References: <1393990772-9567-1-git-send-email-gabriel.fernandez@st.com>
 <1393990772-9567-4-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1393990772-9567-4-git-send-email-gabriel.fernandez@st.com>
Sender: linux-input-owner@vger.kernel.org
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, kernel@stlinux.com, Giuseppe Condorelli <giuseppe.condorelli@st.com>
List-Id: devicetree@vger.kernel.org

> Add keyscan support for stih416.
> It is disabled by default given that it is not enabled on all boards.
> Also there are PIOs conflict with already claimed lines.
>=20
> Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  arch/arm/boot/dts/stih416-pinctrl.dtsi | 16 ++++++++++++++++
>  arch/arm/boot/dts/stih416.dtsi         | 10 ++++++++++
>  2 files changed, 26 insertions(+)

Looks good:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-input" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
