From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] hwmon: (max6650) Add initial rpm target devicetree
 documentation
Date: Tue, 30 Aug 2016 11:38:04 -0500
Message-ID: <20160830163804.GA5954@rob-hp-laptop>
References: <1472026407-3448-1-git-send-email-mike.looijmans@topic.nl>
 <1472026407-3448-2-git-send-email-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472026407-3448-2-git-send-email-mike.looijmans-Oq418RWZeHk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
Cc: linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 24, 2016 at 10:13:27AM +0200, Mike Looijmans wrote:
> Add devicetree property for early initialization of the fan controller
> to prevent overheating, for example when resetting the board while the
> fan was completely turned off.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/hwmon/max6650.txt | 5 +++++
>  1 file changed, 5 insertions(+)

The kernel boot seems kind of late to ensure your fan is running, but

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
