From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/8] dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
Date: Sun, 17 Feb 2019 22:58:38 +0100
Message-ID: <CAFBinCD_n_T=Ho+yB74FW1JP8mCLj0KmHPeDFWne=yfmgd9rqg@mail.gmail.com>
References: <20190212151413.24632-1-narmstrong@baylibre.com> <20190212151413.24632-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212151413.24632-2-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 12, 2019 at 4:14 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the Amlogic G12A Family USB2 OTG PHY Bindings
nit-pick: if you want to keep "OTG" in there then please add a short
description how OTG works on this PHY.
I would describe this as: "Add the Amlogic G12A Family USB2 PHY
Bindings. The PHY works for host or peripheral modes. Configuration of
the mode is part of the USBCTRL registers which are outside of the PHY
registers."

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
with the patch description nit-pick addressed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Regards
Martin
