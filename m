From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: introduce Command DB for QCOM SoCs
Date: Mon, 5 Mar 2018 15:10:33 -0600
Message-ID: <20180305211033.ejubka6265hmvtze@rob-hp-laptop>
References: <20180226175802.20052-1-ilina@codeaurora.org>
 <20180226175802.20052-3-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180226175802.20052-3-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, rnayak@codeaurora.org, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mahesh Sivasubramanian <msivasub@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 26, 2018 at 10:58:02AM -0700, Lina Iyer wrote:
> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> 
> Command DB provides information on shared resources like clocks,
> regulators etc., probed at boot by the remote subsytem and made
> available in shared memory.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
> 
> Changes in v4:
> 	- Fix unwanted capitalization
> 	- Add reg property
> ---
>  .../devicetree/bindings/arm/msm/cmd-db.txt         | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/msm/cmd-db.txt

Reviewed-by: Rob Herring <robh@kernel.org>
