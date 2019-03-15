From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 4/6] usb: roles: add API to get usb_role_switch by node
Date: Fri, 15 Mar 2019 13:58:54 +0200
Message-ID: <20190315115854.GJ7752@kuha.fi.intel.com>
References: <1552635513-2378-1-git-send-email-chunfeng.yun@mediatek.com>
 <1552635513-2378-5-git-send-email-chunfeng.yun@mediatek.com>
 <20190315081835.GD7752@kuha.fi.intel.com>
 <1552641204.10179.133.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1552641204.10179.133.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 15, 2019 at 05:13:24PM +0800, Chunfeng Yun wrote:
> I encounter a build error when CONFIG_USB_ROLE_SWITCH is not enabled,
> 
> drivers/usb/mtu3/mtu3_dr.o: In function `ssusb_role_sw_register':
> ./drivers/usb/mtu3/mtu3_dr.c:460: undefined reference to
> `usb_role_switch_register'
> drivers/usb/mtu3/mtu3_dr.o: In function `ssusb_otg_switch_exit':
> ./drivers/usb/mtu3/mtu3_dr.c:491: undefined reference to
> `usb_role_switch_unregister'
> 
> the following patch has fixed the issue, but seems not get into kernel,
> [v3,08/12] usb: roles: Add usb role switch notifier.
> https://patchwork.kernel.org/patch/10836525/
> 
> What should I do if I add a new API? Thanks

So if you are asking should you supply dummy functions for the new API,
then I would just say that if you do so, you need to prepare these
patches on top of that series from Yu Chen. In general I'm not sure we
need dummy functions with this API.

Hans, comments?


thanks,

-- 
heikki
