From: Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH 2/3 v3] Documentation: dt: add the CSR atlas7 hwspinlock
 bindings document
Date: Fri, 22 May 2015 17:44:26 -0500
Message-ID: <555FB14A.2070505@ti.com>
References: <1432017698-23725-1-git-send-email-21cnbao@gmail.com> <1432017698-23725-2-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432017698-23725-2-git-send-email-21cnbao@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>, ohad@wizery.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: workgroup.linux@csr.com, Wei Chen <wei.chen@csr.com>, Bjorn Andersson <bjorn@kryo.se>, Barry Song <Baohua.Song@csr.com>
List-Id: devicetree@vger.kernel.org

Hi Barry,

On 05/19/2015 01:41 AM, Barry Song wrote:
> From: Wei Chen <wei.chen@csr.com>
> 
> The Hardware Spinlock device on atlas7 provides hardware assistance
> for synchronization between the multiple processors in the system
> (dual Cortex-A7, CAN bus Cortex-M3 and audio DSP).
> This patch adds the DT bindings information for this hwspinlock
> module.
> 
> Cc: Suman Anna <s-anna@ti.com>
> Cc: Bjorn Andersson <bjorn@kryo.se>
> Signed-off-by: Wei Chen <wei.chen@csr.com>
> Signed-off-by: Barry Song <Baohua.Song@csr.com>
> ---
>  .../devicetree/bindings/hwlock/sirf,hwspinlock.txt | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/sirf,hwspinlock.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/sirf,hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/sirf,hwspinlock.txt
> new file mode 100644
> index 0000000..cc6d351
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/sirf,hwspinlock.txt
> @@ -0,0 +1,25 @@
> +SIRF Hardware spinlock device Binding
> +-----------------------------------------------
> +
> +Required properties :
> +- compatible : shall contain only one of the following:
> +	"sirf,hwspinlock"
> +
> +- reg : the register address of hwspinlock

Also suggest to document the value to be used for #hwlock-cells, the
generic hwlock binding does not mention that.

> +
> +Please look at the generic hwlock binding for usage information for consumers,
> +"Documentation/devicetree/bindings/hwlock/hwlock.txt"
> +

regards
Suman
