From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] DT: pinctrl: Add binding documentation for
 Spreadtrum pin controller
Date: Mon, 26 Jun 2017 00:19:03 +0200
Message-ID: <CACRpkdYETvpsr1X1dfiGfg9i=Tq2qHJBZHv7Us4aZ_1HQcOdoA@mail.gmail.com>
References: <359d62c1f2f7ef61c6160df9b60c1af4bfcea89a.1496664241.git.baolin.wang@spreadtrum.com>
 <CACRpkdbtuPKr=tWGoJC-sg2Oj47rYMpo6fs_Us=Nynew1Wkz=w@mail.gmail.com>
 <20170612060718.GA8566@spreadtrum.com> <20170613031547.GA29679@spreadtrum.com>
 <CACRpkdbaP1U3pefTbPj-wOa1AibcJHBBALfKWO8dBR=YW8f7zA@mail.gmail.com> <CAMz4ku+jZ-S6sBL=ib++j+ooqweU9UC+MTgFca7ScrQiJDeZVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMz4ku+jZ-S6sBL=ib++j+ooqweU9UC+MTgFca7ScrQiJDeZVQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 21, 2017 at 10:10 AM, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 20 June 2017 at 17:31, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Tue, Jun 13, 2017 at 5:15 AM, Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> wrote:
>>
>>> I forgot one most important reason why we can not use the "sleep" state. As I explained
>>> above, the sleep related configuration will bind with the pin's sleep mode. If we set the
>>> pin's sleep mode as AP_SLEEP, then we can select "sleep" state when AP system goes into
>>> deep sleep mode by issuing "pinctrl_force_sleep()" in pinctrl suspend function.
>>>
>>> But if we set the pin's sleep mode as PUBCP_SLEEP and pubcp system doesn't run linux kernel
>>> (it run another thread OS), then we can not select "sleep" state since the AP system does
>>> not go into deep sleep mode (AP system run linux kernel OS).
>>
>> Allright yes it makes sense, and also there are systems that just go into
>> "hardware sleep" and just put the pin into some pre-programmed mode.
>>
>> I'm a bit back-and-forth. I didn't mean that some code would actually
>> switch the state to "sleep" when we go to sleep, I meant that when
>> the system configures "default" mode it should also look up and
>> program the "sleep" mode, but this approach with a special property
>> is just another way of achieveing the same thing.
>>
>> But then we should add a whole slew of sleep states.
>>
>> I was thinking whether we could avoid having a special DT property
>> by parsing ahead to states we do not currently use and programming
>> that into the sleep mode registers.
>
> Yes, for most scenarios, it can work with the "sleep" state to set
> sleep-related config. But for our Spreadtrum platform scenario (I do
> not know if there are other platforms need this feature), we can not
> select the "sleep" state when pubcp system goes into deep sleep mode
> but ap system does not go into deep sleep mode. So I think we still
> need these "sleep-bias-pull-up", "sleep-bias-pull-down",
> "sleep-input-enable" and "sleep-output-enable" properties.

I don't really mean you should select the "sleep" state.

I meant, as part of setting the "default" state or even the "init"
state, we would inspect the "sleep" state, use those settings, and
program them into the registers at this early point.

Then never touch the registers again, and never really go to the
sleep state by software, just by hardware.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
