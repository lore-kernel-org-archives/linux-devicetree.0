From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/19] phy: stih41x-usb: Remove usb phy driver and dt
 binding documentation.
Date: Fri, 23 Sep 2016 10:06:56 -0500
Message-ID: <20160923150656.GB9176@rob-hp-laptop>
References: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
 <1473859677-9231-3-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473859677-9231-3-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, devicetree@vger.kernel.org, lee.jones@linaro.org, kishon@ti.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 14, 2016 at 02:27:40PM +0100, Peter Griffin wrote:
> This phy is only used on STiH415/6 based silicon, and support for
> these SoC's is being removed from the kernel.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Cc: <kishon@ti.com>
> ---
>  .../devicetree/bindings/phy/phy-stih41x-usb.txt    |  24 ---

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/phy/Kconfig                                |   8 -
>  drivers/phy/Makefile                               |   1 -
>  drivers/phy/phy-stih41x-usb.c                      | 188 ---------------------
>  4 files changed, 221 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-stih41x-usb.txt
>  delete mode 100644 drivers/phy/phy-stih41x-usb.c
