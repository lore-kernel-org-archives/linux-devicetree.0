From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: net: bluetooth: Add device property
 firmware-name for QCA6174
Date: Mon, 13 May 2019 10:31:28 -0500
Message-ID: <20190513153128.GA5455@bogus>
References: <1554888476-17560-1-git-send-email-rjliao@codeaurora.org>
 <1557631185-5167-1-git-send-email-rjliao@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557631185-5167-1-git-send-email-rjliao@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com, thierry.escande@linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, Rocky Liao <rjliao@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Sun, 12 May 2019 11:19:45 +0800, Rocky Liao wrote:
> This patch adds an optional device property "firmware-name" to allow the
> driver to load customized nvm firmware file based on this property.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> Changes in v4:
>   * rebased the code base and merge with latest code
> ---
>  Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
