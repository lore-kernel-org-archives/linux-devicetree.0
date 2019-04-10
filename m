From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [v3 PATCH 6/6] usb: mtu3: register a USB Role Switch for dual
 role mode
Date: Wed, 10 Apr 2019 13:24:15 +0300
Message-ID: <20190410102415.GH20058@kuha.fi.intel.com>
References: <1554257354-7440-1-git-send-email-chunfeng.yun@mediatek.com>
 <1554257354-7440-7-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554257354-7440-7-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, Alan Stern <stern@rowland.harvard.edu>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 03, 2019 at 10:09:14AM +0800, Chunfeng Yun wrote:
> +static int ssusb_role_sw_register(struct otg_switch_mtk *otg_sx)
> +{
> +	struct usb_role_switch_desc role_sx_desc = { 0 };
> +	struct ssusb_mtk *ssusb =
> +		container_of(otg_sx, struct ssusb_mtk, otg_switch);
> +
> +	if (!otg_sx->role_sw_used)
> +		return 0;
> +
> +	role_sx_desc.set = ssusb_role_sw_set;
> +	role_sx_desc.get = ssusb_role_sw_get;

        role_sw_desc.fwnode = dev_fwnode(ssusb->dev);

> +	otg_sx->role_sw = usb_role_switch_register(ssusb->dev, &role_sx_desc);
> +
> +	return PTR_ERR_OR_ZERO(otg_sx->role_sw);
> +}

thanks,

-- 
heikki
