Return-Path: <ulf.hansson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1423134801-23219-1-git-send-email-addy.ke@rock-chips.com>
References: <1423134801-23219-1-git-send-email-addy.ke@rock-chips.com>
Date: Mon, 9 Feb 2015 05:48:08 +0100
Message-ID: <CAPDyKFqQ9qjpyJEF11djwcEa3RXAHCutk_VvbXJH=bsw+8iepg@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc: fix bug that cause 'Timeout sending command'
From: Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: multipart/alternative; boundary=001a11c135d80912ba050ea07a39
To: Addy Ke <addy.ke@rock-chips.com>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, "tgih.jun@samsung.com" <tgih.jun@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Chris Ball <chris@printf.net>, Dinh Nguyen <dinguyen@altera.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Sonny Rao <sonnyrao@chromium.org>, Alexandru Stan <amstan@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "zhenfu.fang" <zhenfu.fang@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, lintao <lintao@rock-chips.com>, chenfen <chenfen@rock-chips.com>, zyf <zyf@rock-chips.com>, Jianqun Xu <xjq@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, =?UTF-8?B?5aea5pm65oOF?= <yzq@rock-chips.com>, Han Jiang <hj@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, zhangqing <zhangqing@rock-chips.com>, Lin Huang <hl@rock-chips.com>
List-ID: <devicetree@vger.kernel.org>

--001a11c135d80912ba050ea07a39
Content-Type: text/plain; charset=UTF-8

On 5 February 2015 at 12:13, Addy Ke <addy.ke@rock-chips.com> wrote:

> Because of some uncertain factors, such as worse card or worse hardware,
> DAT[3:0](the data lines) may be pulled down by card, and mmc controller
> will be in busy state. This should not happend when mmc controller
> send command to update card clocks. If this happends, mci_send_cmd will
> be failed and we will get 'Timeout sending command', and then system will
> be blocked. To avoid this, we need reset mmc controller.
>
> Signed-off-by: Addy Ke <addy.ke@rock-chips.com>
>

Hi Addy,

Should I consider $subject patch as a better option to the one below?

[PATCH] mmc: dw_mmc: rockchip: Add DW_MCI_QUIRK_RETRY_DELAY
https://lkml.org/lkml/2015/1/13/562

Kind regards
Uffe


> ---
>  drivers/mmc/host/dw_mmc.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index 4d2e3c2..b1d6dfb 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -100,6 +100,7 @@ struct idmac_desc {
>  };
>  #endif /* CONFIG_MMC_DW_IDMAC */
>
> +static int dw_mci_card_busy(struct mmc_host *mmc);
>  static bool dw_mci_reset(struct dw_mci *host);
>  static bool dw_mci_ctrl_reset(struct dw_mci *host, u32 reset);
>
> @@ -888,6 +889,26 @@ static void mci_send_cmd(struct dw_mci_slot *slot,
> u32 cmd, u32 arg)
>                 cmd, arg, cmd_status);
>  }
>
> +static void dw_mci_wait_busy(struct dw_mci_slot *slot)
> +{
> +       struct dw_mci *host = slot->host;
> +       unsigned long timeout = jiffies + msecs_to_jiffies(500);
> +
> +       while (time_before(jiffies, timeout)) {
> +               if (!dw_mci_card_busy(slot->mmc))
> +                       return;
> +       }
> +       dev_err(host->dev, "Data busy (status %#x)\n",
> +               mci_readl(slot->host, STATUS));
> +
> +       /*
> +        * Data busy, this should not happend when mmc controller send
> command
> +        * to update card clocks in non-volt-switch state. If it happends,
> we
> +        * should reset controller to avoid getting "Timeout sending
> command".
> +        */
> +       dw_mci_ctrl_reset(host, SDMMC_CTRL_ALL_RESET_FLAGS);
> +}
> +
>  static void dw_mci_setup_bus(struct dw_mci_slot *slot, bool force_clkinit)
>  {
>         struct dw_mci *host = slot->host;
> @@ -899,6 +920,8 @@ static void dw_mci_setup_bus(struct dw_mci_slot *slot,
> bool force_clkinit)
>         /* We must continue to set bit 28 in CMD until the change is
> complete */
>         if (host->state == STATE_WAITING_CMD11_DONE)
>                 sdmmc_cmd_bits |= SDMMC_CMD_VOLT_SWITCH;
> +       else
> +               dw_mci_wait_busy(slot);
>
>         if (!clock) {
>                 mci_writel(host, CLKENA, 0);
> --
> 1.8.3.2
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--001a11c135d80912ba050ea07a39
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 5 February 2015 at 12:13, Addy Ke <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:addy.ke@rock-chips.com" target=3D"_blank">addy.ke@rock-chips.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Beca=
use of some uncertain factors, such as worse card or worse hardware,<br>
DAT[3:0](the data lines) may be pulled down by card, and mmc controller<br>
will be in busy state. This should not happend when mmc controller<br>
send command to update card clocks. If this happends, mci_send_cmd will<br>
be failed and we will get &#39;Timeout sending command&#39;, and then syste=
m will<br>
be blocked. To avoid this, we need reset mmc controller.<br>
<br>
Signed-off-by: Addy Ke &lt;<a href=3D"mailto:addy.ke@rock-chips.com" target=
=3D"_blank">addy.ke@rock-chips.com</a>&gt;<br></blockquote><div><br></div><=
div>Hi Addy,<br></div><div><br>Should I consider $subject patch as a better=
 option to the one below?<br><br>[PATCH] mmc: dw_mmc: rockchip: Add DW_MCI_=
QUIRK_RETRY_DELAY<br>
<a href=3D"https://lkml.org/lkml/2015/1/13/562" target=3D"_blank">https://l=
kml.org/lkml/2015/1/13/562</a><br><br></div><div>Kind regards<br></div><div=
>Uffe<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
---<br>
=C2=A0drivers/mmc/host/dw_mmc.c | 23 +++++++++++++++++++++++<br>
=C2=A01 file changed, 23 insertions(+)<br>
<br>
diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c<br>
index 4d2e3c2..b1d6dfb 100644<br>
--- a/drivers/mmc/host/dw_mmc.c<br>
+++ b/drivers/mmc/host/dw_mmc.c<br>
@@ -100,6 +100,7 @@ struct idmac_desc {<br>
=C2=A0};<br>
=C2=A0#endif /* CONFIG_MMC_DW_IDMAC */<br>
<br>
+static int dw_mci_card_busy(struct mmc_host *mmc);<br>
=C2=A0static bool dw_mci_reset(struct dw_mci *host);<br>
=C2=A0static bool dw_mci_ctrl_reset(struct dw_mci *host, u32 reset);<br>
<br>
@@ -888,6 +889,26 @@ static void mci_send_cmd(struct dw_mci_slot *slot, u32=
 cmd, u32 arg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd, arg, cmd_statu=
s);<br>
=C2=A0}<br>
<br>
+static void dw_mci_wait_busy(struct dw_mci_slot *slot)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dw_mci *host =3D slot-&gt;host;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long timeout =3D jiffies + msecs_to_ji=
ffies(500);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (time_before(jiffies, timeout)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dw_mci_card_bu=
sy(slot-&gt;mmc))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(host-&gt;dev, &quot;Data busy (status %=
#x)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mci_readl(slot-&gt;=
host, STATUS));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Data busy, this should not happend when mmc =
controller send command<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to update card clocks in non-volt-switch sta=
te. If it happends, we<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * should reset controller to avoid getting &qu=
ot;Timeout sending command&quot;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dw_mci_ctrl_reset(host, SDMMC_CTRL_ALL_RESET_FL=
AGS);<br>
+}<br>
+<br>
=C2=A0static void dw_mci_setup_bus(struct dw_mci_slot *slot, bool force_clk=
init)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dw_mci *host =3D slot-&gt;host;<br>
@@ -899,6 +920,8 @@ static void dw_mci_setup_bus(struct dw_mci_slot *slot, =
bool force_clkinit)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We must continue to set bit 28 in CMD until =
the change is complete */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (host-&gt;state =3D=3D STATE_WAITING_CMD11_D=
ONE)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sdmmc_cmd_bits |=3D=
 SDMMC_CMD_VOLT_SWITCH;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dw_mci_wait_busy(sl=
ot);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!clock) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mci_writel(host, CL=
KENA, 0);<br>
<span><font color=3D"#888888">--<br>
1.8.3.2<br>
<br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-mmc&qu=
ot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org" targe=
t=3D"_blank">majordomo@vger.kernel.org</a><br>
More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><b=
r>
</font></span></blockquote></div><br></div></div>

--001a11c135d80912ba050ea07a39--
