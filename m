From: Alan Cooper <alcooperx@gmail.com>
Subject: Re: [PATCH V3 6/6] usb: host: Add ability to build new Broadcom STB
 USB drivers
Date: Tue, 6 Nov 2018 10:55:31 -0500
Message-ID: <CAOGqxeX1FckLz7XEm-doh_AHUjvRtn00yZfir6dRNMYNOMY5_g@mail.gmail.com>
References: <1541453493-34981-1-git-send-email-alcooperx@gmail.com>
 <1541453493-34981-7-git-send-email-alcooperx@gmail.com> <CAK8P3a0AoHuaiPsMTqhWm3a4X95NpPTPUHkt9vS9Z2ow8NobhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a0AoHuaiPsMTqhWm3a4X95NpPTPUHkt9vS9Z2ow8NobhA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: ": Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, chunfeng yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 6, 2018 at 6:09 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On 11/5/18, Al Cooper <alcooperx@gmail.com> wrote:
>
> > +
> > +config USB_BRCM
> > +     tristate "Broadcom STB USB support"
> > +     depends on ARCH_BRCMSTB
> > +     select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
> > +     select USB_EHCI_BRCM if USB_EHCI_HCD
> > +     select USB_XHCI_BRCM if USB_XHCI_HCD
> > +     select USB_XHCI_PLATFORM if USB_XHCI_HCD
> > +     select BRCM_USB_PHY if USB_OHCI_HCD || USB_EHCI_HCD || USB_XHCI_HCD
> > +     select GENERIC_PHY if BRCM_USB_PHY
> > +     default ARCH_BRCMSTB
>
> Is there a build time dependency on the PHY layer? If not, I would suggest
> dropping the last two 'select' statements. I would also suggest
> making the dependency 'depends on ARCH_BRCMSTB || COMPILE_TEST'
> to allow building it on other architecture for better build testing, and
> dropping the 'default' line. Just add this to the defconfig like the other
> drivers you have.

I added COMPILE_TEST and dropped the last 2 select lines.
Most of our other drivers default to "y" for "ARCH_BRCMSTB", would it
be better if I changed it to "default y"?

Thanks
Al

>
>       Arnd
