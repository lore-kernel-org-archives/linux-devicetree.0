From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 0/1] Compact interface for Device-Tree
Date: Sat, 1 Nov 2014 05:13:45 +0800
Message-ID: <CAL_JsqLtkiiyisxSG_qBknmz6n2qDKUdpwM-ZY3tH3wgYSrO1w@mail.gmail.com>
References: <1414709964-27284-1-git-send-email-gavidov@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414709964-27284-1-git-send-email-gavidov@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Gilad Avidov <gavidov@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sagar Dharia <sdharia@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 31, 2014 at 6:59 AM, Gilad Avidov <gavidov@codeaurora.org> =
wrote:
>
> Device-Tree compact API
> ------------------------
>
> Common code seen in driver=E2=80=99s probe reads device tree values a=
nd handling
> erroneous return codes from all those of_property_read_xxx()  APIs. T=
his
> common code is factored out by the of_property_map module which allow=
s
> driver=E2=80=99s probe to replace that (often lengthy) code with a co=
ncise table:
>
> struct of_prop_map map[] =3D {
>     {"i2c",            &dev->id,        OF_REQ,  OF_ID,  -1},
>     {"qcom,clk-freq-out",    &dev->clk_freq_out,    OF_REQ,  OF_U32, =
 0},
>     {"qcom,clk-freq-in",    &dev->clk_freq_in,    OF_REQ,  OF_U32,  0=
},
>     {"qcom,disable-dma",    &dev->disable_dma,    OF_OPT,  OF_BOOL, 0=
},
>     {"qcom,master-id",    &dev->mstr_id,        OF_SGST, OF_U32,  0},
>     {NULL,            NULL,            0,       0,       0},
> };
>
> Then call populate to read the values into the device=E2=80=99s varia=
bles:
>
> ret =3D of_prop_populate(dev, dev->of_node, map);

Interesting idea. The main concern I have with this is there has been
on-going discussions about how to generalize property handling across
DT and ACPI to make drivers more agnostic, so I'm copying a few folks
involved in that. That may be a bit orthogonal to what this is doing,
but we may want some coordination here.

BTW, there is little point to a 0/1 email. All this info should be in
the patch either in commit msg or documentation as part of the patch.

Rob

> An equivalent code snippet using the traditional of_property_read_XXX=
X()
> API. Note that the equivalent is longer and more difficult to follow =
and
> debug:
>
> /* optional property */
> dev->disable_dma =3D of_property_read_bool(node, "qcom,disable-dma");
>
> ret =3D of_property_read_u32(dev->node, "qcom,clk-freq-out", &dev->cl=
k_freq_out);
> if (ret) {
>     dev_err(dev, "error: missing 'qcom,clk-freq-out' DT property\n");
>     if (!err)
>         err =3D ret;
> }
>
> ret =3D of_property_read_u32(dev->node, "qcom,clk-freq-in", &dev->clk=
_freq_in);
> if (ret) {
>     dev_err(dev, "error: missing 'qcom,clk-freq-in' DT property\n");
>     if (!err)
>         err =3D ret;
> }
>
> /* suggested property */
> ret =3D of_property_read_u32(dev->node, "qcom,master-id", &dev->mstr_=
id);
> if (ret && !err)
>     err =3D ret;
>
>
> ret =3D of_alias_get_id(dev->node, "i2c");
> if (ret < 0) {
>     dev_err(dev, "error: missing '"i2c"' DT property\n");
>     if (!err)
>         err =3D ret;
> } else {
>     dev->id =3D ret;
> }
>
>
> The Device-Tree node and alias which are read by the above code snipp=
ets:
>
> aliases {
>     i2c0 =3D &i2c_0; /* I2C0 controller device */
> };
>
> i2c_0: i2c@78b6000 { /* BLSP1 QUP2 */
>     compatible =3D "qcom,i2c-msm-v2";
>     reg-names =3D "qup_phys_addr", "bam_phys_addr";
>     reg =3D <0x78b6000 0x600>,
>           <0x7884000 0x23000>;
>     qcom,clk-freq-out =3D <100000>;
>     qcom,clk-freq-in  =3D <19200000>;
>     qcom,disable-dma;
>     qcom,master-id =3D <86>;
> };
>
>
> Gilad Avidov (1):
>   of_propery_map: compact interface for Device-Tree
>
>  Documentation/devicetree/of_property_map.txt |   76 ++++++++++++++++=
++++++
>  drivers/of/Makefile                          |    2 +-
>  drivers/of/of_property_map.c                 |   88 ++++++++++++++++=
++++++++++
>  include/linux/of_property_map.h              |   74 ++++++++++++++++=
++++++
>  4 files changed, 239 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/of_property_map.txt
>  create mode 100644 drivers/of/of_property_map.c
>  create mode 100644 include/linux/of_property_map.h
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora F=
orum,
> hosted by The Linux Foundation
>
