From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCHv1 0/2] Adding driver for Xilinx LogiCORE IP mailbox.
Date: Mon, 25 May 2015 08:05:06 +0200
Message-ID: <5562BB92.60808@xilinx.com>
References: <1432317791-26851-1-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432317791-26851-1-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>, jassisinghbrar@gmail.com
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, akpm@linux-foundation.org, gregkh@linuxfoundation.org, mchehab@osg.samsung.com, arnd@arndb.de, joe@perches.com, jingoohan1@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/22/2015 08:03 PM, Moritz Fischer wrote:
> This patchset adds mailbox framework integration for the Xilinx LogiCORE IP
> mailbox.  The Xilinx LogiCORE IP mailbox is a fpga softcore that allows
> interprocessor communication between AXI4 stream / memory mapped
> processors.
> 
> Changes from v0:
> ---------------------
> 
> - Several stylistic issues
> - Dropped superfluous intr_mode member
> - Really masking the IRQs on mailbox_shutdown
> - No longer using polling by accident in non-IRQ mode
> - Swapped doc and driver commits

Changes update should be in every particular patch.
Also v1 is used to the first version that's why this one should be v2.

Thanks,
Michal
