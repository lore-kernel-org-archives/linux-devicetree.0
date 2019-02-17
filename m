From: Tony McKahan <tonymckahan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: rk3288 Tinker Board (S) add wi-fi
Date: Sun, 17 Feb 2019 12:32:50 -0500
Message-ID: <CAERgokksSKkFJx5rK16KoAUAz4qCzYEAAN6YrWKVNOcu5CfUJA@mail.gmail.com>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
 <20190217121513.22965-3-beagleboard@davidjohnsummers.uk>
 <CAERgokmpHQb2czJdx++qFoogFRmkvXZm=4BNOsVuCz-ZvgTEaw@mail.gmail.com>
 <4ef63671-f58d-3b16-9055-09e69314a0e6@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <4ef63671-f58d-3b16-9055-09e69314a0e6-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello David,

  I agree, of course coordination is not always so simple, I did not
know Arch didn't have this configured yet.  As for patching, I agree,
but the Tinker has some... peculiarities, I am a hardware guy,
software is a passtime, so my code is not always perhaps up to
standard.  And I wasn't 100% on submitting changes to the device tree
based on a staging driver.  Most of my work has been absorbed into
https://github.com/Miouyouyou/RockMyy .  As for your approach, as I
said, the wifi is the same as I have except for the reset/enables and
the DDR50, which I didn't know the rtl8723bs supported.  BT I have no
in-kernel support for other than enabling the RTS pin to the device
tree, I handle it in user space for now.  I've been watching the
hci_h5 conversation, I'll look into testing these changes/options
tonight perhaps once I make sure our rockchip-dev recipes are still
valid with the newest RC, and can have them committed so others can
test.

Thank you,
-Tony

On Sun, Feb 17, 2019 at 10:55 AM David Summers
<beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org> wrote:
>
> On 17/02/2019 14:32, Tony McKahan wrote:
> > A similar configuration has been in use on Armbian images since kernel
> > 4.14, but not in a clean enough format for submission. I will test
> > this, but the only differences I see compared to ours are combination
> > of the mystery "chip_h" power domain/reset with the Wifi one and the
> > inclusion of sd_uhs_ddr50.
> >
> > -Tony
> >
> > On Sun, Feb 17, 2019 at 7:16 AM David Summers
> > <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org> wrote:
> >> This patch adds the wifi to the ASUS Tinker Board (S) machines.
> >>
> Tony, thanks for the interest in this and the Bluetooth RFC. To my mind
> it would be good if we could mainline an agreed solution. As much as
> anything doesn't make sense to me for Armbian and ArchLinux Arm to have
> independent solutions.
>
> In the ArchLinux Arm  camp I'm not a fan of applying many patches to
> support a board, as much as anything it makes that board non generic -
> and so has to have its own hand crafted kernel. This to me isn't a good
> solution, so if possible prefer the pain of getting it mainlined.
>
> Stefan Wahren has come up with a minimal patch to hci_h5 for bluetooth,
> that says the relevant properties can be read from the device tree. This
> means that acpi is no longer necessary. Thats currently out in testing.
>
> Anyway would be good if Arch and Armbian could merge our efforts ...
>
> Regards,
>
> David.
>
