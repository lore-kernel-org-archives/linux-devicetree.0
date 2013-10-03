From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: new cpu iteration code...
Date: Thu, 03 Oct 2013 16:26:20 -0400 (EDT)
Message-ID: <20131003.162620.1581894813846002807.davem@davemloft.net>
References: <20130922.162915.1269060096375052591.davem@davemloft.net>
	<CAL_JsqKNVqJbn559ruvFHg+FVGt8ou4v_Ntf-HphwxCNXQ7GfQ@mail.gmail.com>
	<CACxGe6soxNN6TjDw9h15c39FHzyGzY1OZX9cZ8FRQ_k4PinYvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6soxNN6TjDw9h15c39FHzyGzY1OZX9cZ8FRQ_k4PinYvw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Thu, 3 Oct 2013 21:11:55 +0100

> Still need a solution here in short order. Sundeep, are you working on
> a fixup patch?
> 
> I can remove the warning as a short term fix, but to make the function
> useful generally then there needs to be a way for the architecture to
> tell the core what property name to use for CPU ids. The ugly powerpc
> exception that is in there should be reworked at the same time.

I'm working on a patch right now, give me 30 minutes.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
