From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 3/5] usb: roles: add API to get usb_role_switch by node
Date: Mon, 11 Mar 2019 13:36:55 +0800
Message-ID: <1552282615.10179.25.camel@mhfsdcap03>
References: <1552025622-15582-1-git-send-email-chunfeng.yun@mediatek.com>
         <1552025622-15582-4-git-send-email-chunfeng.yun@mediatek.com>
         <CAHp75VeW+NoaGQCnfMcZSz67V68ykRMO=BG9_U6NFODJ5g=1FA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeW+NoaGQCnfMcZSz67V68ykRMO=BG9_U6NFODJ5g=1FA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Min Guo <min.guo@mediatek.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, 2019-03-08 at 08:52 +0200, Andy Shevchenko wrote:
> On Fri, Mar 8, 2019 at 8:14 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > Add usb_role_switch_get_by_node() to make easier to get
> > usb_role_switch by node which register it.
> > It's useful when there is not device_connection registered
> > between two drivers and only knows the node which register
> > usb_role_switch.
> 
> > +static int __switch_match_node(struct device *dev, const void *node)
> > +{
> > +       return dev->parent->of_node == (const struct device_node *)node;
> > +}
> 
> Hmm... Shouldn't be slightly better to compare fwnode instead?
> 
Using fwnode is indeed suitable for more cases,
I find that there are many functions named xx_by_node using node, but
not fwnode, is there any rules about choice between device_node and
fwnode_handle?

Thanks
