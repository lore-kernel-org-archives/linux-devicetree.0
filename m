From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 3/3] dt/bindings: qcom_nandc: Add DT bindings
Date: Wed, 20 Jan 2016 08:46:34 -0600
Message-ID: <20160120144634.GA16935@rob-hp-laptop>
References: <1451971501-18160-1-git-send-email-architt@codeaurora.org>
 <1453110634-25995-1-git-send-email-architt@codeaurora.org>
 <1453110634-25995-4-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453110634-25995-4-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org, cernekee@gmail.com, sboyd@codeaurora.org, andy.gross@linaro.org, dehrenberg@google.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 18, 2016 at 03:20:34PM +0530, Archit Taneja wrote:
> Add DT bindings document for the Qualcomm NAND controller driver.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
> v6:
>   - Update compatible tring to something more specific
>   - Refer to nand.txt for standard properties
>   - In the example, use 'partitions' node to hold the partition subnodes
> 
> v5:
> - Make changes to incorporate chip select sub nodes (brcmnand taken as
>   reference)
> 
> v3:
> - Don't use '0x' when specifying nand controller address space
> - Add optional property for on-flash bbt usage
> 
>  .../devicetree/bindings/mtd/qcom_nandc.txt         | 86 ++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

Acked-by: Rob Herring <robh@kernel.org>
