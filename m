From: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: Re: [PATCH 2/4] misc: ti-st: use of_get_named_gpio_flags for nshutdown
Date: Mon, 27 Apr 2015 08:26:18 -0700
Message-ID: <553E551A.8040900@boundarydevices.com>
References: <1430000118-26386-1-git-send-email-eric.nelson@boundarydevices.com> <1430000118-26386-2-git-send-email-eric.nelson@boundarydevices.com> <20150427084921.GL16501@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150427084921.GL16501@mwanda>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, der.herr-kA1LtwSENNE@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bvijay-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, gigi.joseph-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eyalr-l0cyMroinI0@public.gmane.org, robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thanks Dan,

On 04/27/2015 01:49 AM, Dan Carpenter wrote:
> 
> It's not obvious to me what the point of this patch is.  Why are we
> making this change?  There is no changelog.
> 
>> @@ -482,9 +483,9 @@ long st_kim_start(void *kim_data)
>>  			pdata->chip_enable(kim_gdata);
>>  
>>  		/* Configure BT nShutdown to HIGH state */
> 
> These comments are misleading now.
> 

Will fix in V2.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
