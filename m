From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: AMLogic RTC series (second round)
Date: Tue, 28 Jun 2016 11:19:47 +0100
Message-ID: <aea5e2f4-2440-a192-e15a-1f4ff5a30a1c@codethink.co.uk>
References: <1467045849-495-1-git-send-email-ben.dooks@codethink.co.uk>
 <577225A3.9010409@baylibre.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCEPJZEDQIBBBTU6ZG5QKGQE5IZJEMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <577225A3.9010409-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 28/06/16 08:22, Neil Armstrong wrote:
> On 06/27/2016 06:44 PM, Ben Dooks wrote:
>> Apologies, forgot to put the RTC driver through checkpatch
>> before sending. This gets rid of most of the warnings.
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>
> 
> Hi Ben,
> 
> The patchset looks good but misses some quick introduction on how
> the RTC works, it seems to be connected to an internal serial bus,
> do you have some informations about this ?

I might add a few lines into the rtc-meson.c driver, but that's all
detailed in the datasheet (for once this seems to be documented enough
to be able to function)

> Then, the cover letter of your patchset should contain much more informations
> that "git format-patch --cover-letter" generates.

I may just re-submit once patch to add the RTC and the binding
documentation, and then wait until the reset controller bits have
landed before submitting the

> My personal workflow when I have a set ready is :
> 
> * run checkpatch on C files and check my changes
> # scripts/checkpatch.pl -f path/to/my/driver.c
> * I identify the number of patches to include
> * I generate the patches with cover-letter, signoff and eventually subject-prefix, here for 4 commits
> # git format-patch --cover-letter -s -4 --subject-prefix "PATCH v2" -o my_drivers_patches_v2
> * Then I complete the cover letter in my_drivers_patches_v2/0000-cover-letter
> * I also reference a small changelog between patchset version and identify the previous cover letter via it's message id
> Use the http://lkml.kernel.org service to reference a message-id, i.e this email I answer would be referenced by :
> http://lkml.kernel.org/r/1467045849-495-1-git-send-email-ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org

I keep a copy of sent email anyway, so can get the message-ids out of it.

> while looking at the email headers at :
> Message-Id: <1467045849-495-1-git-send-email-ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> * Then I look again all the patches and check all the descriptions
> * I re-run a checkpatch.pl on all the patches (and ignore errors on the cover letter)
> # scripts/checkpatch.pl my_drivers_patches_v2/*
> * I identify all the maintainers and mailing lists
> # scripts/get_maintainer.pl my_drivers_patches_v2/*
> * Personally, I fill the CC: and To: in the headers of each patches, only adding the devicetree mailing list on DT related patches
> * Then I send them via git send-email
> # git send-email my_drivers_patches_v2/*
> => here you can also select the recipients
> => you can also do a dry run or send yourself the patchset to check before final sending

I got sparse and checkpatch confused, and only did sparse on the series.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
