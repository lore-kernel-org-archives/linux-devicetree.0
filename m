From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH v4 2/2] powerpc/512x: add a device tree binding for
 LocalPlus Bus FIFO
Date: Thu, 22 Oct 2015 15:46:46 +0200
Message-ID: <20151022154646.590d7b03@crub>
References: <1444597682-22181-1-git-send-email-alex.popov@linux.com>
	<1444597682-22181-3-git-send-email-alex.popov@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444597682-22181-3-git-send-email-alex.popov@linux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Popov <alex.popov@linux.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Rob Herring <robh@kernel.org>, Timur Tabi <timur@tabi.org>, Grant Likely <grant.likely@linaro.org>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linuxppc-dev@lists.ozlabs.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 12 Oct 2015 00:08:02 +0300
Alexander Popov <alex.popov@linux.com> wrote:

> Add a device tree binding for Freescale MPC512x LocalPlus Bus FIFO and
> introduce the document describing that binding.
> 
> Signed-off-by: Alexander Popov <alex.popov@linux.com>
> ---
>  .../bindings/powerpc/fsl/mpc512x_lpbfifo.txt        | 21 +++++++++++++++++++++
>  arch/powerpc/boot/dts/mpc5121.dtsi                  | 11 +++++++++--
>  arch/powerpc/boot/dts/mpc5125twr.dts                | 11 ++++++++++-
>  3 files changed, 40 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/mpc512x_lpbfifo.txt

applied to mpc5xxx/next.

Thanks,

Anatolij
