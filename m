From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v2 1/3] Bluetooth: btusb: add QCA6174A compatible
 properties
Date: Wed, 27 Feb 2019 08:53:51 +0100
Message-ID: <C908FF06-43F1-4A5C-B80F-0982315DDB6A@holtmann.org>
References: <20190222225345.69084-1-briannorris@chromium.org>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222225345.69084-1-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <briannorris@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Douglas Anderson <dianders@chromium.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-rockchip@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Rajat Jain <rajatja@google.com>, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Brian,

> We may need to specify a GPIO wake pin for this device, so add a
> compatible property for it.
> 
> There are at least to USB PID/VID variations of this chip: one with a
> Lite-On ID and one with an Atheros ID.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> v2:
> * drop leading zeroes from VID, per documented binding
> ---
> drivers/bluetooth/btusb.c | 2 ++
> 1 file changed, 2 insertions(+)

all 3 patches have been applied to bluetooth-next tree.

Regards

Marcel
