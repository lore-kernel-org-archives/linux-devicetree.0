From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: clk: hisilicon: Add bindings for Hi3670
 clk
Date: Tue, 25 Sep 2018 04:24:56 -0700
Message-ID: <5baa1b09.1c69fb81.623e5.51ea@mx.google.com>
References: <20180921060103.21370-1-manivannan.sadhasivam@linaro.org>
 <20180921060103.21370-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180921060103.21370-2-manivannan.sadhasivam@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org, xuwei5@hisilicon.com, robh+dt@kernel.org, amit.kucheria@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 20 Sep 2018 23:01:00 -0700, Manivannan Sadhasivam wrote:
> Add devicetree bindings for HiSilicon Hi3670 clock controller.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../bindings/clock/hi3670-clock.txt           |  43 +++
>  include/dt-bindings/clock/hi3670-clock.h      | 348 ++++++++++++++++++
>  2 files changed, 391 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/hi3670-clock.txt
>  create mode 100644 include/dt-bindings/clock/hi3670-clock.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
