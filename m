From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/3] DT labels for connector device mapping
Date: Tue, 22 Dec 2015 11:25:55 -0800
Message-ID: <20151222192555.GR30172@localhost>
References: <1449782473-20880-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449782473-20880-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 10, 2015 at 03:21:10PM -0600, Rob Herring wrote:
> Having a common connector interface across different platforms can be 
> problematic for determining which SOC device is connected to which 
> connector pins. The standard DT property "label" is intended to provide 
> a human readable name for a device and can be used to provide this 
> information. Then userspace can can read the label to determine the 
> device mapping. For example:
> 
> for f in $(ls -d /sys/class/tty/tty*); do
>   label=$(cat $f/device/of_node/label)
>   if [ "$label" = "LS-UART1" ]; then
>     # you've found UART1, so do something with it.
>     # $f/dev is the major:minor for the /dev node
>   fi
> done
> 
> This series adds labels on hikey and dragonboard 410c devices for the 
> low speed and high speed connectors. Not tested at all.
> 
> BTW, there are no platform maintainers listed for these files. Setting 
> them should be enforced for the dts files as DT maintainers mainly 
> review binding docs, not dts files.
> 
> Rob
> 
> Rob Herring (3):
>   arm64: dts: apq8016-sbc: enable UART0 on LS connector
>   arm64: dts: apq8016-sbc: add label properties for UART, I2C, and SPI
>   arm64: dts: hikey: add label properties to UARTs

Applied all 3 to next/dt64.


-Olof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
