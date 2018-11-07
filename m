From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH V3 4/6] usb: ohci-platform: Add support for Broadcom STB
 SoC's
Date: Wed, 7 Nov 2018 10:23:23 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1811071019090.1542-100000@iolanthe.rowland.org>
References: <674c3275-de47-57f4-84aa-58b318aef67b@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <674c3275-de47-57f4-84aa-58b318aef67b@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Al Cooper <al.cooper@broadcom.com>, Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees
List-Id: devicetree@vger.kernel.org

On Tue, 6 Nov 2018, Florian Fainelli wrote:

> On 11/6/18 1:40 PM, Al Cooper wrote:
> > On 11/6/18 11:08 AM, Alan Stern wrote:
> >> On Mon, 5 Nov 2018, Al Cooper wrote:
> >>
> >>> Add support for Broadcom STB SoC's to the ohci platform driver.
> >>>
> >>> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> >>> ---
> >>
> >>> @@ -177,6 +189,8 @@ static int ohci_platform_probe(struct
> >>> platform_device *dev)
> >>>           ohci->flags |= OHCI_QUIRK_FRAME_NO;
> >>>       if (pdata->num_ports)
> >>>           ohci->num_ports = pdata->num_ports;
> >>> +    if (pdata->suspend_without_phy_exit)
> >>> +        hcd->suspend_without_phy_exit = 1;
> >>
> >> Sorry if I missed this in the earlier discussions...  Is there any
> >> possibility of adding a DT binding that could express this requirement,
> >> instead of putting it in the platform data?
> >>
> >> Alan Stern
> >>
> > 
> > Alan,
> > 
> > That was my original approach but internal review suggested that I use
> > pdata instead. Below is my original patch for:
> 
> And the reason for that suggestion was really because it was percevied
> as encoding a driver behavior as a Device Tree property as opposed to
> describing something that was inherently and strictly a hardware
> behavior (therefore suitable for Device Tree).

Right.  The best way to approach this problem is to identify and 
characterize the hardware behavior which makes this override necessary.  
Then _that_ can be added to DT, since it will be a property of the 
hardware rather than of the driver.

> > Add the ability to skip calling the PHY's exit routine on suspend
> > and the PHY's init routine on resume. This is to handle a USB PHY
> > that should have it's power_off function called on suspend but cannot
> > have it's exit function called because on exit it will disable the
> > PHY to the point where register accesses to the Host Controllers
> > using the PHY will be disabled and the host drivers will crash.

What's special about this PHY?  Why does the exit function mess the PHY 
up?  Or to put it another way, why doesn't the exit function mess up 
other PHYs in the same way?

For that matter, can we change the code so that suspend doesn't call 
the exit function for _any_ PHY?  Will just calling the power_off 
function be good enough?  If not, then why not?

Alan Stern
