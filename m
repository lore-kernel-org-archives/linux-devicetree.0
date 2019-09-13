From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 2/7] nfc: pn532_uart: Add NXP PN532 to devicetree docs
Date: Fri, 13 Sep 2019 15:32:21 -0500
Message-ID: <20190913203221.GA19194@bogus>
References: <20190910093256.1920-1-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190910093256.1920-1-poeschel@lemonage.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 11:32:53AM +0200, Lars Poeschel wrote:
> Add a simple binding doc for the pn532.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> ---
> Changes in v6:
> - Rebased the patch series on v5.3-rc5
> - Picked up Rob's Reviewed-By

And dropped in v7?

> 
> Changes in v4:
> - Add documentation about reg property in case of i2c
> 
> Changes in v3:
> - seperate binding doc instead of entry in trivial-devices.txt
> 
>  .../devicetree/bindings/nfc/pn532.txt         | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nfc/pn532.txt
