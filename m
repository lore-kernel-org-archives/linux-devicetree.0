From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/5] misc: dt-bindings: Add Qualcomm Fastrpc bindings
Date: Wed, 30 Jan 2019 10:37:27 -0600
Message-ID: <20190130163727.GA28911@bogus>
References: <20190124152412.10503-1-srinivas.kandagatla@linaro.org>
 <20190124152412.10503-2-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190124152412.10503-2-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, bkumar@qti.qualcomm.com, linux-arm-msm@vger.kernel.org, thierry.escande@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, 24 Jan 2019 15:24:08 +0000, Srinivas Kandagatla wrote:
> The FastRPC driver implements an IPC (Inter-Processor Communication)
> mechanism that allows for clients to transparently make remote method
> invocations across DSP and APPS boundaries. This enables developers
> to offload tasks to the DSP and free up the application processor for
> other tasks.
> 
> Co-developed-by: Thierry Escande <thierry.escande@linaro.org>
> Signed-off-by: Thierry Escande <thierry.escande@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/misc/qcom,fastrpc.txt | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
