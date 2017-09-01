From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v6 3/5] docs-rst: v4l: Include Qualcomm CAMSS in
 documentation build
Date: Fri, 1 Sep 2017 12:46:18 +0200
Message-ID: <7fdb19c5-331e-39f3-adb4-3c6fdeafbbda@xs4all.nl>
References: <20170830114946.17743-1-sakari.ailus@linux.intel.com>
 <20170830114946.17743-4-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170830114946.17743-4-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: niklas.soderlund@ragnatech.se, robh@kernel.org, laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 30/08/17 13:49, Sakari Ailus wrote:
> Qualcomm CAMSS was left out from documentation build. Fix this.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Hans Verkuil <hans.verkuil@cisco.com>

Regards,

	Hans


> ---
>  Documentation/media/v4l-drivers/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
> index 10f2ce42ece2..5c202e23616b 100644
> --- a/Documentation/media/v4l-drivers/index.rst
> +++ b/Documentation/media/v4l-drivers/index.rst
> @@ -50,6 +50,7 @@ For more details see the file COPYING in the source distribution of Linux.
>  	philips
>  	pvrusb2
>  	pxa_camera
> +	qcom_camss
>  	radiotrack
>  	rcar-fdp1
>  	saa7134
> 
