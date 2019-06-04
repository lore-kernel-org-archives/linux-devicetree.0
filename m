From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v8 1/2] media: dt-bindings: media: xilinx: Add Xilinx
 MIPI CSI-2 Rx Subsystem
Date: Tue, 4 Jun 2019 22:23:44 +0300
Message-ID: <20190604192344.7tycwffjd3yeizxh@paasikivi.fi.intel.com>
References: <1559555971-193235-1-git-send-email-vishal.sagar@xilinx.com>
 <1559555971-193235-2-git-send-email-vishal.sagar@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559555971-193235-2-git-send-email-vishal.sagar@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vishal Sagar <vishal.sagar@xilinx.com>
Cc: Hyun Kwon <hyunk@xilinx.com>, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Michal Simek <michals@xilinx.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, hans.verkuil@cisco.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dinesh Kumar <dineshk@xilinx.com>, Sandip Kothari <sandipk@xilinx.com>, Luca Ceresoli <luca@lucaceresoli.net>, Jacopo Mondi <jacopo@jmondi.org>
List-Id: devicetree@vger.kernel.org

Hi Vishal,

On Mon, Jun 03, 2019 at 03:29:30PM +0530, Vishal Sagar wrote:

> +Optional properties:
> +--------------------
> +- xlnx,vfb: This is present when Video Format Bridge is enabled.
> +  Without this property the driver won't be loaded as IP won't be able to generate
> +  media bus format compliant stream output.

I think we previously concluded that the format will be just different in
this case. So the description appears incorrect.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
