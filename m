From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH v4 1/2] powerpc/512x: add LocalPlus Bus FIFO device
 driver
Date: Thu, 22 Oct 2015 15:46:07 +0200
Message-ID: <20151022154607.3a5ebac4@crub>
References: <1444597682-22181-1-git-send-email-alex.popov@linux.com>
	<1444597682-22181-2-git-send-email-alex.popov@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444597682-22181-2-git-send-email-alex.popov@linux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Popov <alex.popov@linux.com>, Dan Williams <dan.j.williams@intel.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Rob Herring <robh@kernel.org>, Timur Tabi <timur@tabi.org>, Grant Likely <grant.likely@linaro.org>, Vinod Koul <vinod.koul@intel.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linuxppc-dev@lists.ozlabs.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 12 Oct 2015 00:08:01 +0300
Alexander Popov <alex.popov@linux.com> wrote:

> This driver for Freescale MPC512x LocalPlus Bus FIFO (called SCLPC
> in the Reference Manual) allows Direct Memory Access transfers
> between RAM and peripheral devices on LocalPlus Bus.
> 
> Signed-off-by: Alexander Popov <alex.popov@linux.com>
> ---
>  arch/powerpc/configs/mpc512x_defconfig        |   1 +
>  arch/powerpc/include/asm/mpc5121.h            |  59 +++
>  arch/powerpc/platforms/512x/Kconfig           |   6 +
>  arch/powerpc/platforms/512x/Makefile          |   1 +
>  arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 539 ++++++++++++++++++++++++++
>  5 files changed, 606 insertions(+)
>  create mode 100644 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c

extended with MODULE_DEVICE_TABLE() for of_device_id struct and
applied to mpc5xxx/next.

Thanks,

Anatolij
