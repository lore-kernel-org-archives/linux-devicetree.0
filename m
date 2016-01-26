From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] dt: bindings: add bindings for ipq4019 wifi block
Date: Tue, 26 Jan 2016 17:01:17 +0200
Message-ID: <87y4bcpepu.fsf@kamboji.qca.qualcomm.com>
References: <1452664604-8014-1-git-send-email-rmani@qti.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452664604-8014-1-git-send-email-rmani@qti.qualcomm.com> (Raja
	Mani's message of "Wed, 13 Jan 2016 11:26:44 +0530")
Sender: linux-kernel-owner@vger.kernel.org
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: agross@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Raja Mani <rmani@qti.qualcomm.com> writes:

> Add device tree binding documentation details for wifi block present
> in Qualcomm IPQ4019 SoC into "qcom,ath10k.txt".
>
> Right now, ath10k wireless driver has support for PCI based wlan devices.
> There is a plan to extend ath10k driver to support wifi devices which are
> connected over AHB as well (enumeration will happen via device tree node).
> For AHB based devices (ie, ipq4019), all wifi properties are supplied via
> device tree (including irq, reg addr, cal data,etc).
>
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo
