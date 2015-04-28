From: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: Re: [PATCH 1/4] misc: ti-st: use GPIO_LOW for initial value of nshutdown
Date: Tue, 28 Apr 2015 09:41:44 -0700
Message-ID: <553FB848.4090802@boundarydevices.com>
References: <1430000118-26386-1-git-send-email-eric.nelson@boundarydevices.com> <20150428111745.GR11956@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150428111745.GR11956@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, der.herr-kA1LtwSENNE@public.gmane.org, bvijay-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, gigi.joseph-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eyalr-l0cyMroinI0@public.gmane.org, robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 04/28/2015 04:17 AM, Lee Jones wrote:
> On Sat, 25 Apr 2015, Eric Nelson wrote:
> 
>> All other uses of the nshutdown gpio use macros GPIO_LOW and
>> GPIO_HIGH to allow changing the pin polarity.
>>
>> Do this in gpio_direction_output as well.
>>
>> Signed-off-by: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
>> ---
>>  drivers/misc/ti-st/st_kim.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Where your cover-letter?
> 

/dev/null (I didn't create one).

> Why did you even sent me this set?
> 
get_maintainer.pl told me to...

	Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
(commit_signer:2/5=40%,authored:2/5=40%,added_lines:2/12=17%,removed_lines:2/11=18%)

Regards,


Eric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
