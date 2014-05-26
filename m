From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] regulator: fixed: use of_property_read_{bool|u32}()
Date: Mon, 26 May 2014 21:33:34 +0400
Message-ID: <53837AEE.7030400@cogentembedded.com>
References: <201405252350.40402.sergei.shtylyov@cogentembedded.com> <20140526151958.GU22111@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140526151958.GU22111-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 05/26/2014 07:19 PM, Mark Brown wrote:

>> Use more compact of_property_read_{bool|u32}() calls instead of the
>> of_{find|get}_property() calls.

> Applied, thanks.

    Thank you for the quick reply! :-)

>  Always CC mailing lists on patches.

    Er, I did CC devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org but (as usual) avoided CCing LKML 
-- that's all the lists scripts/get_maintainer.pl suggested. Do you mean some 
other list I don't know about?

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
