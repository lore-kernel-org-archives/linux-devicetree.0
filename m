From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: function to retrive of_device_id data
Date: Tue, 5 May 2015 00:42:14 +0200
Message-ID: <CAGhQ9VzbdMR-U6KUZYcN+LcEs0KkrxF=EfCpXo3poEzZ7CxWrQ@mail.gmail.com>
References: <1430687943-13051-1-git-send-email-manabian@gmail.com>
	<CAL_JsqKLaZFr7_ZWhkfQLqMpCr8BCn2xh2GAbEOwysau7E-1+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKLaZFr7_ZWhkfQLqMpCr8BCn2xh2GAbEOwysau7E-1+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 5 May 2015 at 00:24, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sun, May 3, 2015 at 4:19 PM, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi DT maintainers,
>>
>> A common driver pattern for retrieving the data field in a of_device_id struct seems to be:
>>
>>     const struct of_device_id *match;
>>     match = of_match_device(driver_of_match, &pdev->dev);
>>     driver->data = match->data;
>>
>> I was looking for a simple function to perform the above action but couldn't find one.
>>
>> What do you think about the following patch to add such a function?
>
> Looks fine to me. I'd prefer it be called of_device_get_match_data() though.

I'll rename it and post a proper patch with a change log, tomorrow.

regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
