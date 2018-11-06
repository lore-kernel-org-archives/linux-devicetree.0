From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH V3 4/6] usb: ohci-platform: Add support for Broadcom STB
 SoC's
Date: Tue, 6 Nov 2018 11:08:52 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1811061105120.1450-100000@iolanthe.rowland.org>
References: <1541453493-34981-5-git-send-email-alcooperx@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541453493-34981-5-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Cooper <alcooperx@gmail.com>
Cc: linux-kernel@vger.kernel.org, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org, Lu Baolu <baolu.lu@l>
List-Id: devicetree@vger.kernel.org

On Mon, 5 Nov 2018, Al Cooper wrote:

> Add support for Broadcom STB SoC's to the ohci platform driver.
> 
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> ---

> @@ -177,6 +189,8 @@ static int ohci_platform_probe(struct platform_device *dev)
>  		ohci->flags |= OHCI_QUIRK_FRAME_NO;
>  	if (pdata->num_ports)
>  		ohci->num_ports = pdata->num_ports;
> +	if (pdata->suspend_without_phy_exit)
> +		hcd->suspend_without_phy_exit = 1;

Sorry if I missed this in the earlier discussions...  Is there any 
possibility of adding a DT binding that could express this requirement, 
instead of putting it in the platform data?

Alan Stern
