From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: document bindings for mounting matrixes
Date: Tue, 26 Jul 2016 22:01:15 +0100
Message-ID: <1689ff64-e51d-c23f-fa09-b38ced420bfb@kernel.org>
References: <1469355434-17043-1-git-send-email-linus.walleij@linaro.org>
 <20160726190758.GA31499@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160726190758.GA31499@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samu Onkalo <samu.onkalo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 26/07/16 20:07, Rob Herring wrote:
> On Sun, Jul 24, 2016 at 12:17:14PM +0200, Linus Walleij wrote:
>> The mounting matrix for sensors was introduced in
>> commit dfc57732ad38 ("iio:core: mounting matrix support")
>>
>> However the device tree bindings are very terse and since this is
>> a widely applicable property, we need a proper binding for it
>> that the other bindings can reference. This will also be useful
>> for other operating systems and sensor engineering at large.
>>
>> I think all 3D sensors should support it, the current situation
>> is probably that the mounting information is confined in magic
>> userspace components rather than using the mounting matrix, which
>> is not good for portability and reuse.
>>
>> Cc: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
>> Cc: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Samu Onkalo <samu.onkalo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>> Please help out to get this right, I think this could be confusing
>> to users unless documented properly. I think the doc has some rough
>> edges since I'm not the smartest in physics nor english at all times.
>> ---
> 
> I can at least say I understand how it's supposed to work better now.
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> On the duplication topic, of course I agree that sysfs docs should refer 
> to DT and not vice-versa.
I'd be tempted to keep a 'full' documentation of all the relevant aspects
in each place, but make sure there is a cross reference from the sysfs
ABI docs to the device tree ones as has been suggested.
(rather than converting the sysfs docs just a cross reference + note
on how the bindings and attribute are related).
> 
> Rob
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
