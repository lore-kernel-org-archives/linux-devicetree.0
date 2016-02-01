From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: light: opt3001: Add device tree binding
 documentation
Date: Mon, 1 Feb 2016 19:56:04 +0000
Message-ID: <56AFB854.70705@kernel.org>
References: <1454094180-2688-1-git-send-email-dannenberg@ti.com>
 <20160201151848.GA11967@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160201151848.GA11967@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Koch <mail-y2PnNNZjvYd4VEKF+Mn3m16hYfS7NtTn@public.gmane.org>, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, "pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org >> Peter Meerwald" <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, mhornung.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/02/16 15:18, Rob Herring wrote:
> On Fri, Jan 29, 2016 at 01:03:00PM -0600, Andreas Dannenberg wrote:
>> Signed-off-by: Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>
>> ---
>>  .../devicetree/bindings/iio/light/opt3001.txt      | 26 ++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/light/opt3001.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/light/opt3001.txt b/Documentation/devicetree/bindings/iio/light/opt3001.txt
>> new file mode 100644
>> index 0000000..55b9cb3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/light/opt3001.txt
>> @@ -0,0 +1,26 @@
>> +* Texas Instruments OPT3001 Ambient Light Sensor
>> +
>> +The driver supports interrupt-driven and interrupt-less operation, depending
>> +on whether an interrupt property has been populated into the DT. Note that
>> +the optional generation of IIO events on rising/falling light threshold changes
>> +requires the use of interrupts. Without interrupts, only the simple reading
>> +of the current light value is supported through the IIO API.
> 
> Seems like you could poll and do the threshold changes in s/w. Anyway, 
> that's all irrelevant to the DT binding.
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Oddity occurred during a merge or patch application at some point as I actually had
some docs in my local tree copy for this, but they weren't being tracked by git.

Checking back, the original patch series did have docs so not sure what rabbit
hole these dropped down.  Anyhow, easiest option for me is to just apply this
patch and not chase down where the original went!

Have added a note to the commit to this effect.  Applied to the togreg
branch of iio.git.

Thanks,

Jonathan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
