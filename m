From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH V5 3/7] dw-hdmi: make checkpatch happy
Date: Mon, 10 Nov 2014 09:22:13 +0000
Message-ID: <546083C5.8060502@imgtec.com>
References: <1415424410-7364-1-git-send-email-andy.yan@rock-chips.com>
 <1415424598-7533-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415424598-7533-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andy Yan <andy.yan@rock-chips.com>, airlied@linux.ie, heiko@sntech.de, fabio.estevam@freescale.com, rmk+kernel@arm.linux.org.uk
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, ykk@rock-chips.com, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, Shawn Guo <shawn.guo@linaro.org>, jay.xu@rock-chips.com, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Andy,

In 3.18 rc4, I cannot find checkpatch errors in imx-hdmi.c

Have these errors come during the previous 2 patches.

If yes, then these changes need to be squashed into the previous
patches. No patch should add a checkpatch error and then fix it in a later patch.

Regards
ZubairLK

On 08/11/14 05:29, Andy Yan wrote:
> CHECK: Alignment should match open parenthesis
> +       if ((hdmi->vic == 10) || (hdmi->vic == 11) ||
> +               (hdmi->vic == 12) || (hdmi->vic == 13) ||
> 
> CHECK: braces {} should be used on all arms of this statement
> +       if (hdmi->hdmi_data.video_mode.mdvi)
> [...]
> +       else {
> [...]
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/dw_hdmi.c | 97 ++++++++++++++++++++--------------------
>  1 file changed, 48 insertions(+), 49 deletions(-)
