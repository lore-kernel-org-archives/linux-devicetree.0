From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] uio: dt-bindings: document binding for
 uio-pdrv-genirq
Date: Tue, 3 Oct 2017 16:37:55 -0500
Message-ID: <20171003213755.df4s35xdni6ywxwg@rob-hp-laptop>
References: <20170921154814.7510-1-chris.packham@alliedtelesis.co.nz>
 <20170921154814.7510-2-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170921154814.7510-2-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 22, 2017 at 03:48:13AM +1200, Chris Packham wrote:
> Document the device tree bindings for the uio-prv-genirq driver. Provide
> some examples on how it can be used.
> 
> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> ---
>  .../bindings/uio/linux,uio-pdrv-genirq.txt         | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/uio/linux,uio-pdrv-genirq.txt

NAK.

I'm sure this has come up before but if you want to map a device to a 
uio driver, then add its compatible string to the driver. Bindings 
describe h/w devices.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
