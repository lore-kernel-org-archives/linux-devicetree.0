Return-Path: <robherring2@gmail.com>
Date: Tue, 28 Aug 2018 19:45:46 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 04/23] dt-bindings: media: Specify bus type for MIPI
 D-PHY, others, explicitly
Message-ID: <20180829004546.GA4879@bogus>
References: <20180827093000.29165-1-sakari.ailus@linux.intel.com>
 <20180827093000.29165-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180827093000.29165-5-sakari.ailus@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, slongerbeam@gmail.com, niklas.soderlund@ragnatech.se, jacopo@jmondi.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 27 Aug 2018 12:29:41 +0300, Sakari Ailus wrote:
> Allow specifying the bus type explicitly for MIPI D-PHY, parallel and
> Bt.656 busses. This is useful for devices that can make use of different
> bus types. There are CSI-2 transmitters and receivers but the PHY
> selection needs to be made between C-PHY and D-PHY; many devices also
> support parallel and Bt.656 interfaces but the means to pass that
> information to software wasn't there.
> 
> Autodetection (value 0) is removed as an option as the property could be
> simply omitted in that case.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/media/video-interfaces.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
