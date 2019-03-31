From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/7] dt-bindings: arm: asr: add ASR8751C bindings
Date: Sun, 31 Mar 2019 01:41:28 -0500
Message-ID: <5ca0611a.1c69fb81.1c8ee.5878@mx.google.com>
References: <1553349688-1946-1-git-send-email-qiaozhou@asrmicro.com>
 <1553349688-1946-2-git-send-email-qiaozhou@asrmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1553349688-1946-2-git-send-email-qiaozhou@asrmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: qiaozhou <qiaozhou@asrmicro.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 23, 2019 at 10:01:22PM +0800, qiaozhou wrote:
> From: Qiao Zhou <qiaozhou@asrmicro.com>
> 
> Add new vendor for ASR and add binding document for ASR8751C SoC and initial
> board: aquilac-evb
> 
> Signed-off-by: qiaozhou <qiaozhou@asrmicro.com>
> ---
>  Documentation/devicetree/bindings/arm/asr/asr-8751c.txt | 9 +++++++++
>  Documentation/devicetree/bindings/vendor-prefixes.txt   | 1 +
>  2 files changed, 10 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/asr/asr-8751c.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/asr/asr-8751c.txt b/Documentation/devicetree/bindings/arm/asr/asr-8751c.txt
> new file mode 100644
> index 0000000..af7f816
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/asr/asr-8751c.txt
> @@ -0,0 +1,9 @@
> +ASR 8751C Platforms Device Tree Bindings
> +----------------------------------------------------
> +ASR 8751C SoC
> +Required root node properties:
> +	- compatible = ""asr,8751c";
> +
> +ASR 8751C AquilaC EVB Board
> +Required root node properties:
> +	- compatible = "asr,aquilac-evb", "asr,8751c";

Please convert this to DT schema (yaml) format. Most other SoC families 
are converted already.
