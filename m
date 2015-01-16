From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH V3 4/4] mmc: pwrseq_simple: Add support for a reset GPIO pin
Date: Fri, 16 Jan 2015 13:52:25 +0100
Message-ID: <CAPDyKFr+7qWymd63TjgyPBnePbDpamOi_5DQkjonBAKBnEGHOw@mail.gmail.com>
References: <1421405273-19117-1-git-send-email-ulf.hansson@linaro.org>
	<1421405273-19117-5-git-send-email-ulf.hansson@linaro.org>
	<CAAObsKDm1iPAWgJpQwed8KufkxKwqTAFa5espfqq+jY13r+Ymw@mail.gmail.com>
	<CAPDyKFoLqmgTvJpFLrGZvxrfug+SyspsYaOYtf65CsZ7T991pA@mail.gmail.com>
	<20150116124511.GG18220@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <20150116124511.GG18220@pengutronix.de>
Sender: linux-mmc-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-mmc <linux-mmc@vger.kernel.org>, Chris Ball <chris@printf.net>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Alexandre Courbot <gnurou@gmail.com>, NeilBrown <neilb@suse.de>, Linus Walleij <linus.walleij@linaro.org>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, Arend van Spriel <arend@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 16 January 2015 at 13:45, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> On Fri, Jan 16, 2015 at 01:37:41PM +0100, Ulf Hansson wrote:
>> On 16 January 2015 at 12:34, Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>> > On 16 January 2015 at 11:47, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>> >>
>> >>  int mmc_pwrseq_simple_alloc(struct mmc_host *host, struct device *dev)
>> >>  {
>> >>         struct mmc_pwrseq_simple *pwrseq;
>> >> +       int ret = 0;
>> >>
>> >>         pwrseq = kzalloc(sizeof(struct mmc_pwrseq_simple), GFP_KERNEL);
>> >>         if (!pwrseq)
>> >>                 return -ENOMEM;
>> >>
>> >> +       pwrseq->reset_gpio = gpiod_get_index(dev, "reset", 0, GPIOD_OUT_HIGH);
>> >> +       if (IS_ERR(pwrseq->reset_gpio) &&
>> >> +               PTR_ERR(pwrseq->reset_gpio) != -ENOENT &&
>> >> +               PTR_ERR(pwrseq->reset_gpio) != -ENOSYS) {
>> >> +               ret = PTR_ERR(pwrseq->reset_gpio);
>> >> +               goto free;
>> >> +       }
>> >> +
>> >>         pwrseq->pwrseq.ops = &mmc_pwrseq_simple_ops;
>> >>         host->pwrseq = &pwrseq->pwrseq;
>> >>
>> >>         return 0;
>> >> +free:
>> >> +       kfree(&pwrseq);
>> >
>> > Hi Ulf,
>> >
>> > this kfree looks a bit fishy (there's one more instance of it in
>> > mmc_pwrseq_simple_free).
>>
>> This is the error path, which means I need to clean up data that I
>> have allocated.
>
> I think Tomeu meant that the '&' must be removed.
>

Of course, thanks!

Unless I get some more comments I will fix it when I queue the patch.

Kind regards
Uffe
