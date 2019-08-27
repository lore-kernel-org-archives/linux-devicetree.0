Return-Path: <robherring2@gmail.com>
Date: Tue, 27 Aug 2019 10:58:15 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: smiapp: Align documentation with
 current practices
Message-ID: <20190827155815.GA9693@bogus>
References: <20190813134518.5640-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813134518.5640-1-sakari.ailus@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, 13 Aug 2019 16:45:18 +0300, Sakari Ailus wrote:
> - The clock-lanes property is not needed for the sensors do not support
>   lane reordering. (The information possibly present in existing clock-lane
>   properties is simply not used.)
> 
> - There's no need to refer to the sensor device in the DT example, thus
>   remove the label.
> 
> - Rename the "camera" device node as "camera-sensor".
> 
> - Rename the endpoint label as "smiapp_ep" (was: "smiapp_1_1"). There is
>   in practice only one anyway.
> 
> - Remove the remote-endpoint documentation (it is covered by
>   graph.txt to which video-interfaces.txt refers to).
> 
> - Add a note on the port and endpoint nodes.
> 
> These changes make the smiapp bindings a better example.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../devicetree/bindings/media/i2c/nokia,smia.txt       | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Applied, thanks.

Rob
