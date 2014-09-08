From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 0/3]  Add picoPHY usb phy driver found on stih407 family
 SoC's
Date: Mon, 8 Sep 2014 20:53:34 +0530
Message-ID: <540DC9F6.8090306@ti.com>
References: <1409740079-16554-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409740079-16554-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com
Cc: lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wednesday 03 September 2014 03:57 PM, Peter Griffin wrote:
> This series adds support for the picoPHY usb phy which is used by the usb2
> and usb3 host controllers when controlling usb2/1.1 devices. It is found on
> stih407 family SoC's from the consumer electronics devision of STMicroelectronics.

So miphy28lp is the PHY controller for USB3 device controller and picoPHY is
the PHY controller for USB3 host controller?

Thanks
Kishon

> 
> Peter Griffin (3):
>   phy: phy-stih407-usb: Add usb picoPHY driver found on stih407 SoC
>     family
>   phy: phy-stih407-usb: Add dt documentation for USB picophy found on
>     stih407 SoC family
>   MAINTAINERS: Add phy-stih407-usb.c file to ARCH/STI architecture
> 
>  .../devicetree/bindings/phy/phy-stih407-usb.txt    |  37 +++++
>  MAINTAINERS                                        |   1 +
>  drivers/phy/Kconfig                                |   8 +
>  drivers/phy/Makefile                               |   2 +
>  drivers/phy/phy-stih407-usb.c                      | 185 +++++++++++++++++++++
>  5 files changed, 233 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-stih407-usb.txt
>  create mode 100644 drivers/phy/phy-stih407-usb.c
> 
