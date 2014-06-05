From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv6 2/3] mailbox: Introduce framework for mailbox
Date: Thu, 5 Jun 2014 17:22:27 +0530
Message-ID: <CAJe_ZhcwCF63Uryiguog3FH_aV5zptrhK_qoTKA0=bTvkOEP3w@mail.gmail.com>
References: <1401733450-5646-1-git-send-email-jaswinder.singh@linaro.org>
	<1401733885-5896-1-git-send-email-jaswinder.singh@linaro.org>
	<20140605105127.GB32082@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140605105127.GB32082@beef>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "Anna, Suman" <s-anna-l0cyMroinI0@public.gmane.org>, Loic Pallardy <loic.pallardy-qxv4g6HH51o@public.gmane.org>, LeyFoon Tan <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 5 June 2014 16:21, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Jun 03, 2014 at 12:01:24AM +0530, Jassi Brar wrote:
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
>>  drivers/mailbox/Makefile                           |   4 +
>>  drivers/mailbox/mailbox.c                          | 487 +++++++++++++++++++++
>>  include/linux/mailbox_client.h                     |  45 ++
>>  include/linux/mailbox_controller.h                 | 121 +++++
>
> Could you please include all the DT maintainers here? It's a generic
> binding that needs wider review and an ack. The binding should be
> separated as noted below.
>
> From Documentations/devicetree/bindings/submitting-patches.txt:
>
> I. For patch submitters
>
>   0) Normal patch submission rules from Documentation/SubmittingPatches
>      applies.
>
>   1) The Documentation/ portion of the patch should be a separate patch.
>
>   2) Submit the entire series to the devicetree mailinglist at
>
>        devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>
Thanks. I missed CC'ing DT ML.  I remember patches with DT bindings
and parser code getting upstream... and actually see better sense in
that. But I guess I have to separate out the bindings.

Thanks
Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
