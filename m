From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v6 2/2] dt-bindings: net: bluetooth: Add device property
 firmware-name for QCA6174
Date: Sat, 6 Jul 2019 12:56:17 +0200
Message-ID: <9245C22A-E0B7-437E-BD73-8A25033660C2@holtmann.org>
References: <1557919203-11055-1-git-send-email-rjliao@codeaurora.org>
 <1559814055-13872-1-git-send-email-rjliao@codeaurora.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559814055-13872-1-git-send-email-rjliao@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rocky Liao <rjliao@codeaurora.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, Johan Hedberg <johan.hedberg@gmail.com>, thierry.escande@linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, c-hbandi@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi Rocky,

> This patch adds an optional device property "firmware-name" to allow the
> driver to load customized nvm firmware file based on this property.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> Changes in v6:
>  * Added read firmware-name property for both QCA6174 and WCN399X
> ---
> Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 4 ++++
> 1 file changed, 4 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel
