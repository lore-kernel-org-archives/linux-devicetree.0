From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v8 1/2] dt: bindings: add MARVELL's bt-sd8xxx wireless device
Date: Mon, 2 May 2016 10:28:35 -0700
Message-ID: <36F7EC16-DCBB-4B5E-8391-88B64CCA9D05@holtmann.org>
References: <1461679047-22631-1-git-send-email-akarwar@marvell.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461679047-22631-1-git-send-email-akarwar@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amitkumar Karwar <akarwar@marvell.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wei-Ning Huang <wnhuang@chromium.org>, Xinming Hu <huxm@marvell.com>
List-Id: devicetree@vger.kernel.org

Hi Amitkumar,

> Add device tree binding documentation for MARVELL's bluetooth sdio
> (sd8897 and sd8997) chip.
> 
> Signed-off-by: Xinming Hu <huxm@marvell.com>
> Signed-off-by: Amitkumar Karwar <akarwar@marvell.com>
> ---
> Listing changelist for both 1/2 and 2/2 here
> v2: Fixed build error reported by kbuild test robot
> drivers/bluetooth/btmrvl_platform.c:141:22: error:
> 'btmrvl_plt_pm_ops' undeclared here (not in a function)
> 
> v3: Add NULL check for 'btmrvl_plt_dev'
> 
> v4: Moved the bindings file to bindings/net/
>    Corrected the name of 'name' and 'compatible' properties(Rob Herring)
> 
> v5: Comments for wlan patches were applicable here as well. Like all binding
>    changes in single file, specifying node as a child of SDIO controller.
> 
> v6: a)Use <chip>-bt order for compatible attribute(Rob Herring)
>    b)Split wakeuppin-gap to wakeup-pin and wakeup-gap(Rob Herring) 
>    c)Use sdio function number for both the unit address and reg(Rob Herring)
> 
> v7: a)Use suggested vendor name and generic node name(Rob Herring)
> v8: a)Nodes are renamed as per suggestions from Rob Herring
>      btmrvl,* -> marvell,*
>      "wakeup-gap-msec" -> "wakeup-gap-ms"
> ---
> Documentation/devicetree/bindings/btmrvl.txt       | 29 -----------
> .../devicetree/bindings/net/marvell-bt-sd8xxx.txt  | 56 ++++++++++++++++++++++
> 2 files changed, 56 insertions(+), 29 deletions(-)
> delete mode 100644 Documentation/devicetree/bindings/btmrvl.txt
> create mode 100644 Documentation/devicetree/bindings/net/marvell-bt-sd8xxx.txt

patch has been applied to bluetooth-next tree.

Regards

Marcel
