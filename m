From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: Re: [PATCH] deps: introduce new (virtual) property no-dependencies
Date: Wed, 14 May 2014 09:02:19 +0200
Message-ID: <537314FB.1020905@ahsoftware.de>
References: <537151FF.8070104@ahsoftware.de> <1400006923-7950-1-git-send-email-holler@ahsoftware.de> <5372CD15.5020001@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5372CD15.5020001-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 14.05.2014 03:55, schrieb Alexander Holler:
> Am 13.05.2014 20:48, schrieb Alexander Holler:
>>
>> The property 'no-dependencies' is virtual property and will not be added
>> to any output file.
>>
> Hmm, I think it should be non-virtual, otherwise a dtb isn't
> reproducible. That means dtc -> dtb -> dts (fdtdump) -> dtb would
> produce a different dtb if no-dependencies was used to avoid an
> automatic dependency.

But a dtb doesn't have phandles. After all that's why I had to introduce 
the property dependencies. So no-dependencies doesn't make sense in a 
.dtb, the virtual nature of no-dependencies makes sense and the patch is 
fine.

Looks like I had a weak moment yesterday evening. ;)

Regards,

Alexander Holler

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
