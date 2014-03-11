From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/5] pinctrl: st: Enhance the controller to manage
 unavailable registers
Date: Tue, 11 Mar 2014 11:13:26 +0000
Message-ID: <20140311111326.GB21216@lee--X1>
References: <1394203251-25361-1-git-send-email-maxime.coquelin@st.com>
 <1394203251-25361-3-git-send-email-maxime.coquelin@st.com>
 <20140310091707.GD14976@lee--X1>
 <531EC6C0.4080202@st.com>
 <531EEBB9.1050405@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <531EEBB9.1050405@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime Coquelin <maxime.coquelin@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, kernel@stlinux.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> >>>From: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> >>>
> >>>This patch adds a new logic inside the st pinctrl to manage
> >>>an unsupported scenario: some sysconfig are not available!
> >>>
> >>>This is the case of STiH407 where, although documented, the
> >>>following registers from SYSCFG_FLASH have been removed from the S=
oC.
> >>>
> >>>SYSTEM_CONFIG3040
> >>>    Output Enable pad control for all PIO Alternate Functions
> >>>and
> >>>SYSTEM_ CONFIG3050
> >>>    Pull Up pad control for all PIO Alternate Functions
> >>>
> >>>Without managing this condition an imprecise external abort
> >>>will be detect.
> >>>
> >>>To do this the patch also reviews the st_parse_syscfgs
> >>>and other routines to manipulate the registers only if
> >>>actually available.
> >>>In any case, for example the st_parse_syscfgs detected
> >>>an error condition but no action was made in the
> >>>st_pctl_probe_dt.
> >>>
> >>>Signed-off-by: Maxime Coquelin <maxime.coquelin@st.com>
> >>>Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> >>>+
> >>>+static struct regmap_field *st_pc_get_value(struct device *dev,
> >>>+                        struct regmap *regmap, int bank,
> >>>+                        int data, int lsb, int msb)
> >>>+{
> >>>+    struct reg_field reg =3D REG_FIELD((data + bank) * 4, lsb, ms=
b);
> >>>+
> >>>+    if (data < 0)
> >>>+        return NULL;
> >>
> >>What happens is data < 0 and it's used in REG_FIELD?
> >Nothing bad, but I agree this is not crystal clear.
> >
> >>Would it make more sense to make this check before calling REG_FIEL=
D?
> >Yes, it will be done in the v4.
>=20
> Finally, I have to keep it as it was if I want this patch to compile.

Ah, why's that?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
