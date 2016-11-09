From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] Documentation: dtb: lm87: Add hwmon binding
 documentation.
Date: Wed, 9 Nov 2016 12:26:17 -0600
Message-ID: <20161109182617.75h6ypgehqwukw3o@rob-hp-laptop>
References: <20161102025804.9215-1-mahoda.ratnayaka@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161102025804.9215-1-mahoda.ratnayaka-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mahoda Ratnayaka <mahoda.ratnayaka-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 02, 2016 at 03:58:04PM +1300, Mahoda Ratnayaka wrote:
> This patch adds lm87 hwmon device tree node documentation.
> 
> Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> ---
> 
> Notes:
>     Changes since v1:
>      As suggested include all the changes are moved in
>      to the same patch and the all the optional properties
>      are now defined instead of using a single variable to
>      indicate those properties.
>     
>     Changes since v2:
>      Changed has-vcc-5v to use regulator binding and fixed
>      a minor copy paste mistake.
>     
>     Changes since v3:
>      Update the vcc-supply description.
> 
>  Documentation/devicetree/bindings/hwmon/lm87.txt | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
