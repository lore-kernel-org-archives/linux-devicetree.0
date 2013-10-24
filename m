From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio:light:tsl2563: Add DT support
Date: Thu, 24 Oct 2013 16:13:02 +0100
Message-ID: <526938FE.4080309@kernel.org>
References: <1382565063-17083-1-git-send-email-sre@debian.org> <5268DA76.6060503@kernel.org> <20131024134259.GB3681@earth.universe> <3C879D35B299F147B1DEDFBEE12F2E06012E5631C1@SUX2182.office.amsiag.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3C879D35B299F147B1DEDFBEE12F2E06012E5631C1-w6KWF4XPi0fT3vPUD1ni5ZoqS/4htBe4AL8bYrjMMd8@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Brenner <Jon.Brenner-QzQKeY2x7wg@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bill Pemberton <wfp5p-4Ng6DfrEGID2fBVCVOL8/A@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 10/24/13 14:58, Jon Brenner wrote:
> AMS-TAOS

amstaos

so lowercase, and based on their being no other hyphenated
names (ST-Ericson is ste for example)


> 
> -----Original Message-----
> From: Sebastian Reichel [mailto:sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org] 
> Sent: Thursday, October 24, 2013 8:43 AM
> To: Jonathan Cameron
> Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Rob Herring; Pawel Moll; Mark Rutland; Stephen Warren; Ian Campbell; Rob Landley; Jonathan Cameron; Peter Meerwald; Greg Kroah-Hartman; Bill Pemberton; Sachin Kamat; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Jon Brenner
> Subject: Re: [PATCH] iio:light:tsl2563: Add DT support
> 
> On Thu, Oct 24, 2013 at 09:29:42AM +0100, Jonathan Cameron wrote:
>> On 10/23/13 22:51, Sebastian Reichel wrote:
>>> Add Device Tree support for the TSL2563 driver and document the 
>>> binding.
>>>
>>> Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>>> ---
>>>  .../devicetree/bindings/iio/light/tsl2563.txt         | 19 +++++++++++++++++++
>>>  drivers/iio/light/tsl2563.c                           |  4 ++++
>>>  2 files changed, 23 insertions(+)
>>>  create mode 100644 
>>> Documentation/devicetree/bindings/iio/light/tsl2563.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/light/tsl2563.txt 
>>> b/Documentation/devicetree/bindings/iio/light/tsl2563.txt
>>> new file mode 100644
>>> index 0000000..b52cf4b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/iio/light/tsl2563.txt
>>> @@ -0,0 +1,19 @@
>>> +* TAOS TSL2563 ambient light sensor
>>> +
>>> +Required properties:
>>> +
>>> +  - compatible : should be "taos,tsl2563"
>>> +  - reg : the I2C address of the sensor
>>> +
>>> +Optional properties:
>>> +
>> So two options for this one.  Either pitch it as a possible general 
>> parameter, or mark it with a vendor prefix.  It seems like something 
>> fairly general, but in that case it probably needs a more detailed proposal and explanation of exactly what it is.
> 
> OK, I will add a vendor prefix in a PATCHv2. When I converted the driver to DT I had a look how this is used and I don't think it's "fairly general".
> 
>> Also, is taos listed in vendor-prefixes.txt?  Jon, is that the right vendor prefix to use?
>> I'm guessing you have some non mainline bindings out there already so 
>> it would be good to match those...
> 
> taos is currently not listed in the vendor-prefixes.txt file. Also it seems that "TAOS Inc." has been absorbed by "ams AG" in 2011.
> So how to proceed with the patch?
> 
> -- Sebastian
> 
