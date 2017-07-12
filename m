From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] DT: pinctrl: Add binding documentation for
 Spreadtrum pin controller
Date: Wed, 12 Jul 2017 14:04:15 +0200
Message-ID: <CACRpkdZg018Q7EE-LvsLqWDm3=P2_L58MxR3fcgcUtGaAXk45A@mail.gmail.com>
References: <359d62c1f2f7ef61c6160df9b60c1af4bfcea89a.1496664241.git.baolin.wang@spreadtrum.com>
 <CACRpkdbtuPKr=tWGoJC-sg2Oj47rYMpo6fs_Us=Nynew1Wkz=w@mail.gmail.com>
 <20170612060718.GA8566@spreadtrum.com> <20170613031547.GA29679@spreadtrum.com>
 <CACRpkdbaP1U3pefTbPj-wOa1AibcJHBBALfKWO8dBR=YW8f7zA@mail.gmail.com>
 <CAMz4ku+jZ-S6sBL=ib++j+ooqweU9UC+MTgFca7ScrQiJDeZVQ@mail.gmail.com>
 <CACRpkdYETvpsr1X1dfiGfg9i=Tq2qHJBZHv7Us4aZ_1HQcOdoA@mail.gmail.com> <CAMz4kuJigdhbV5+J1CcqP6zb7pqi9HaW=dxe_rsNi-=RsQ70vA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMz4kuJigdhbV5+J1CcqP6zb7pqi9HaW=dxe_rsNi-=RsQ70vA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 27, 2017 at 9:59 AM, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 26 June 2017 at 06:19, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

>> I meant, as part of setting the "default" state or even the "init"
>> state, we would inspect the "sleep" state, use those settings, and
>> program them into the registers at this early point.
>
> I understood your points. But we can not program all into the
> registers at one early point, sometimes these sleep-related configs
> need depend on some conditions in users' drivers, like on condition 1:
> driver need to set one pin as input-enable when specified system goes
> into deep sleep, on condition 2: driver need set this pin as
> output-enable when specified system goes into deep sleep. So I still
> think it is better if we introduce some standard sleep related
> configs.

So you mean you need special runtime states to set up sleep states?

Do you have an example of how this would look in the device tree?

I am sorry but I have a hard time following the use case :(

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
