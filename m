From: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Subject: Re: [PATCH 2/3] mtd: Add support for reading MTD devices via the
 nvmem API
Date: Mon, 6 Mar 2017 20:03:28 +0100
Message-ID: <ad8f9469-2574-4fb5-2baa-37c6bca0dfa8@nod.at>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-3-git-send-email-albeu@free.fr>
 <20170302221803.223ff23b@bbrezillon> <20170303133629.3aac2945@tock>
 <20170303143658.5d89a329@bbrezillon> <20170303145726.16cd67fd@tock>
 <20170303151107.36754d19@bbrezillon>
 <54c76650-b61f-8a4c-70c7-febe76e16d3b@nod.at>
 <20170306182147.65d59d33@avionic-0020>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170306182147.65d59d33@avionic-0020>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 06.03.2017 um 18:21 schrieb Alban:
> On Fri, 3 Mar 2017 23:21:29 +0100
> Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org> wrote:
> 
>> Am 03.03.2017 um 15:11 schrieb Boris Brezillon:
>>>> And add a list of successfully added notifiers, along with their
>>>> data pointer, to the MTD device. That's simple and would also remove
>>>> the need for notifier to have a private list of their instances as I
>>>> had to do here.  
>>>
>>> And then you're abusing the notifier concept. As said earlier, a
>>> notifier is not necessarily using the device, and thus, don't
>>> necessarily need private data.
>>> It's not only about what is the simplest solution for your use case,
>>> but also what other users want/need.  
>>
>> Yes, please don't use the mtd_notifier.
>> I strongly vote to embed the nvmem pointer into struct mtd_info.
> 
> Ok, I'll do that. However it mean it will have to stays in
> drivers/mtd as it then become part of the MTD core.

Brian, are you fine with this?
I know, refcounting in MTD is tricky. :(

Thanks,
//richard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
