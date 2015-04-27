From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V2 2/4] misc: ti-st: use of_get_named_gpio_flags for nshutdown
Date: Mon, 27 Apr 2015 16:29:22 -0400
Message-ID: <553E9C22.4030702@hurleysoftware.com>
References: <20150427085242.GM16501@mwanda> <1430162849-8804-1-git-send-email-eric.nelson@boundarydevices.com> <1430162849-8804-2-git-send-email-eric.nelson@boundarydevices.com> <553E97E8.4080103@hurleysoftware.com> <553E99A7.1080206@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <553E99A7.1080206-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, der.herr-kA1LtwSENNE@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, gigi.joseph-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eyalr-l0cyMroinI0@public.gmane.org, robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Eric,

On 04/27/2015 04:18 PM, Eric Nelson wrote:
> Hi Peter,
> 
> On 04/27/2015 01:11 PM, Peter Hurley wrote:
>> On 04/27/2015 03:27 PM, Eric Nelson wrote:
>>> Use of_get_named_gpio_flags to retrieve the "nshutdown" gpio connected
>>> to the BT_EN pin of the device when retrieving platform data from device
>>> tree.
>>
>> This breaks all existing DTs wrt the 'nshutdown_gpio' key.
>> I suggest using a different, optional key in the absence of 'nshutdown_gpio'.
>>
> 
> You mean all zero of them up-stream ;)?

"nshutdown_gpio" DT key became ABI as of 4.0


> I did forward a patch set to the maintainers of the ti-linux-kernel on
> git.ti.com:
> 
> 	https://git.ti.com/ti-linux-kernel/ti-linux-kernel
> 
> Regards,
> 
> 
> Eric
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
