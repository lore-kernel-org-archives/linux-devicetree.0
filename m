From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v9 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
Date: Wed, 3 Feb 2016 18:37:10 +0800
Message-ID: <CAGS+omAZpgPhxJVBXtXDNppotdMLcSydK9=CG5TWOeAAVGRcWw@mail.gmail.com>
References: <1454489288-31951-1-git-send-email-jitao.shi@mediatek.com> <1454489288-31951-2-git-send-email-jitao.shi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454489288-31951-2-git-send-email-jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, stonea168-9Onoh4P/yGk@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg@gmail>
List-Id: devicetree@vger.kernel.org

Hi Jitao,

Looks really good.

Just a couple of tiny things...



On Wed, Feb 3, 2016 at 4:48 PM, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> This patch adds drm_bridge driver for parade DSI to eDP bridge chip.
>
> Signed-off-by: Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---

[snip]

> +static int ps8640_get_modes(struct drm_connector *connector)
> +{
> +       struct ps8640 *ps_bridge = connector_to_ps8640(connector);
> +       u8 *edid;
> +       int ret, num_modes = 0;
> +       bool power_off;
> +
> +       if (ps_bridge->edid)
> +               return drm_add_edid_modes(connector, ps_bridge->edid);
> +
> +       power_off = !ps_bridge->enabled;
> +       ps8640_pre_enable(&ps_bridge->bridge);
> +
> +       edid = kmalloc(EDID_LENGTH, GFP_KERNEL);

devm_kmalloc() if you can.  Or at least kfree() in ps8640_remove


> +       if (!edid) {
> +               DRM_ERROR("Failed to allocate EDID\n");
> +               return 0;
> +       }
> +
> +       ret = ps8640_read(ps_bridge->ddc_i2c, 0, edid, EDID_LENGTH);
> +       if (ret) {
> +               kfree(edid);
> +               goto out;
> +       }
> +
> +       ps_bridge->edid = (struct edid *)edid;
> +       drm_mode_connector_update_edid_property(connector, ps_bridge->edid);
> +
> +       num_modes = drm_add_edid_modes(connector, ps_bridge->edid);
> +
> +out:
> +       if (power_off)
> +               ps8640_post_disable(&ps_bridge->bridge);
> +
> +       return num_modes;
> +}

[snip]

> +static int ps8640_spi_normal_mode(struct ps8640 *ps_bridge)
> +{
> +       u8 cmd[2];
> +       struct i2c_client *client = ps_bridge->page[2];
> +
> +       /* Enable-Write-Status-Register */
> +       cmd[0] = WRITE_ENABLE_CMD;
> +       ps8640_spi_send_cmd(ps_bridge, cmd, 1);
> +
> +       /* protect BPL/BP0/BP1 */
> +       cmd[0] = WRITE_STATUS_REG_CMD;
> +       cmd[1] = BLK_PROTECT_BITS | STATUS_REG_PROTECT;
> +       ps8640_spi_send_cmd(ps_bridge, cmd, 2);
> +
> +       /* wait for SPI rom ready */
> +       ps8640_wait_rom_idle(ps_bridge);
> +
> +       /* disable PS8640 mapping function */
> +       ps8640_write_byte(client, PAGE2_ENCTLSPI_WR, 0x00);
> +
> +       gpiod_set_value(ps_bridge->gpio_mode_sel_n, 1);
> +       return 0;
> +}
> +
> +static int ps8640_enter_bl(struct ps8640 *ps_bridge)
> +{
> +       ps_bridge->in_fw_update = true;
> +       return ps8640_spi_dl_mode(ps_bridge);


On error:
 ps_bridge->in_fw_update = false;

Thanks,
-Dan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
