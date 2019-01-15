From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v11 1/9] dt-bindings: opp: Introduce opp-level bindings
Date: Tue, 15 Jan 2019 13:59:49 -0600
Message-ID: <20190115195949.GA8255@bogus>
References: <20190110040209.6028-1-rnayak@codeaurora.org>
 <20190110040209.6028-2-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110040209.6028-2-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: andy.gross@linaro.org, robh@kernel.org, viresh.kumar@linaro.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, 10 Jan 2019 09:32:01 +0530, Rajendra Nayak wrote:
> Add opp-level as an additional property in the OPP node to describe
> the performance level of the device.
> 
> On some SoCs (especially from Qualcomm and MediaTek) this value
> is communicated to a remote microprocessor by the CPU, which
> then takes some actions (like adjusting voltage values across various
> rails) based on the value passed.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/opp/opp.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
