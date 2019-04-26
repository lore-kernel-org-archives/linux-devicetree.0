From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: net: bluetooth: Add device property
 firmware-name for QCA6174
Date: Fri, 26 Apr 2019 15:50:05 -0500
Message-ID: <20190426205005.GA675@bogus>
References: <1554368908-22017-2-git-send-email-rjliao@codeaurora.org>
 <1554888476-17560-1-git-send-email-rjliao@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554888476-17560-1-git-send-email-rjliao@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com, thierry.escande@linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, Rocky Liao <rjliao@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, 10 Apr 2019 17:27:56 +0800, Rocky Liao wrote:
> This patch adds an optional device property "firmware-name" to allow the
> driver to load customized nvm firmware file based on this property.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> Changes in v3:
>   * added firmware-name instead of nvm-postfix to specify full firmware name
> ---
>  Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
