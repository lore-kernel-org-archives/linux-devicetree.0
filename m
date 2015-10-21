From: Alexander Popov <alex.popov@linux.com>
Subject: Re: [PATCH v4 0/2] powerpc/512x: add LocalPlus Bus FIFO device driver
Date: Thu, 22 Oct 2015 01:15:03 +0300
Message-ID: <56280E66.2040804@linux.com>
References: <1444597682-22181-1-git-send-email-alex.popov@linux.com>
Reply-To: alex.popov@linux.com
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444597682-22181-1-git-send-email-alex.popov@linux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Anatolij Gustschin <agust@denx.de>, Rob Herring <robh@kernel.org>, Timur Tabi <timur@tabi.org>, Grant Likely <grant.likely@linaro.org>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linuxppc-dev@lists.ozlabs.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Popov <alex.popov@linux.com>
List-Id: devicetree@vger.kernel.org

On 12.10.2015 00:08, Alexander Popov wrote:
> This driver for Freescale MPC512x LocalPlus Bus FIFO (called SCLPC
> in the Reference Manual) allows Direct Memory Access transfers
> between RAM and peripheral devices on LocalPlus Bus.

> Changes in v4:
>  - the race condition is fixed;
>  - plenty of style fixes are made;
>  - devm_* functions and EPROBE_DEFER are used in probe().

Hello,

I've done my best to fix the issues pointed by Timur Tabi and Vinod Koul.
Could I have a feedback please?

Best regards,
Alexander
