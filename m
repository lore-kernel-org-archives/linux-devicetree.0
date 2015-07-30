From: Michael Ira Krufky <mkrufky-dJidKbW2IEtAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 02/12] [media] dvb-pll: Add support for THOMSON DTT7546X tuner.
Date: Thu, 30 Jul 2015 07:14:47 -0400
Message-ID: <CAOcJUbw5hSmPdrz6rPPYU6iMBHnvOZc1p3f+4WhEYq2-XmAPVw@mail.gmail.com>
References: <1435158670-7195-1-git-send-email-peter.griffin@linaro.org>
	<1435158670-7195-3-git-send-email-peter.griffin@linaro.org>
	<1435195057.9377.18.camel@perches.com>
	<20150722185811.2d718baa@recife.lan>
	<20150730094738.GD488@griffinp-ThinkPad-X1-Carbon-2nd>
	<1438250928.2677.10.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438250928.2677.10.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hugues.fruchet-qxv4g6HH51o@public.gmane.org, linux-media <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 30, 2015 at 6:08 AM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
> On Thu, 2015-07-30 at 10:47 +0100, Peter Griffin wrote:
>> Hi Mauro / Joe,
>>
>> On Wed, 22 Jul 2015, Mauro Carvalho Chehab wrote:
>>
>> > Em Wed, 24 Jun 2015 18:17:37 -0700
>> > Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> escreveu:
>> >
>> > > On Wed, 2015-06-24 at 16:11 +0100, Peter Griffin wrote:
>> > > > This is used in conjunction with the STV0367 demodulator on
>> > > > the STV0367-NIM-V1.0 NIM card which can be used with the STi
>> > > > STB SoC's.
>> > >
>> > > Barely associated to this specific patch, but for
>> > > dvb-pll.c, another thing that seems possible is to
>> > > convert the struct dvb_pll_desc uses to const and
>> > > change the "entries" fixed array size from 12 to []
>> > >
>> > > It'd save a couple KB overall and remove ~5KB of data.
>> > >
>> > > $ size drivers/media/dvb-frontends/dvb-pll.o*
>> > >    text      data     bss     dec     hex filename
>> > >    8520      1552    2120   12192    2fa0 drivers/media/dvb-frontends/dvb-pll.o.new
>> > >    5624      6363    2120   14107    371b drivers/media/dvb-frontends/dvb-pll.o.old
>> >
>> > Peter,
>> >
>> > Please add this patch on the next patch series you submit.
>>
>> Ok will do, I've added this patch with a slightly updated commit message
>> to my series.
>>
>> Joe - Can I add your signed-off-by?
>
> Signed-off-by: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>

Reviewed-by: Michael Ira Krufky <mkrufky-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Joe, nice optimization - thanks for that.

With regards to Peter's patch, is this a digital-only tuner, or is it
a hybrid tuner?

The 5th byte that you send to the THOMSON DTT7546X seems to resemble
the 'auxiliary byte' that gets set in tuner-simple.c

I'm not sure that dvb-pll is the right place for this tuner
definition, if this is the case.  Maybe this definition belongs in
tuner-simple instead, if the pattern matches better there.

Mauro, can we hold off on merging Peter's patch until we resolve this?

-Michael Ira Krufky
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
