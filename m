From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] dt: bindings: i2c/trivial-devices.txt: Add 2 iio
 supported accelerometers
Date: Tue, 11 Oct 2016 19:38:56 +0100
Message-ID: <70380e7c-d456-c676-5001-cfe3a77598ca@kernel.org>
References: <20161008123426.8991-1-hdegoede@redhat.com>
 <20161008123426.8991-2-hdegoede@redhat.com>
 <20161010214011.GA14377@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161010214011.GA14377@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/10/16 22:40, Rob Herring wrote:
> On Sat, Oct 08, 2016 at 02:34:23PM +0200, Hans de Goede wrote:
>> Add compatible strings for 2 accelerometers which follow the trivial
>> i2c device bindings and have been supported by the iio subsystem for
>> a while now.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/i2c/trivial-devices.txt | 2 ++
>>  1 file changed, 2 insertions(+)
> 
> Jonathan's already applied it, but FWIW:
But not to a non rebasing tree yet :)
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Added.  Thanks Rob!

Jonathan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
