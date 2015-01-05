From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: Device Tree Child Node Parsing Question
Date: Mon, 5 Jan 2015 08:48:33 -0600
Message-ID: <54AAA441.2060607@opensource.altera.com>
References: <549999A7.2010608@opensource.altera.com> <CAL_JsqLzbEuQgNZoBbzr4R=Nj9_Qs=60uLhzENbZzTaaTgxnZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLzbEuQgNZoBbzr4R=Nj9_Qs=60uLhzENbZzTaaTgxnZg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/26/2014 01:40 PM, Rob Herring wrote:
> On Tue, Dec 23, 2014 at 10:34 AM, Thor Thayer
> <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
>> Hi,
>>
>> What is the best way to queue devicetree child nodes so the node is passed
>> in the platform_device pointer to the probe() function?
>>
>> Documentation/devicetree/usage-model.txt has the following:
>>
>> "For Linux DT support, the generic behaviour is for child devices to be
>> registered by the parent's device driver at driver .probe() time."
>>
>> "Actually, it turns out that registering children of some platform_devices
>> as more platform_devices is a common pattern, and the
>> device tree support code reflects that and makes the above example
>> simpler.  The second argument to of_platform_populate() is an
>> of_device_id table, and any node that matches an entry in that table
>> will also get its child nodes registered."
>>
>>
>> I tried calling of_platform_populate() in the probe of the a10_sysctl node
>> but it doesn't appear to setup the platform device data properly for the
>> sub-child nodes.
>>

<snip>
>
> This should work. There are quite a few users already including unit
> tests. Can you tell what you are doing differently from those users?
>
> Rob
>
>>

<snip>

Just to tie up this conversation in case anyone else has an issue, it 
ended up being my debug issue. The of_platform_populate() was working 
properly. The issue was that I was also calling a mfd_add_devices() 
using a devices table and I was watching the mfd_add_devices() probe. 
Simply removing the mfd_add_devices() and the table and using 
of_platform_populate() as below worked.

of_platform_populate(spi->dev.of_node, a10sycon_spi_of_match,
		     NULL, &spi->dev);

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
