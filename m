From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/2] dt-bindings: net: bluetooth: Add device property
 firmware-name for QCA6174
Date: Tue, 11 Jun 2019 16:01:17 -0600
Message-ID: <20190611220117.GA31601@bogus>
References: <1557919203-11055-1-git-send-email-rjliao@codeaurora.org>
 <1559814055-13872-1-git-send-email-rjliao@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559814055-13872-1-git-send-email-rjliao@codeaurora.org>
Sender: netdev-owner@vger.kernel.org
To: Rocky Liao <rjliao@codeaurora.org>
Cc: mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com, thierry.escande@linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, c-hbandi@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 06, 2019 at 05:40:55PM +0800, Rocky Liao wrote:
> This patch adds an optional device property "firmware-name" to allow the
> driver to load customized nvm firmware file based on this property.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> Changes in v6:
>   * Added read firmware-name property for both QCA6174 and WCN399X
> ---
>  Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
