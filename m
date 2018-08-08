From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] media: dt: adv7604: Fix slave map documentation
Date: Wed, 8 Aug 2018 11:23:32 +0100
Message-ID: <b5b25641-f898-577b-7762-d72dd64272cf@ideasonboard.com>
References: <20180807155452.797-1-kieran.bingham@ideasonboard.com>
 <505904fb-7bfc-c455-740e-b72a14731eb9@ysoft.com>
Reply-To: kieran.bingham@ideasonboard.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <505904fb-7bfc-c455-740e-b72a14731eb9@ysoft.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>, mchehab@kernel.org, linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-renesas-soc@vger.kernel.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

Hi Michal,

Thank you for your review.

+Rob, +Mark, +Laurent asking for opinions if anyone has any on prefixes
through media tree.

On 08/08/18 08:48, Michal Vokáč wrote:
> On 7.8.2018 17:54, Kieran Bingham wrote:
> Hi Kieran,
>> The reg-names property in the documentation is missing an '='. Add it.
>>
>> Fixes: 9feb786876c7 ("media: dt-bindings: media: adv7604: Extend
>> bindings to allow specifying slave map addresses")
>>
> 
> "dt-bindings: media: " is preferred for the subject.

This patch will go through the media-tree as far as I am aware, and
Mauro prefixes all commits through the media tree with "media:" if they
are not already prefixed.

Thus this would then become "media: dt-bindings: media: adv7604: ...."
as per my commit: 9feb786876c7 which seems a bit redundant.

Is it still desired ? If so I'll send a V2. (perhaps needed anyway, as I
seem to have erroneously shortened dt-bindings: to just dt: which wasn't
intentional.

> I think you should also add device tree maintainers to the recipients.

Added to this mail to ask opinions on patch prefixes above.

Originally, I believed the list was sufficient as this is a trivial
patch, and it goes through the media tree.

But, it turned out to be more controversial :)

Rob, Mark, should I add you to all patches affecting DT? Or is the list
sufficient?
--
Regards

Kieran


> Best regards,
> Michal
> 
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> ---
>>   Documentation/devicetree/bindings/media/i2c/adv7604.txt | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
>> b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
>> index dcf57e7c60eb..b3e688b77a38 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
>> +++ b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
>> @@ -66,7 +66,7 @@ Example:
>>            * other maps will retain their default addresses.
>>            */
>>           reg = <0x4c>, <0x66>;
>> -        reg-names "main", "edid";
>> +        reg-names = "main", "edid";
>>             reset-gpios = <&ioexp 0 GPIO_ACTIVE_LOW>;
>>           hpd-gpios = <&ioexp 2 GPIO_ACTIVE_HIGH>;
