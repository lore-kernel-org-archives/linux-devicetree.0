From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/6] [media] ad5820: DT new optional field enable-gpios
Date: Fri, 5 Oct 2018 15:36:52 -0500
Message-ID: <20181005203652.GA12732@bogus>
References: <20181002111356.32298-1-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181002111356.32298-1-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue,  2 Oct 2018 13:13:56 +0200, Ricardo Ribalda Delgado wrote:
> Document new enable-gpio field. It can be used to disable the part
> without turning down its regulator.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  Documentation/devicetree/bindings/media/i2c/ad5820.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
