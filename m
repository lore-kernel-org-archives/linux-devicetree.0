From: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v8 2/2] btmrvl: add platform specific wakeup interrupt support
Date: Mon, 2 May 2016 10:28:38 -0700
Message-ID: <A90EA9D9-9C3E-43EB-A52A-342DE4881B97@holtmann.org>
References: <1461679047-22631-1-git-send-email-akarwar@marvell.com> <1461679047-22631-2-git-send-email-akarwar@marvell.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461679047-22631-2-git-send-email-akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei-Ning Huang <wnhuang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Amitkumar,

> On some arm-based platforms, we need to configure platform specific
> parameters by device tree node and also define our node as a child
> node of parent SDIO host controller.
> This patch parses these parameters from device tree. It includes
> calibration data download to firmware, wakeup pin configured to firmware,
> and soc specific wake up gpio, which will be set as wakeup interrupt pin.
> 
> Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> ---
> drivers/bluetooth/btmrvl_drv.h  | 11 ++++++
> drivers/bluetooth/btmrvl_main.c | 35 ++++++++++--------
> drivers/bluetooth/btmrvl_sdio.c | 79 +++++++++++++++++++++++++++++++++++++++++
> drivers/bluetooth/btmrvl_sdio.h |  6 ++++
> 4 files changed, 116 insertions(+), 15 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
