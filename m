From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/3] usb: phy-ulpi: Add EXTVBUSIND,CHRGVBUS flag support
Date: Mon, 02 Dec 2013 21:59:30 +0300
Message-ID: <529CD892.5010601@cogentembedded.com>
References: <1385967919-13258-1-git-send-email-chris.ruehl@gtsys.com.hk> <1385967919-13258-3-git-send-email-chris.ruehl@gtsys.com.hk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1385967919-13258-3-git-send-email-chris.ruehl@gtsys.com.hk>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Ruehl <chris.ruehl@gtsys.com.hk>, balbi@ti.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/02/2013 10:05 AM, Chris Ruehl wrote:

> usb: phy-ulpi: Add EXTVBUSIND,CHRGVBUS flag support

> ULPI like ISP1504 support external vbus power indication
> used in combination with vbus switches mic2075.

> Signed-off-by: Chris Ruehl <chris.ruehl@gtsys.com.hk>
> ---
>   drivers/usb/phy/phy-ulpi.c |   11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)

> diff --git a/drivers/usb/phy/phy-ulpi.c b/drivers/usb/phy/phy-ulpi.c
> index 217339d..e2f15c4 100644
> --- a/drivers/usb/phy/phy-ulpi.c
> +++ b/drivers/usb/phy/phy-ulpi.c
> @@ -180,6 +180,8 @@ static int ulpi_init(struct usb_phy *phy)
>   	int i, vid, pid, ret;
>   	u32 ulpi_id = 0;
>
> +	pr_info("ULPI Viewport 0x%p\n",phy->io_priv);
> +

    You forgot space after comma.

WBR, Sergei
