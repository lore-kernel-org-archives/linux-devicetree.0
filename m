From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv8 2/2] mailbox: Introduce framework for mailbox
Date: Mon, 14 Jul 2014 10:26:22 +0530
Message-ID: <CAJe_ZhdrM1Th9MxDkYJo-_5n2BbF1KyByoWnZV+yxEDcEcHjYw@mail.gmail.com>
References: <1405071167-14503-1-git-send-email-jaswinder.singh@linaro.org>
	<1405071325-14683-1-git-send-email-jaswinder.singh@linaro.org>
	<CAPdLdqmBUFaCjdLrYJh3P2jizYC3GP0g7ut+FNaLQ5a73gMp0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPdLdqmBUFaCjdLrYJh3P2jizYC3GP0g7ut+FNaLQ5a73gMp0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Girish K S <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, LeyFoon Tan <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Loic Pallardy <loic.pallardy-qxv4g6HH51o@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Mollie.Wu" <Mollie.Wu-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Takinishi <t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12 July 2014 03:39, Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 11 July 2014 02:35, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> Introduce common framework for client/protocol drivers and
>> controller drivers of Inter-Processor-Communication (IPC).
>>
>> Client driver developers should have a look at
>>  include/linux/mailbox_client.h to understand the part of
>> the API exposed to client drivers.
>> Similarly controller driver developers should have a look
>> at include/linux/mailbox_controller.h
>>
>> Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  .../devicetree/bindings/mailbox/mailbox.txt        |  33 ++
>>  Documentation/mailbox.txt                          | 107 +++++
>>  MAINTAINERS                                        |   8 +
>>  drivers/mailbox/Makefile                           |   4 +
>>  drivers/mailbox/mailbox.c                          | 490 +++++++++++++++++++++
>>  include/linux/mailbox_client.h                     |  48 ++
>>  include/linux/mailbox_controller.h                 | 128 ++++++
>>  7 files changed, 818 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mailbox/mailbox.txt
>>  create mode 100644 Documentation/mailbox.txt
>>  create mode 100644 drivers/mailbox/mailbox.c
>>  create mode 100644 include/linux/mailbox_client.h
>>  create mode 100644 include/linux/mailbox_controller.h
>
> I don't think combining code and documentation like this is the right
> approach. As per
> Documentation/devicetree/bindings/submitting-patches.txt:
>
> "1) The Documentation/ portion of the patch should be a separate patch."
>
Thanks, in fact the previous revision was split like that. But
encouraged by seeing many other instances, I took the liberty to club
them together because neither part makes sense without the other. Also
any reviewer looking at one has to look at the other too.

> I am not sure if binding document and regular documentation should be
> separated out or if they can stay together  (those more knowledgeable,
> please comment!), but the code portion should definitely be a separate
> patch from the documentation.
>
I am willing to learn and split the patchset again, if the gods want so..

Cheers,
Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
