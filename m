From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH v8 1/2] Documentation: DT: dma: Add Xilinx zynqmp dma
 device tree binding documentation
Date: Thu, 12 May 2016 14:43:08 +0200
Message-ID: <57347A5C.1080606@metafoo.de>
References: <1463056164-3210-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463056164-3210-1-git-send-email-appanad@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, svemula@xilinx.com, anirudh@xilinx.com, punnaia@xilinx.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/12/2016 02:29 PM, Kedareswara rao Appana wrote:
[...]
> +- xlnx,include-sg	: Indicates the controller to operate in simple or
> +			  scatter gather dma mode

This is also a software runtime configuration parameter.
