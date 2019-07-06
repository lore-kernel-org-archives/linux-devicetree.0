From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v6 1/2] Bluetooth: hci_qca: Load customized NVM based on
 the device property
Date: Sat, 6 Jul 2019 12:51:26 +0200
Message-ID: <AFA918FD-04AF-47C0-A6B4-6B53CF824054@holtmann.org>
References: <1557919161-11010-1-git-send-email-rjliao@codeaurora.org>
 <1559814030-13833-1-git-send-email-rjliao@codeaurora.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559814030-13833-1-git-send-email-rjliao@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rocky Liao <rjliao@codeaurora.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, Johan Hedberg <johan.hedberg@gmail.com>, thierry.escande@linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, c-hbandi@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi Rocky,

> QCA BTSOC NVM is a customized firmware file and different vendors may
> want to have different BTSOC configuration (e.g. Configure SCO over PCM
> or I2S, Setting Tx power, etc.) via this file. This patch will allow
> vendors to download different NVM firmware file by reading a device
> property "firmware-name".
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> Changes in v6:
>  * Added read firmware-name property for both QCA6174 and WCN399X
> ---
> drivers/bluetooth/btqca.c   |  8 ++++++--
> drivers/bluetooth/btqca.h   |  6 ++++--
> drivers/bluetooth/hci_qca.c | 18 +++++++++++++++++-
> 3 files changed, 27 insertions(+), 5 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
