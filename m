From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 3/9] ARM: dts: Remove unused PCI I/O resource in Cygnus
Date: Fri, 18 Sep 2015 14:53:17 -0700
Message-ID: <55FC87CD.8060701@broadcom.com>
References: <1442611454-16331-1-git-send-email-rjui@broadcom.com>
 <1442611454-16331-4-git-send-email-rjui@broadcom.com>
 <4598126.bTshpfCuvX@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4598126.bTshpfCuvX@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 9/18/2015 2:28 PM, Arnd Bergmann wrote:
> On Friday 18 September 2015 14:24:08 Ray Jui wrote:
>> Remove unused PCI I/O resource in bcm-cygnus.dtsi
>>
>> Signed-off-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>
> 
> Why? How do you know that nobody ever plugs in a card with I/O ports?
> 
> 	Arnd
> 

I'll drop this change.

Thanks,

Ray
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
