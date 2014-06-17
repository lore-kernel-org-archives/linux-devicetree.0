From: Nikita Yushchenko <nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>
Subject: Re: [PATCH 11/21] mfd: use devm_irq_of_parse_and_map() where appropriate
Date: Tue, 17 Jun 2014 19:36:12 +0400
Message-ID: <53A0606C.6030400@dev.rtsoft.ru>
References: <1401880402-30091-1-git-send-email-nyushchenko@dev.rtsoft.ru> <1401880402-30091-12-git-send-email-nyushchenko@dev.rtsoft.ru> <20140617151226.GM29841@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140617151226.GM29841@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lugovskoy-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org
List-Id: devicetree@vger.kernel.org

17.06.2014 19:12, Lee Jones =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> From: Nikita Yushchenko <nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>
>>
>> This avoids leak of IRQ mapping on error paths, and makes it possibl=
e
>> to use devm_request_irq() without facing unmap-while-handler-install=
ed
>> issues.
>>
>> Signed-off-by: Nikita Yushchenko <nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>
>> ---
>>   drivers/mfd/max8997.c |    4 +++-
>>   drivers/mfd/max8998.c |    4 +++-
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>
> Applied, thanks.

Hmm...  probably it was too early to apply this?  I was just going to=20
prepare v2, based on discussion...

Also, applying only 11/21, without 01/21, will just cause build errors =
=2E..

Confused.

Nikita
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
