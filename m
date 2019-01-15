From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/7] nfc: pn532_uart: Add NXP PN532 to devicetree docs
Date: Tue, 15 Jan 2019 13:59:02 -0600
Message-ID: <20190115195902.GA3106@bogus>
References: <20190111161812.26325-1-poeschel@lemonage.de>
 <20190111161812.26325-2-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190111161812.26325-2-poeschel@lemonage.de>
Sender: linux-kernel-owner@vger.kernel.org
Cc: devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, "GitAuthor: Lars Poeschel" <poeschel@lemonage.de>, open list <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Jan 2019 17:18:05 +0100, Lars Poeschel wrote:
> Add a simple binding doc for the pn532.
> 
> Cc: Johan Hovold <johan@kernel.org>
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

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
