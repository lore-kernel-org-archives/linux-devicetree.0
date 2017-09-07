From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] syscon: dt-bindings: Add binding doc for Broadcom
 iProc CDRU
Date: Thu, 7 Sep 2017 08:59:19 +0100
Message-ID: <20170907075919.pcestmzjb33escmv@dell>
References: <1504744062-5941-1-git-send-email-ray.jui@broadcom.com>
 <1504744062-5941-2-git-send-email-ray.jui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1504744062-5941-2-git-send-email-ray.jui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 06 Sep 2017, Ray Jui wrote:

> Add binding document for Broadcom iProc's Chip Device Resource Unit
> (CDRU). Multiple iProc based chips have this CDRU block that contains
> miscellaneous registers for chip or device configurations. Start with
> Stingray specific compatible string for the initial binding
> 
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  .../devicetree/bindings/mfd/brcm,iproc-cdru.txt          | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/brcm,iproc-cdru.txt

Applied for v4.15, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
