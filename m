From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH V2 2/6] usb: core: Add ability to skip phy exit on
 suspend and init on resume
Date: Fri, 9 Nov 2018 16:08:44 +0800
Message-ID: <1541750924.32173.81.camel@mhfsdcap03>
References: <CAOGqxeWBmAahswHp+b_PzkyGs-9sOx3COpJnFVsbKhx14KLuUw@mail.gmail.com>
         <1541641432.32173.71.camel@mhfsdcap03>
         <CAOGqxeXmMWK53pAmjeUtpdXNeTa7UH7=VA6pAJyhxg_BsmU5+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOGqxeXmMWK53pAmjeUtpdXNeTa7UH7=VA6pAJyhxg_BsmU5+w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Cooper <alcooperx@gmail.com>
Cc: ": Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, "David S. Miller" <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, US
List-Id: devicetree@vger.kernel.org

On Thu, 2018-11-08 at 17:50 -0500, Alan Cooper wrote:
> On Wed, Nov 7, 2018 at 8:43 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > hi,
> > On Tue, 2018-10-30 at 18:30 -0400, Alan Cooper wrote:
> > > On 10/17/18 9:46 PM, Chunfeng Yun wrote:> hi,
> > > >
> > > > On Wed, 2018-10-17 at 18:29 -0400, Al Cooper wrote:
> > > >> Add the ability to skip calling the PHY's exit routine on suspend
> > > >> and the PHY's init routine on resume. This is to handle a USB PHY
> > > >> that should have it's power_off function called on suspend but
> > > cannot
> > > >> have it's exit function called because on exit it will disable the
> > > >> PHY to the point where register accesses to the Host Controllers
> > > >> using the PHY will be disabled and the host drivers will crash.
> > > >>
> > > >> This is enabled with the HCD flag "suspend_without_phy_exit" which
> > > >> can be set from any HCD driver.
> > > >>
> > > >> Signed-off-by: Al Cooper<alcooperx@gmail.com>
> > > >> ---
> > > >>   drivers/usb/core/hcd.c  |  8 ++++----
> > > >>   drivers/usb/core/phy.c  | 18 ++++++++++++------
> > > >>   drivers/usb/core/phy.h  |  9 ++++++---
> > > >>   include/linux/usb/hcd.h |  3 +++
> > > >>   4 files changed, 25 insertions(+), 13 deletions(-)
> > > >>
> >
> >
> > > >>       unsigned        skip_phy_initialization:1;
> > > >>
> > > >> +    /* Some phys don't want the phy's exit/init called on
> > > suspend/resume */
> > > >> +    unsigned        suspend_without_phy_exit:1;
> > > > As suggested before, you can skip phy's exit/init during
> > > suspend/resume
> > > > by enabling wakeup of hcd, so needn't add a new variable for it.
> > >
> > > I still need to be able to enable and disable wakeup for this driver.
> > Just use device_init_wakeup(dev, true) instead of
> > device_wakeup_enable(dev) for your controller driver, you can try it.
> >
> > Sorry for the late replay
> 
> What about the case where sysfs is used to disable wakeup?
Oh, It's a problem in this case.

BTW: Why the host driver will crash when access host controller's
register after power-off phy? they are usually independent.

> 
> Al
> > >
> > > >
> > > >> +
> > > >>       /* The next flag is a stopgap, to be removed when all the
> > > HCDs
> > > >>        * support the new root-hub polling mechanism. */
> > > >>       unsigned        uses_new_polling:1;
> > > >
> >
> >
