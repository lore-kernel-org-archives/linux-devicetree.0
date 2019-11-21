Return-Path: <SRS0=OHRJ=ZN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2D4C432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 16:53:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BB3E206CB
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 16:53:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4GC3MeK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbfKUQxb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 Nov 2019 11:53:31 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:32801 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfKUQxb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 Nov 2019 11:53:31 -0500
Received: by mail-qt1-f193.google.com with SMTP id y39so4460590qty.0
        for <devicetree@vger.kernel.org>; Thu, 21 Nov 2019 08:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tw1KIKPOzLJOLINVI8jeUsGRli5jn6rxdUQMuLrtbqg=;
        b=e4GC3MeKrEDMy2Z5+ZepS71hZvuwKRdOQrowB8Onh9EjqNXWEgTTQy7RljCFDSkm/n
         XbgAgkdYuVJc2X5zEFYymlnmRPQaZa+opUedJ8Glf9HYtPjh93GKfSyDTT2EQp1qWN4H
         g3ZbEJ9u4Gm4tKZXrlVGV9BfPxaOOY8qZgWu/9jOF0rDO8OSO6C8w3QZatb8wV8zwF59
         9XQgQws2XTfqe26v+o+cs/uLU1pLDfUz7TcSxmKcJ/idUuW2P8cDpLaX07Eaztp5ZykC
         w+N7St79Sbb+ZbZCkQTaDx1wD/UVnw0ldqwDdFeZy6urGJp4+bHUZS3X89OFikVVN1Uy
         GI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tw1KIKPOzLJOLINVI8jeUsGRli5jn6rxdUQMuLrtbqg=;
        b=YxhO9xDhu2mjbo1AAZWUhK8rSNFCp8Ecx3KHLwQh2Rt/3TdSeIuQY+MkSzJnQRfg7o
         gUUfNaxxgWTqgHdr11I6GFWxXmiHajLM7yOsScl4c9un7xsyoxTEI03wLiPlLaapehCZ
         qhcS0JgF8FTjBu/ZgEEsKaWoSzS2QW7mqBrxnPYCQrIxQHjHWX3SxmbOJqiZzyfLHVm7
         0cOYsd18VntxFAscwkLjxV2cFcjesxjiIMSVX1WctZfcLJdn2YSbIpc6N8B2WGW/Xz2q
         JtdFJPPKA/Uh7UjzRzbiZwLx815ueGGAASGU5E3yAv+da/VFiyf2IuoCxUpGLZ0kBMec
         J22A==
X-Gm-Message-State: APjAAAVa0IYIKV/8YBMpc/ys82d2WNEQMCcvoNu6fr/NrEgJ0dwJ8DLR
        vi4J+0vvkaCtb6X8jDhmVbUEEtHE8SxMpP4lfjs=
X-Google-Smtp-Source: APXvYqyHoEst8VBgUI9ixqf55DtN1jPvh/PoeZC41KcuUNedF3GFMk2exyCOPqldxBNUcYnbxW6Ba9DnBXyxcbX+wcc=
X-Received: by 2002:ac8:1494:: with SMTP id l20mr9493012qtj.356.1574355208716;
 Thu, 21 Nov 2019 08:53:28 -0800 (PST)
MIME-Version: 1.0
References: <1570436549-8694-1-git-send-email-uli@fpond.eu>
 <1570436549-8694-3-git-send-email-uli@fpond.eu> <7e974fa0-3ead-7f54-52a2-31f84cc0766a@gmail.com>
In-Reply-To: <7e974fa0-3ead-7f54-52a2-31f84cc0766a@gmail.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Thu, 21 Nov 2019 17:53:17 +0100
Message-ID: <CAFqH_51bBV=xJQ+30kSeiNJnX6Ga9kKsQrj5CoHayh5+-Ghj4Q@mail.gmail.com>
Subject: Re: [PATCH v20 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Ulrich Hecht <uli@fpond.eu>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Mark Rutland <mark.rutland@arm.com>, stonea168@163.com,
        Ajay Kumar <ajaykumar.rs@samsung.com>, architt@codeaurora.org,
        Vincent Palatin <vpalatin@chromium.org>,
        cawa cheng <cawa.cheng@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Pawel Moll <pawel.moll@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= 
        <eddie.huang@mediatek.com>,
        Rahul Sharma <rahul.sharma@samsung.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Kumar Gala <galak@codeaurora.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

cc'ing  the drm/bridge maintainers which I think are missing (Andrzej
Hajda and Neil Armstrong)

Missatge de Matthias Brugger <matthias.bgg@gmail.com> del dia dl., 7
d=E2=80=99oct. 2019 a les 13:04:
>
>
>
> On 07/10/2019 10:22, Ulrich Hecht wrote:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> >
> > This patch adds drm_bridge driver for parade DSI to eDP bridge chip.
> >
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
> > Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > [uli: followed API changes, removed FW update feature]
> > Signed-off-by: Ulrich Hecht <uli@fpond.eu>
>
> Now it works, thanks for pushing this forward :)
>
> Tested-by: Matthias Brugger <matthias.bgg@gmail.com>
>

This bridge is really needed in case you have an Acer Chromebook R13,
otherwise, you don't have the display working. Would be nice have it
upstream :-), If it helps, I tested this patch on top of current
5.4-rc8 and I get the display working, so

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Thanks,
 Enric

> > ---
> >
> > Changes since v19:
> >  - fixed return value of ps8640_probe() when no panel is found
> >
> > Changes since v18:
> >  - followed DRM API changes
> >  - use DEVICE_ATTR_RO()
> >  - remove firmware update code
> >  - add SPDX identifier
> >
> > Changes since v17:
> >  - remove some unused head files.
> >  - add macros for ps8640 pages.
> >  - remove ddc_i2c client
> >  - add mipi_dsi_device_register_full
> >  - remove the manufacturer from the name and i2c_device_id
> >
> > Changes since v16:
> >  - Disable ps8640 DSI MCS Function.
> >  - Rename gpios name more clearly.
> >  - Tune the ps8640 power on sequence.
> >
> > Changes since v15:
> >  - Drop drm_connector_(un)register calls from parade ps8640.
> >    The main DRM driver mtk_drm_drv now calls
> >    drm_connector_register_all() after drm_dev_register() in the
> >    mtk_drm_bind() function. That function should iterate over all
> >    connectors and call drm_connector_register() for each of them.
> >    So, remove drm_connector_(un)register calls from parade ps8640.
> >
> > Changes since v14:
> >  - update copyright info.
> >  - change bridge_to_ps8640 and connector_to_ps8640 to inline function.
> >  - fix some coding style.
> >  - use sizeof as array counter.
> >  - use drm_get_edid when read edid.
> >  - add mutex when firmware updating.
> >
> > Changes since v13:
> >  - add const on data, ps8640_write_bytes(struct i2c_client *client, con=
st u8 *data, u16 data_len)
> >  - fix PAGE2_SW_REST tyro.
> >  - move the buf[3] init to entrance of the function.
> >
> > Changes since v12:
> >  - fix hw_chip_id build warning
> >
> > Changes since v11:
> >  - Remove depends on I2C, add DRM depends
> >  - Reuse ps8640_write_bytes() in ps8640_write_byte()
> >  - Use timer check for polling like the routines in <linux/iopoll.h>
> >  - Fix no drm_connector_unregister/drm_connector_cleanup when ps8640_br=
idge_attach fail
> >  - Check the ps8640 hardware id in ps8640_validate_firmware
> >  - Remove fw_version check
> >  - Move ps8640_validate_firmware before ps8640_enter_bl
> >  - Add ddc_i2c unregister when probe fail and ps8640_remove
> >
> >
> >  drivers/gpu/drm/bridge/Kconfig         |  12 +
> >  drivers/gpu/drm/bridge/Makefile        |   1 +
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 672 +++++++++++++++++++++++++=
++++++++
> >  3 files changed, 685 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/parade-ps8640.c
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kc=
onfig
> > index 1cc9f50..61c6415 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -82,6 +82,18 @@ config DRM_PARADE_PS8622
> >       ---help---
> >         Parade eDP-LVDS bridge chip driver.
> >
> > +config DRM_PARADE_PS8640
> > +     tristate "Parade PS8640 MIPI DSI to eDP Converter"
> > +     depends on DRM
> > +     depends on OF
> > +     select DRM_KMS_HELPER
> > +     select DRM_MIPI_DSI
> > +     select DRM_PANEL
> > +     help
> > +       Choose this option if you have PS8640 for display
> > +       The PS8640 is a high-performance and low-power
> > +       MIPI DSI to eDP converter
> > +
> >  config DRM_SIL_SII8620
> >       tristate "Silicon Image SII8620 HDMI/MHL bridge"
> >       depends on OF
> > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/M=
akefile
> > index 4934fcf..14660ab 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_LVDS_ENCODER) +=3D lvds-encoder.o
> >  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) +=3D megachips-stdpx=
xxx-ge-b850v3-fw.o
> >  obj-$(CONFIG_DRM_NXP_PTN3460) +=3D nxp-ptn3460.o
> >  obj-$(CONFIG_DRM_PARADE_PS8622) +=3D parade-ps8622.o
> > +obj-$(CONFIG_DRM_PARADE_PS8640) +=3D parade-ps8640.o
> >  obj-$(CONFIG_DRM_SIL_SII8620) +=3D sil-sii8620.o
> >  obj-$(CONFIG_DRM_SII902X) +=3D sii902x.o
> >  obj-$(CONFIG_DRM_SII9234) +=3D sii9234.o
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/b=
ridge/parade-ps8640.c
> > new file mode 100644
> > index 0000000..ac27010
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -0,0 +1,672 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2016 MediaTek Inc.
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/firmware.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <asm/unaligned.h>
> > +#include <drm/drm_panel.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_edid.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#define PAGE1_VSTART         0x6b
> > +#define PAGE2_SPI_CFG3               0x82
> > +#define I2C_TO_SPI_RESET     0x20
> > +#define PAGE2_ROMADD_BYTE1   0x8e
> > +#define PAGE2_ROMADD_BYTE2   0x8f
> > +#define PAGE2_SWSPI_WDATA    0x90
> > +#define PAGE2_SWSPI_RDATA    0x91
> > +#define PAGE2_SWSPI_LEN              0x92
> > +#define PAGE2_SWSPI_CTL              0x93
> > +#define TRIGGER_NO_READBACK  0x05
> > +#define TRIGGER_READBACK     0x01
> > +#define PAGE2_SPI_STATUS     0x9e
> > +#define SPI_READY            0x0c
> > +#define PAGE2_GPIO_L         0xa6
> > +#define PAGE2_GPIO_H         0xa7
> > +#define PS_GPIO9             BIT(1)
> > +#define PAGE2_IROM_CTRL              0xb0
> > +#define IROM_ENABLE          0xc0
> > +#define IROM_DISABLE         0x80
> > +#define PAGE2_SW_RESET               0xbc
> > +#define SPI_SW_RESET         BIT(7)
> > +#define MPU_SW_RESET         BIT(6)
> > +#define PAGE2_ENCTLSPI_WR    0xda
> > +#define PAGE2_I2C_BYPASS     0xea
> > +#define I2C_BYPASS_EN                0xd0
> > +#define PAGE2_MCS_EN         0xf3
> > +#define MCS_EN                       BIT(0)
> > +#define PAGE3_SET_ADD                0xfe
> > +#define PAGE3_SET_VAL                0xff
> > +#define VDO_CTL_ADD          0x13
> > +#define VDO_DIS                      0x18
> > +#define VDO_EN                       0x1c
> > +#define PAGE4_REV_L          0xf0
> > +#define PAGE4_REV_H          0xf1
> > +#define PAGE4_CHIP_L         0xf2
> > +#define PAGE4_CHIP_H         0xf3
> > +
> > +#define PAGE0_DP_CNTL        0
> > +#define PAGE1_VDO_BDG        1
> > +#define PAGE2_TOP_CNTL       2
> > +#define PAGE3_DSI_CNTL1      3
> > +#define PAGE4_MIPI_PHY       4
> > +#define PAGE5_VPLL   5
> > +#define PAGE6_DSI_CNTL2      6
> > +#define PAGE7_SPI_CNTL       7
> > +#define MAX_DEVS             0x8
> > +
> > +struct ps8640_info {
> > +     u8 family_id;
> > +     u8 variant_id;
> > +     u16 version;
> > +};
> > +
> > +struct ps8640 {
> > +     struct drm_connector connector;
> > +     struct drm_bridge bridge;
> > +     struct edid *edid;
> > +     struct mipi_dsi_device *dsi;
> > +     struct i2c_client *page[MAX_DEVS];
> > +     struct regulator_bulk_data supplies[2];
> > +     struct drm_panel *panel;
> > +     struct gpio_desc *gpio_reset;
> > +     struct gpio_desc *gpio_power_down;
> > +     struct gpio_desc *gpio_mode_sel;
> > +     bool enabled;
> > +
> > +     /* firmware file info */
> > +     struct ps8640_info info;
> > +     bool in_fw_update;
> > +     /* for firmware update protect */
> > +     struct mutex fw_mutex;
> > +};
> > +
> > +static const u8 enc_ctrl_code[6] =3D { 0xaa, 0x55, 0x50, 0x41, 0x52, 0=
x44 };
> > +static const u8 hw_chip_id[4] =3D { 0x00, 0x0a, 0x00, 0x30 };
> > +
> > +static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
> > +{
> > +     return container_of(e, struct ps8640, bridge);
> > +}
> > +
> > +static inline struct ps8640 *connector_to_ps8640(struct drm_connector =
*e)
> > +{
> > +     return container_of(e, struct ps8640, connector);
> > +}
> > +
> > +static int ps8640_read(struct i2c_client *client, u8 reg, u8 *data,
> > +                    u16 data_len)
> > +{
> > +     int ret;
> > +     struct i2c_msg msgs[] =3D {
> > +             {
> > +              .addr =3D client->addr,
> > +              .flags =3D 0,
> > +              .len =3D 1,
> > +              .buf =3D &reg,
> > +             },
> > +             {
> > +              .addr =3D client->addr,
> > +              .flags =3D I2C_M_RD,
> > +              .len =3D data_len,
> > +              .buf =3D data,
> > +             }
> > +     };
> > +
> > +     ret =3D i2c_transfer(client->adapter, msgs, 2);
> > +
> > +     if (ret =3D=3D 2)
> > +             return 0;
> > +     if (ret < 0)
> > +             return ret;
> > +     else
> > +             return -EIO;
> > +}
> > +
> > +static int ps8640_write_bytes(struct i2c_client *client, const u8 *dat=
a,
> > +                           u16 data_len)
> > +{
> > +     int ret;
> > +     struct i2c_msg msg;
> > +
> > +     msg.addr =3D client->addr;
> > +     msg.flags =3D 0;
> > +     msg.len =3D data_len;
> > +     msg.buf =3D (u8 *)data;
> > +
> > +     ret =3D i2c_transfer(client->adapter, &msg, 1);
> > +     if (ret =3D=3D 1)
> > +             return 0;
> > +     if (ret < 0)
> > +             return ret;
> > +     else
> > +             return -EIO;
> > +}
> > +
> > +static int ps8640_write_byte(struct i2c_client *client, u8 reg,  u8 da=
ta)
> > +{
> > +     u8 buf[] =3D { reg, data };
> > +
> > +     return ps8640_write_bytes(client, buf, sizeof(buf));
> > +}
> > +
> > +static void ps8640_get_mcu_fw_version(struct ps8640 *ps_bridge)
> > +{
> > +     struct i2c_client *client =3D ps_bridge->page[PAGE5_VPLL];
> > +     u8 fw_ver[2];
> > +
> > +     ps8640_read(client, 0x4, fw_ver, sizeof(fw_ver));
> > +     ps_bridge->info.version =3D (fw_ver[0] << 8) | fw_ver[1];
> > +
> > +     DRM_INFO_ONCE("ps8640 rom fw version %d.%d\n", fw_ver[0], fw_ver[=
1]);
> > +}
> > +
> > +static int ps8640_bridge_unmute(struct ps8640 *ps_bridge)
> > +{
> > +     struct i2c_client *client =3D ps_bridge->page[PAGE3_DSI_CNTL1];
> > +     u8 vdo_ctrl_buf[3] =3D { PAGE3_SET_ADD, VDO_CTL_ADD, VDO_EN };
> > +
> > +     return ps8640_write_bytes(client, vdo_ctrl_buf, sizeof(vdo_ctrl_b=
uf));
> > +}
> > +
> > +static int ps8640_bridge_mute(struct ps8640 *ps_bridge)
> > +{
> > +     struct i2c_client *client =3D ps_bridge->page[PAGE3_DSI_CNTL1];
> > +     u8 vdo_ctrl_buf[3] =3D { PAGE3_SET_ADD, VDO_CTL_ADD, VDO_DIS };
> > +
> > +     return ps8640_write_bytes(client, vdo_ctrl_buf, sizeof(vdo_ctrl_b=
uf));
> > +}
> > +
> > +static void ps8640_pre_enable(struct drm_bridge *bridge)
> > +{
> > +     struct ps8640 *ps_bridge =3D bridge_to_ps8640(bridge);
> > +     struct i2c_client *client =3D ps_bridge->page[PAGE2_TOP_CNTL];
> > +     struct i2c_client *page1 =3D ps_bridge->page[PAGE1_VDO_BDG];
> > +     int err;
> > +     u8 set_vdo_done, mcs_en, vstart;
> > +     ktime_t timeout;
> > +
> > +     if (ps_bridge->in_fw_update)
> > +             return;
> > +
> > +     if (ps_bridge->enabled)
> > +             return;
> > +
> > +     err =3D drm_panel_prepare(ps_bridge->panel);
> > +     if (err < 0) {
> > +             DRM_ERROR("failed to prepare panel: %d\n", err);
> > +             return;
> > +     }
> > +
> > +     err =3D regulator_bulk_enable(ARRAY_SIZE(ps_bridge->supplies),
> > +                                 ps_bridge->supplies);
> > +     if (err < 0) {
> > +             DRM_ERROR("cannot enable regulators %d\n", err);
> > +             goto err_panel_unprepare;
> > +     }
> > +
> > +     gpiod_set_value(ps_bridge->gpio_power_down, 1);
> > +     gpiod_set_value(ps_bridge->gpio_reset, 0);
> > +     usleep_range(2000, 2500);
> > +     gpiod_set_value(ps_bridge->gpio_reset, 1);
> > +
> > +     /*
> > +      * Wait for the ps8640 embed mcu ready
> > +      * First wait 200ms and then check the mcu ready flag every 20ms
> > +      */
> > +     msleep(200);
> > +
> > +     timeout =3D ktime_add_ms(ktime_get(), 200);
> > +     for (;;) {
> > +             err =3D ps8640_read(client, PAGE2_GPIO_H, &set_vdo_done, =
1);
> > +             if (err < 0) {
> > +                     DRM_ERROR("failed read PAGE2_GPIO_H: %d\n", err);
> > +                     goto err_regulators_disable;
> > +             }
> > +             if ((set_vdo_done & PS_GPIO9) =3D=3D PS_GPIO9)
> > +                     break;
> > +             if (ktime_compare(ktime_get(), timeout) > 0)
> > +                     break;
> > +             msleep(20);
> > +     }
> > +
> > +     msleep(50);
> > +
> > +     ps8640_read(page1, PAGE1_VSTART, &vstart, 1);
> > +     DRM_INFO("PS8640 PAGE1.0x6B =3D 0x%x\n", vstart);
> > +
> > +     /**
> > +      * The Manufacturer Command Set (MCS) is a device dependent inter=
face
> > +      * intended for factory programming of the display module default
> > +      * parameters. Once the display module is configured, the MCS sha=
ll be
> > +      * disabled by the manufacturer. Once disabled, all MCS commands =
are
> > +      * ignored by the display interface.
> > +      */
> > +     ps8640_read(client, PAGE2_MCS_EN, &mcs_en, 1);
> > +     ps8640_write_byte(client, PAGE2_MCS_EN, mcs_en & ~MCS_EN);
> > +
> > +     if (ps_bridge->info.version =3D=3D 0)
> > +             ps8640_get_mcu_fw_version(ps_bridge);
> > +
> > +     err =3D ps8640_bridge_unmute(ps_bridge);
> > +     if (err)
> > +             DRM_ERROR("failed to enable unmutevideo: %d\n", err);
> > +     /* Switch access edp panel's edid through i2c */
> > +     ps8640_write_byte(client, PAGE2_I2C_BYPASS, I2C_BYPASS_EN);
> > +     ps_bridge->enabled =3D true;
> > +
> > +     return;
> > +
> > +err_regulators_disable:
> > +     regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
> > +                            ps_bridge->supplies);
> > +err_panel_unprepare:
> > +     drm_panel_unprepare(ps_bridge->panel);
> > +}
> > +
> > +static void ps8640_enable(struct drm_bridge *bridge)
> > +{
> > +     struct ps8640 *ps_bridge =3D bridge_to_ps8640(bridge);
> > +     int err;
> > +
> > +     err =3D drm_panel_enable(ps_bridge->panel);
> > +     if (err < 0)
> > +             DRM_ERROR("failed to enable panel: %d\n", err);
> > +}
> > +
> > +static void ps8640_disable(struct drm_bridge *bridge)
> > +{
> > +     struct ps8640 *ps_bridge =3D bridge_to_ps8640(bridge);
> > +     int err;
> > +
> > +     err =3D drm_panel_disable(ps_bridge->panel);
> > +     if (err < 0)
> > +             DRM_ERROR("failed to disable panel: %d\n", err);
> > +}
> > +
> > +static void ps8640_post_disable(struct drm_bridge *bridge)
> > +{
> > +     struct ps8640 *ps_bridge =3D bridge_to_ps8640(bridge);
> > +     int err;
> > +
> > +     if (ps_bridge->in_fw_update)
> > +             return;
> > +
> > +     if (!ps_bridge->enabled)
> > +             return;
> > +
> > +     ps_bridge->enabled =3D false;
> > +
> > +     err =3D ps8640_bridge_mute(ps_bridge);
> > +     if (err < 0)
> > +             DRM_ERROR("failed to unmutevideo: %d\n", err);
> > +
> > +     gpiod_set_value(ps_bridge->gpio_reset, 0);
> > +     gpiod_set_value(ps_bridge->gpio_power_down, 0);
> > +     err =3D regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
> > +                                  ps_bridge->supplies);
> > +     if (err < 0)
> > +             DRM_ERROR("cannot disable regulators %d\n", err);
> > +
> > +     err =3D drm_panel_unprepare(ps_bridge->panel);
> > +     if (err)
> > +             DRM_ERROR("failed to unprepare panel: %d\n", err);
> > +}
> > +
> > +static int ps8640_get_modes(struct drm_connector *connector)
> > +{
> > +     struct ps8640 *ps_bridge =3D connector_to_ps8640(connector);
> > +     struct edid *edid;
> > +     int num_modes =3D 0;
> > +     bool power_off;
> > +
> > +     if (ps_bridge->edid)
> > +             return drm_add_edid_modes(connector, ps_bridge->edid);
> > +
> > +     power_off =3D !ps_bridge->enabled;
> > +     ps8640_pre_enable(&ps_bridge->bridge);
> > +
> > +     edid =3D drm_get_edid(connector, ps_bridge->page[0]->adapter);
> > +     if (!edid)
> > +             goto out;
> > +
> > +     ps_bridge->edid =3D edid;
> > +     drm_connector_update_edid_property(connector, ps_bridge->edid);
> > +     num_modes =3D drm_add_edid_modes(connector, ps_bridge->edid);
> > +
> > +out:
> > +     if (power_off)
> > +             ps8640_post_disable(&ps_bridge->bridge);
> > +
> > +     return num_modes;
> > +}
> > +
> > +static const struct drm_connector_helper_funcs ps8640_connector_helper=
_funcs =3D {
> > +     .get_modes =3D ps8640_get_modes,
> > +};
> > +
> > +static enum drm_connector_status ps8640_detect(struct drm_connector *c=
onnector,
> > +                                            bool force)
> > +{
> > +     return connector_status_connected;
> > +}
> > +
> > +static const struct drm_connector_funcs ps8640_connector_funcs =3D {
> > +     .fill_modes =3D drm_helper_probe_single_connector_modes,
> > +     .detect =3D ps8640_detect,
> > +     .reset =3D drm_atomic_helper_connector_reset,
> > +     .atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate=
_state,
> > +     .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_sta=
te,
> > +};
> > +
> > +int ps8640_bridge_attach(struct drm_bridge *bridge)
> > +{
> > +     struct ps8640 *ps_bridge =3D bridge_to_ps8640(bridge);
> > +     struct device *dev =3D &ps_bridge->page[0]->dev;
> > +     struct device_node *in_ep, *dsi_node =3D NULL;
> > +     struct mipi_dsi_device *dsi;
> > +     struct mipi_dsi_host *host =3D NULL;
> > +     int ret;
> > +     const struct mipi_dsi_device_info info =3D { .type =3D "ps8640",
> > +                                                .channel =3D 0,
> > +                                                .node =3D NULL,
> > +                                              };
> > +
> > +     ret =3D drm_connector_init(bridge->dev, &ps_bridge->connector,
> > +                              &ps8640_connector_funcs,
> > +                              DRM_MODE_CONNECTOR_eDP);
> > +
> > +     if (ret) {
> > +             DRM_ERROR("Failed to initialize connector with drm: %d\n"=
, ret);
> > +             return ret;
> > +     }
> > +
> > +     drm_connector_helper_add(&ps_bridge->connector,
> > +                              &ps8640_connector_helper_funcs);
> > +
> > +     ps_bridge->connector.dpms =3D DRM_MODE_DPMS_ON;
> > +     drm_connector_attach_encoder(&ps_bridge->connector,
> > +                                       bridge->encoder);
> > +
> > +     if (ps_bridge->panel)
> > +             drm_panel_attach(ps_bridge->panel, &ps_bridge->connector)=
;
> > +
> > +     /* port@0 is ps8640 dsi input port */
> > +     in_ep =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
> > +     if (in_ep) {
> > +             dsi_node =3D of_graph_get_remote_port_parent(in_ep);
> > +             of_node_put(in_ep);
> > +     }
> > +
> > +     if (dsi_node) {
> > +             host =3D of_find_mipi_dsi_host_by_node(dsi_node);
> > +             of_node_put(dsi_node);
> > +             if (!host) {
> > +                     ret =3D -ENODEV;
> > +                     goto err;
> > +             }
> > +     }
> > +
> > +     dsi =3D mipi_dsi_device_register_full(host, &info);
> > +     if (IS_ERR(dsi)) {
> > +             dev_err(dev, "failed to create dsi device\n");
> > +             ret =3D PTR_ERR(dsi);
> > +             goto err;
> > +     }
> > +
> > +     ps_bridge->dsi =3D dsi;
> > +
> > +     dsi->host =3D host;
> > +     dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO |
> > +                                  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> > +     dsi->format =3D MIPI_DSI_FMT_RGB888;
> > +     dsi->lanes =3D 4;
> > +     ret =3D mipi_dsi_attach(dsi);
> > +     if (ret)
> > +             goto err_dsi_attach;
> > +
> > +     return 0;
> > +
> > +err_dsi_attach:
> > +     mipi_dsi_device_unregister(dsi);
> > +err:
> > +     if (ps_bridge->panel)
> > +             drm_panel_detach(ps_bridge->panel);
> > +     drm_connector_cleanup(&ps_bridge->connector);
> > +     return ret;
> > +}
> > +
> > +static const struct drm_bridge_funcs ps8640_bridge_funcs =3D {
> > +     .attach =3D ps8640_bridge_attach,
> > +     .disable =3D ps8640_disable,
> > +     .post_disable =3D ps8640_post_disable,
> > +     .pre_enable =3D ps8640_pre_enable,
> > +     .enable =3D ps8640_enable,
> > +};
> > +
> > +/* Firmware Version is returned as Major.Minor */
> > +static ssize_t fw_version_show(struct device *dev,
> > +                                   struct device_attribute *attr, char=
 *buf)
> > +{
> > +     struct ps8640 *ps_bridge =3D dev_get_drvdata(dev);
> > +     struct ps8640_info *info =3D &ps_bridge->info;
> > +
> > +     return scnprintf(buf, PAGE_SIZE, "%u.%u\n", info->version >> 8,
> > +                      info->version & 0xff);
> > +}
> > +
> > +/* Hardware Version is returned as FamilyID.VariantID */
> > +static ssize_t hw_version_show(struct device *dev,
> > +                                   struct device_attribute *attr, char=
 *buf)
> > +{
> > +     struct ps8640 *ps_bridge =3D dev_get_drvdata(dev);
> > +     struct ps8640_info *info =3D &ps_bridge->info;
> > +
> > +     return scnprintf(buf, PAGE_SIZE, "ps%u.%u\n", info->family_id,
> > +                      info->variant_id);
> > +}
> > +
> > +static DEVICE_ATTR_RO(fw_version);
> > +static DEVICE_ATTR_RO(hw_version);
> > +
> > +static struct attribute *ps8640_attrs[] =3D {
> > +     &dev_attr_fw_version.attr,
> > +     &dev_attr_hw_version.attr,
> > +     NULL
> > +};
> > +
> > +static const struct attribute_group ps8640_attr_group =3D {
> > +     .attrs =3D ps8640_attrs,
> > +};
> > +
> > +static void ps8640_remove_sysfs_group(void *data)
> > +{
> > +     struct ps8640 *ps_bridge =3D data;
> > +
> > +     sysfs_remove_group(&ps_bridge->page[0]->dev.kobj, &ps8640_attr_gr=
oup);
> > +}
> > +
> > +static int ps8640_probe(struct i2c_client *client,
> > +                     const struct i2c_device_id *id)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct ps8640 *ps_bridge;
> > +     struct device_node *np =3D dev->of_node;
> > +     struct device_node *port, *out_ep;
> > +     struct device_node *panel_node =3D NULL;
> > +     int ret;
> > +     u32 i;
> > +
> > +     ps_bridge =3D devm_kzalloc(dev, sizeof(*ps_bridge), GFP_KERNEL);
> > +     if (!ps_bridge)
> > +             return -ENOMEM;
> > +
> > +     /* port@1 is ps8640 output port */
> > +     port =3D of_graph_get_port_by_id(np, 1);
> > +     if (port) {
> > +             out_ep =3D of_get_child_by_name(port, "endpoint");
> > +             of_node_put(port);
> > +             if (out_ep) {
> > +                     panel_node =3D of_graph_get_remote_port_parent(ou=
t_ep);
> > +                     of_node_put(out_ep);
> > +             }
> > +     }
> > +     if (panel_node) {
> > +             ps_bridge->panel =3D of_drm_find_panel(panel_node);
> > +             of_node_put(panel_node);
> > +             if (IS_ERR(ps_bridge->panel))
> > +                     return PTR_ERR(ps_bridge->panel);
> > +     }
> > +
> > +     mutex_init(&ps_bridge->fw_mutex);
> > +     ps_bridge->supplies[0].supply =3D "vdd33";
> > +     ps_bridge->supplies[1].supply =3D "vdd12";
> > +     ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(ps_bridge->suppli=
es),
> > +                                   ps_bridge->supplies);
> > +     if (ret) {
> > +             dev_info(dev, "failed to get regulators: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ps_bridge->gpio_mode_sel =3D devm_gpiod_get_optional(&client->dev=
,
> > +                                                          "mode-sel",
> > +                                                          GPIOD_OUT_HI=
GH);
> > +     if (IS_ERR(ps_bridge->gpio_mode_sel)) {
> > +             ret =3D PTR_ERR(ps_bridge->gpio_mode_sel);
> > +             dev_err(dev, "cannot get mode-sel %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ps_bridge->gpio_power_down =3D devm_gpiod_get(&client->dev, "slee=
p",
> > +                                            GPIOD_OUT_LOW);
> > +     if (IS_ERR(ps_bridge->gpio_power_down)) {
> > +             ret =3D PTR_ERR(ps_bridge->gpio_power_down);
> > +             dev_err(dev, "cannot get sleep: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     /*
> > +      * Request the reset pin low to avoid the bridge being
> > +      * initialized prematurely
> > +      */
> > +     ps_bridge->gpio_reset =3D devm_gpiod_get(&client->dev, "reset",
> > +                                            GPIOD_OUT_LOW);
> > +     if (IS_ERR(ps_bridge->gpio_reset)) {
> > +             ret =3D PTR_ERR(ps_bridge->gpio_reset);
> > +             dev_err(dev, "cannot get reset: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ps_bridge->bridge.funcs =3D &ps8640_bridge_funcs;
> > +     ps_bridge->bridge.of_node =3D dev->of_node;
> > +
> > +     ps_bridge->page[0] =3D client;
> > +
> > +     /*
> > +      * ps8640 uses multiple addresses, use dummy devices for them
> > +      * page[0]: for DP control
> > +      * page[1]: for VIDEO Bridge
> > +      * page[2]: for control top
> > +      * page[3]: for DSI Link Control1
> > +      * page[4]: for MIPI Phy
> > +      * page[5]: for VPLL
> > +      * page[6]: for DSI Link Control2
> > +      * page[7]: for spi rom mapping
> > +      */
> > +     for (i =3D 1; i < MAX_DEVS; i++) {
> > +             ps_bridge->page[i] =3D i2c_new_dummy(client->adapter,
> > +                                                client->addr + i);
> > +             if (!ps_bridge->page[i]) {
> > +                     dev_err(dev, "failed i2c dummy device, address%02=
x\n",
> > +                             client->addr + i);
> > +                     ret =3D -EBUSY;
> > +                     goto exit_dummy;
> > +             }
> > +     }
> > +     i2c_set_clientdata(client, ps_bridge);
> > +
> > +     ret =3D sysfs_create_group(&client->dev.kobj, &ps8640_attr_group)=
;
> > +     if (ret) {
> > +             dev_err(dev, "failed to create sysfs entries: %d\n", ret)=
;
> > +             goto exit_dummy;
> > +     }
> > +
> > +     ret =3D devm_add_action(dev, ps8640_remove_sysfs_group, ps_bridge=
);
> > +     if (ret) {
> > +             dev_err(dev, "failed to add sysfs cleanup action: %d\n", =
ret);
> > +             goto exit_remove_sysfs;
> > +     }
> > +
> > +     drm_bridge_add(&ps_bridge->bridge);
> > +     return 0;
> > +
> > +exit_remove_sysfs:
> > +     sysfs_remove_group(&ps_bridge->page[0]->dev.kobj, &ps8640_attr_gr=
oup);
> > +exit_dummy:
> > +     while (--i)
> > +             i2c_unregister_device(ps_bridge->page[i]);
> > +     return ret;
> > +}
> > +
> > +static int ps8640_remove(struct i2c_client *client)
> > +{
> > +     struct ps8640 *ps_bridge =3D i2c_get_clientdata(client);
> > +     int i =3D MAX_DEVS;
> > +
> > +     drm_bridge_remove(&ps_bridge->bridge);
> > +     sysfs_remove_group(&ps_bridge->page[0]->dev.kobj, &ps8640_attr_gr=
oup);
> > +     while (--i)
> > +             i2c_unregister_device(ps_bridge->page[i]);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct i2c_device_id ps8640_i2c_table[] =3D {
> > +     { "ps8640", 0 },
> > +     { /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(i2c, ps8640_i2c_table);
> > +
> > +static const struct of_device_id ps8640_match[] =3D {
> > +     { .compatible =3D "parade,ps8640" },
> > +     { /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, ps8640_match);
> > +
> > +static struct i2c_driver ps8640_driver =3D {
> > +     .id_table =3D ps8640_i2c_table,
> > +     .probe =3D ps8640_probe,
> > +     .remove =3D ps8640_remove,
> > +     .driver =3D {
> > +             .name =3D "ps8640",
> > +             .of_match_table =3D ps8640_match,
> > +     },
> > +};
> > +module_i2c_driver(ps8640_driver);
> > +
> > +MODULE_AUTHOR("Jitao Shi <jitao.shi@mediatek.com>");
> > +MODULE_AUTHOR("CK Hu <ck.hu@mediatek.com>");
> > +MODULE_DESCRIPTION("PARADE ps8640 DSI-eDP converter driver");
> > +MODULE_LICENSE("GPL v2");
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
