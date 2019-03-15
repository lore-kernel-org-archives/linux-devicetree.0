From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 4/6] usb: roles: add API to get usb_role_switch by
 node
Date: Fri, 15 Mar 2019 17:14:08 +0800
Message-ID: <1552641248.10179.134.camel@mhfsdcap03>
References: <1552635513-2378-1-git-send-email-chunfeng.yun@mediatek.com>
         <1552635513-2378-5-git-send-email-chunfeng.yun@mediatek.com>
         <20190315081835.GD7752@kuha.fi.intel.com>
         <20190315091127.GF7752@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315091127.GF7752@kuha.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,
On Fri, 2019-03-15 at 11:11 +0200, Heikki Krogerus wrote:
> On Fri, Mar 15, 2019 at 10:18:35AM +0200, Heikki Krogerus wrote:
> > Andy already pointed out that you need to use fwnodes.
> > 
> > Rule of thumb: You always use fwnodes. Only if there is something that
> > can't be done with fwnodes you use DT or ACPI nodes directly.
> > 
> > In this case there is absolutely nothing that would prevent you from
> > using fwnodes.
> 
> ...
> 
> > +/**
> > + * usb_role_switch_get_by_node - Find USB role switch by it's parent node
> > + * @node: The node that register USB role switch
> > + *
> > + * Finds and returns role switch registered by @node. The reference count
> > + * for the found switch is incremented.
> > + */
> > +struct usb_role_switch *usb_role_switch_get_by_node(struct device_node *node)
> 
> This is my proposal for function prototype:
> 
> struct usb_role_switch *
> fwnode_usb_role_switch_get(struct fwnode_handle *fwnode);
Ok, thanks again
> 
> 
> thanks,
> 
