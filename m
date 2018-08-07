From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC 3/5] powerpc/mpic: Add support for non-contiguous irq ranges
Date: Tue, 7 Aug 2018 12:09:38 -0600
Message-ID: <20180807180938.GA13623@rob-hp-laptop>
References: <1532684881-19310-1-git-send-email-Bharat.Bhushan@nxp.com>
 <1532684881-19310-4-git-send-email-Bharat.Bhushan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532684881-19310-4-git-send-email-Bharat.Bhushan@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bharat Bhushan <Bharat.Bhushan@nxp.com>
Cc: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, oss@buserror.net, galak@kernel.crashing.org, mark.rutland@arm.com, kstewart@linuxfoundation.org, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, keescook@chromium.org, tyreld@linux.vnet.ibm.com, joe@perches.com
List-Id: devicetree@vger.kernel.org

On Fri, Jul 27, 2018 at 03:17:59PM +0530, Bharat Bhushan wrote:
> Freescale MPIC h/w may not support all interrupt sources reported
> by hardware, "last-interrupt-source" or platform. On these platforms
> a misconfigured device tree that assigns one of the reserved
> interrupts leaves a non-functioning system without warning.

There are lots of ways to misconfigure DTs. I don't think this is 
special and needs a property. We've had some interrupt mask or valid 
properties in the past, but generally don't accept those.

> 
> This patch adds "supported-irq-ranges" property in device tree to
> provide the range of supported source of interrupts. If a reserved
> interrupt used then it will not be programming h/w, which it does
> currently, and through warning.
> 
> Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
> ---
>  .../devicetree/bindings/powerpc/fsl/mpic.txt       |   8 ++
>  arch/powerpc/include/asm/mpic.h                    |   9 ++
>  arch/powerpc/sysdev/mpic.c                         | 113 +++++++++++++++++++--
>  3 files changed, 121 insertions(+), 9 deletions(-)
