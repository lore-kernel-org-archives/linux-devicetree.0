From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2 1/3] Bluetooth: btusb: add QCA6174A compatible properties
Date: Wed, 27 Feb 2019 13:34:22 -0800
Message-ID: <CA+ASDXOG43dRtqzZJuA4ixVvfpt-Wd1rUVMMG3QFRnNGOmY5GA@mail.gmail.com>
References: <20190222225345.69084-1-briannorris@chromium.org> <C908FF06-43F1-4A5C-B80F-0982315DDB6A@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <C908FF06-43F1-4A5C-B80F-0982315DDB6A@holtmann.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Douglas Anderson <dianders@chromium.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Linux Bluetooth mailing list <linux-bluetooth@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Rajat Jain <rajatja@google.com>, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Marcel,

On Tue, Feb 26, 2019 at 11:53 PM Marcel Holtmann <marcel@holtmann.org> wrote:
> > We may need to specify a GPIO wake pin for this device, so add a
> > compatible property for it.
> >
> > There are at least to USB PID/VID variations of this chip: one with a
> > Lite-On ID and one with an Atheros ID.
> >
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > v2:
> > * drop leading zeroes from VID, per documented binding
> > ---
> > drivers/bluetooth/btusb.c | 2 ++
> > 1 file changed, 2 insertions(+)
>
> all 3 patches have been applied to bluetooth-next tree.

Thanks! I failed to repeat my comment from v1:

"""
This patch is also required to make this stable, but since it's not
really tied to the device tree, and it's an existing bug, I sent it
separately:

  https://lore.kernel.org/patchwork/patch/1044896/
  Subject: Bluetooth: btusb: request wake pin with NOAUTOEN
"""

Can you take this one too? Otherwise Scarlet will be less stable
(possible interrupt storm at boot).

Regards,
Brian
