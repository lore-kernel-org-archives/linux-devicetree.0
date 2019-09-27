From: Rob Herring <robh@kernel.org>
Subject: Re: [Patch v3 5/8] media: dt-bindings: ov2659: add
 powerdown/reset-gpios optional property
Date: Fri, 27 Sep 2019 13:40:39 -0500
Message-ID: <20190927184039.GA825@bogus>
References: <20190924164414.21897-1-bparrot@ti.com>
 <20190924164414.21897-6-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190924164414.21897-6-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

On Tue, 24 Sep 2019 11:44:11 -0500, Benoit Parrot wrote:
> Add powerdown-gpios and reset-gpios to the list of optional properties
> for the OV2659 camera sensor.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov2659.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
