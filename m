From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/6] nfc: pn532_uart: Add NXP PN532 to devicetree docs
Date: Mon, 5 Nov 2018 13:35:15 -0600
Message-ID: <20181105193515.GA22755@bogus>
References: <20181101100216.613-1-poeschel@lemonage.de>
 <20181101100216.613-2-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181101100216.613-2-poeschel@lemonage.de>
Sender: linux-kernel-owner@vger.kernel.org
Cc: devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, "GitAuthor: Lars Poeschel" <poeschel@lemonage.de>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu,  1 Nov 2018 11:02:10 +0100, Lars Poeschel wrote:
> Add a simple binding doc for the pn532.
> 
> Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> ---
> Changes in v4:
> - Add documentation about reg property in case of i2c
> 
> Changes in v3:
> - seperate binding doc instead of entry in trivial-devices.txt
> 
>  .../devicetree/bindings/nfc/pn532.txt         | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nfc/pn532.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
