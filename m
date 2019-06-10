From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v6 06/10] device connection: Add
 fwnode_connection_find_match()
Date: Mon, 10 Jun 2019 09:50:08 +0800
Message-ID: <1560131408.8487.112.camel@mhfsdcap03>
References: <1559115828-19146-1-git-send-email-chunfeng.yun@mediatek.com>
         <1559115828-19146-7-git-send-email-chunfeng.yun@mediatek.com>
         <20190607103026.GE10298@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190607103026.GE10298@kuha.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Yu Chen <chenyu56@huawei.com>
List-Id: devicetree@vger.kernel.org

Hi Heikki,

On Fri, 2019-06-07 at 13:30 +0300, Heikki Krogerus wrote:
> Hi,
> 
> On Wed, May 29, 2019 at 03:43:44PM +0800, Chunfeng Yun wrote:
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > 
> > The fwnode_connection_find_match() function is exactly the
> > same as device_connection_find_match(), except it takes
> > struct fwnode_handle as parameter instead of struct device.
> > That allows locating device connections before the device
> > entries have been created.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> This one is also missing your SoB.
> 
> There are now some other changes to the devcon API in Rafael's tree
> [1] that will conflict with this one. I'm attaching a modified version
> of the patch that is rebased on top of today's linux-next. If you use
> it, you should make a note (probable in the cover letter) that the
> series now depends on Rafael's tree.
Got it, thanks

> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/log/?h=linux-next
> 
> 
> thanks,
> 
