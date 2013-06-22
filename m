From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCHv2 1/3] iio: Add Nuvoton NAU7802 ADC driver
Date: Sat, 22 Jun 2013 14:02:05 +0200
Message-ID: <51C5923D.6030609@metafoo.de>
References: <1371754675-12242-1-git-send-email-alexandre.belloni@free-electrons.com> <1371754675-12242-2-git-send-email-alexandre.belloni@free-electrons.com> <51C590B5.2060308@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51C590B5.2060308-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, jimwall@q.com, brian-ZKiFAVwZFM2FeswfMrDH8w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/22/2013 01:55 PM, Jonathan Cameron wrote:
> On 06/20/2013 07:57 PM, Alexandre Belloni wrote:
>> The Nuvoton NAU7802 ADC is a 24-bit 2-channels I2C ADC, with adjustable
>> gain and sampling rates.
>>
> Sorry, somewhat low on time today so only a quick review.
> 
> 1) Missing userspace ABI documentation.  Also, perhaps min_conversions is
>    a little vague?  Not that I have a better idea!

I really don't like the name min_conversions either. Isn't this effectively
a decimation filter?

- Lars
