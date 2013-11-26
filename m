From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v3 5/9] usb: gadget: s3c-hsotg: use generic
 phy_init()/phy_exit() support
Date: Tue, 26 Nov 2013 15:53:32 +0530
Message-ID: <529476A4.8080600@ti.com>
References: <1385403367-18144-1-git-send-email-matt.porter@linaro.org>
 <1385403367-18144-6-git-send-email-matt.porter@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1385403367-18144-6-git-send-email-matt.porter@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matt Porter <matt.porter@linaro.org>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Christian Daudt <bcm@fixthebug.org>, Paul Zimmerman <paulz@synopsys.com>
Cc: Devicetree List <devicetree@vger.kernel.org>, Kamil Debski <k.debski@samsung.com>, Linaro Patches <patches@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Linux USB List <linux-usb@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Monday 25 November 2013 11:46 PM, Matt Porter wrote:
> If a generic phy is present, call phy_init()/phy_exit(). This supports
> generic phys that must be soft reset before power on.
> 
> Signed-off-by: Matt Porter <matt.porter@linaro.org>
> ---
>  drivers/usb/gadget/s3c-hsotg.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
> index da3879b..8dfe33f 100644
> --- a/drivers/usb/gadget/s3c-hsotg.c
> +++ b/drivers/usb/gadget/s3c-hsotg.c
> @@ -3622,6 +3622,9 @@ static int s3c_hsotg_probe(struct platform_device *pdev)
>  		goto err_supplies;
>  	}
>  
> +	if (hsotg->phy)

IS_ERR? If your phy_get fails *phy* will have a error value..

> +		phy_init(hsotg->phy);
> +
>  	/* usb phy enable */
>  	s3c_hsotg_phy_enable(hsotg);
>  
> @@ -3715,6 +3718,8 @@ static int s3c_hsotg_remove(struct platform_device *pdev)
>  	}
>  
>  	s3c_hsotg_phy_disable(hsotg);
> +	if (hsotg->phy)

same here.

Thanks
Kishon
