From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/6] dt-bindings: Document Broadcom Cygnus SoC and clock
 driver
Date: Wed, 8 Oct 2014 03:58:15 -0700
Message-ID: <543518C7.9070809@broadcom.com>
References: <1412746025-11998-4-git-send-email-sbranden@broadcom.com> <2480056.Cs3dr8EM2e@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2480056.Cs3dr8EM2e@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, JD Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 14-10-08 12:57 AM, Arnd Bergmann wrote:
> On Tuesday 07 October 2014 22:27:02 Scott Branden wrote:
>> diff --git a/Documentation/devicetree/bindings/arm/cygnus.txt b/Documentation/devicetree/bindings/arm/cygnus.txt
>> new file mode 100644
>> index 0000000..a210377
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/cygnus.txt
>> @@ -0,0 +1,12 @@
>> +Broadcom Cygnus device tree bindings
>> +------------------------------------
>> +
>> +All Cygnus boards shall have the following properties:
>> +
>> +Required root node property:
>> +       - compatible = "brcm,cygnus";
>
> Can you add a more specific model number for the soc as well?
> I assume that cygnus refers to more than one model, so you
> should probably list both the family and the individual
> SoC type here.
Add specific model numbers does not seem necessary because they are not 
needed to be specified in the device tree for compatible purposes for 
the kernel to work.  Plus, the list of model numbers will continue to 
grow over time and compatible strings would need to be added to the 
kernel for no apparent reason?
>
>> +Boards variants shall have the following additional properties:
>> +
>> +Required root node property for the BCM911360_ENTPHN board:
>> +       - compatible = "brcm,bcm911360_entphn";
>>
>
> We normally don't list specific boards here, since it's hard to
> keep up.
Thanks - removed specific boards from file and moved the cygnus.txt file 
to devicetree/bindings/arm/bcm/cygnus.txt in next version.  This seems 
to be like the appropriate place to put this document. We will need to 
add back in board specific bindings when ALSA support is added.  But 
that will be a later commit to deal with.
>
> 	Arnd
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
