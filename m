From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH 2/3] dt-bindings: net: btusb: add QCA6174A IDs
Date: Fri, 22 Feb 2019 14:10:57 -0800
Message-ID: <CA+ASDXOFTYmXHw6DD6f3P-0DfyKGZUt9MANEYZXfBBkiXqikYQ@mail.gmail.com>
References: <20190222003403.128243-1-briannorris@chromium.org>
 <20190222003403.128243-2-briannorris@chromium.org> <5efc9f02-eeb8-78cc-0f11-13e0010efd46@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5efc9f02-eeb8-78cc-0f11-13e0010efd46@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, devicetree@vger.kernel.org, Linux Bluetooth mailing list <linux-bluetooth@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Linux Kernel <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Rajat Jain <rajatja@google.com>, Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 22, 2019 at 1:57 PM Robin Murphy <robin.murphy@arm.com> wrote:
> On 2019-02-22 12:34 am, Brian Norris wrote:
> > +               "usb0cf3,e300" (Qualcomm QCA6174A)
> > +               "usb04ca,301a" (Qualcomm QCA6174A (Lite-On))
>
> Nit: the USB device binding states that those leading zeroes in the VIDs
> should be suppressed.

Ah, thanks. Didn't notice that part. I'll remove the zeroes and resend.

Brian
