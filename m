From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] phy: rockchip-emmc: Allow to set drive impedance via DTS.
Date: Fri, 1 Mar 2019 08:48:56 -0800
Message-ID: <CAD=FV=UUuQYwh2DMgB5FLuiE1BwbTMTuc9rAte1J5L_JP5qk1Q@mail.gmail.com>
References: <20190301153348.29870-1-christoph.muellner@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301153348.29870-1-christoph.muellner@theobroma-systems.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>, Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Kishon Vijay Abraham I <kishon@ti.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <mbrugger@suse.com>, Emil Renner Berthing <kernel@esmil.dk>, Tony Xie <tony.xie@rock-chips.com>, Randy Li <ayaka@soulik.info>, Vicente Bergas <vicencb@gmail.com>, Ezequiel Garcia <ezequiel@collabora.com>, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infrad>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Mar 1, 2019 at 7:37 AM Christoph Muellner
<christoph.muellner@theobroma-systems.com> wrote:
>
> The rockchip-emmc PHY can be configured with different
> drive impedance values. Currenlty a value of 50 Ohm is
> hard coded into the driver.
>
> This patch introduces the DTS property 'drive-impedance-ohm'
> for the rockchip-emmc phy node, which uses the value from the DTS
> to setup the drive impedance accordingly.
>
> Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-emmc.c | 38 ++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/rockchip/phy-rockchip-emmc.c b/drivers/phy/rockchip/phy-rockchip-emmc.c
> index 19bf84f0bc67..5413fa73dd45 100644
> --- a/drivers/phy/rockchip/phy-rockchip-emmc.c
> +++ b/drivers/phy/rockchip/phy-rockchip-emmc.c
> @@ -87,6 +87,7 @@ struct rockchip_emmc_phy {
>         unsigned int    reg_offset;
>         struct regmap   *reg_base;
>         struct clk      *emmcclk;
> +       unsigned int drive_impedance;
>  };
>
>  static int rockchip_emmc_phy_power(struct phy *phy, bool on_off)
> @@ -281,10 +282,10 @@ static int rockchip_emmc_phy_power_on(struct phy *phy)
>  {
>         struct rockchip_emmc_phy *rk_phy = phy_get_drvdata(phy);
>
> -       /* Drive impedance: 50 Ohm */
> +       /* Drive impedance: from DTS */
>         regmap_write(rk_phy->reg_base,
>                      rk_phy->reg_offset + GRF_EMMCPHY_CON6,
> -                    HIWORD_UPDATE(PHYCTRL_DR_50OHM,
> +                    HIWORD_UPDATE(rk_phy->drive_impedance,
>                                    PHYCTRL_DR_MASK,
>                                    PHYCTRL_DR_SHIFT));
>
> @@ -314,6 +315,28 @@ static const struct phy_ops ops = {
>         .owner          = THIS_MODULE,
>  };
>
> +static u32 convert_drive_impedance_ohm(struct platform_device *pdev, u32 dr_ohm)
> +{
> +       switch (dr_ohm) {
> +       case 100:
> +               return PHYCTRL_DR_100OHM;
> +       case 66:
> +               return PHYCTRL_DR_66OHM;
> +       case 50:
> +               return PHYCTRL_DR_50OHM;
> +       case 40:
> +               return PHYCTRL_DR_40OHM;
> +       case 33:
> +               return PHYCTRL_DR_33OHM;
> +       }
> +
> +       dev_warn(&pdev->dev,
> +               "Invalid value %u for drive-impedance-ohm. "
> +               "Falling back to 50 Ohm.\n",
> +               dr_ohm);
> +       return PHYCTRL_DR_50OHM;
> +}
> +
>  static int rockchip_emmc_phy_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> @@ -322,6 +345,7 @@ static int rockchip_emmc_phy_probe(struct platform_device *pdev)
>         struct phy_provider *phy_provider;
>         struct regmap *grf;
>         unsigned int reg_offset;
> +       u32 val;
>
>         if (!dev->parent || !dev->parent->of_node)
>                 return -ENODEV;
> @@ -345,6 +369,16 @@ static int rockchip_emmc_phy_probe(struct platform_device *pdev)
>         rk_phy->reg_offset = reg_offset;
>         rk_phy->reg_base = grf;
>
> +       if (of_property_read_u32(dev->of_node, "drive-impedance-ohm", &val)) {
> +               dev_info(dev,
> +                       "Missing drive-impedance-ohm property in node %s "
> +                       "Falling back to 50 Ohm.\n",
> +                       dev->of_node->name);

This is awfully noisy for something that pretty much all existing
boards will run.  debug level instead of info level?  Also:

* Don't split strings
across lines

* There's a magic % thing to get the name of an OF node.  Use that.


> +               rk_phy->drive_impedance = PHYCTRL_DR_50OHM;
> +       } else {
> +               rk_phy->drive_impedance = convert_drive_impedance_ohm(pdev, val);
> +       }

It's been a long time since I looked at this, but I could have sworn
that it was more complicated than that.  Specifically I though you
were supposed to query the eMMC card for what it supported and then
resolve that with what the host could support.

Assuming that this is supposed to be queried from the card (which is
how I remember it) then you definitely don't want it in the device
tree since you want to be able to stuff various different eMMC parts
and we should be able to figure out the impedance at runtime.


NOTE: IIRC the old value of 50 ohms is required to be supported by all
hosts and cards and is specified to be the default.


I do see at least the summary of what I thought of this before at
<https://patchwork.kernel.org/patch/9086541/>


(Sorry if the above is wrong and feel free to correct me--I don't have
time at the moment to do all the full research but hopefully you can
dig more based on my pointers.  Feel free to call me on my BS)


-Doug
