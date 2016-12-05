From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2] v4l: async: make v4l2 coexist with devicetree nodes in
 a dt overlay
Date: Mon, 5 Dec 2016 10:13:38 -0300
Message-ID: <0b71cde6-143c-0fa3-30c3-22caf94e14ec@osg.samsung.com>
References: <1480932596-4108-1-git-send-email-javi.merino@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480932596-4108-1-git-send-email-javi.merino@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Javi Merino <javi.merino@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Javi,

On 12/05/2016 07:09 AM, Javi Merino wrote:
> In asds configured with V4L2_ASYNC_MATCH_OF, the v4l2 subdev can be
> part of a devicetree overlay, for example:
> 
> &media_bridge {
> 	...
> 	my_port: port@0 {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 		reg = <0>;
> 		ep: endpoint@0 {
> 			remote-endpoint = <&camera0>;
> 		};
> 	};
> };
> 
> / {
> 	fragment@0 {
> 		target = <&i2c0>;
> 		__overlay__ {
> 			my_cam {
> 				compatible = "foo,bar";
> 				port {
> 					camera0: endpoint {
> 						remote-endpoint = <&my_port>;
> 						...
> 					};
> 				};
> 			};
> 		};
> 	};
> };
> 
> Each time the overlay is applied, its of_node pointer will be
> different.  We are not interested in matching the pointer, what we
> want to match is that the path is the one we are expecting.  Change to
> use of_node_cmp() so that we continue matching after the overlay has
> been removed and reapplied.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Javi Merino <javi.merino@kernel.org>
> ---

I already reviewed v1 but you didn't carry the tag. So again:

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
