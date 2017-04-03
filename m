From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: stm32-adc: add option to set
 resolution
Date: Mon, 3 Apr 2017 20:45:49 +0100
Message-ID: <4251bdd9-48d6-9b44-ed3d-f7ec8bfee875@kernel.org>
References: <1490963559-32159-1-git-send-email-fabrice.gasnier@st.com>
 <1490963559-32159-2-git-send-email-fabrice.gasnier@st.com>
 <20170403164600.siab6ghtoeuxokg5@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170403164600.siab6ghtoeuxokg5@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Cc: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/04/17 17:46, Rob Herring wrote:
> On Fri, Mar 31, 2017 at 02:32:37PM +0200, Fabrice Gasnier wrote:
>> Add documentation for 'assigned-resolution-bits' dt optional property.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
>> ---
>> Changes in v2:
>> - rename property from 'st,adc-res' to 'assigned-resolution-bits' so it
>>   is more common.
>> ---
>>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 4 ++++
>>  1 file changed, 4 insertions(+)
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> 
Thanks.

Applied to the togreg branch of iio.git.  Will push out as testing for
the autobuilders to have a chance to play with it.

Jonathan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
