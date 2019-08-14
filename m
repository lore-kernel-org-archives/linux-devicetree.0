From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH next v9 07/11] usb: roles: Add
 fwnode_usb_role_switch_get() function
Date: Wed, 14 Aug 2019 12:33:35 +0800
Message-ID: <1565757215.7317.15.camel@mhfsdcap03>
References: <1565695634-9711-1-git-send-email-chunfeng.yun@mediatek.com>
         <1565695634-9711-8-git-send-email-chunfeng.yun@mediatek.com>
         <20190813130110.GE4691@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813130110.GE4691@kuha.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Biju Das <biju.das@bp.renesas.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-08-13 at 16:01 +0300, Heikki Krogerus wrote:
> On Tue, Aug 13, 2019 at 07:27:10PM +0800, Chunfeng Yun wrote:
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > 
> > The fwnode_usb_role_switch_get() function is exactly the
> > same as usb_role_switch_get(), except that it takes struct
> > fwnode_handle as parameter instead of struct device.
> > 
> > Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Why is my SoB replaced with Suggested-by tag in this patch?
Sorry, my mistake, I misunderstand what you mean, you suggest use
Suggested-by in [v8 08/11], but I replaced it all for [06, 07, 08], 
will abandon the changes of [06,07] in next version.

> 
> thanks,
> 
