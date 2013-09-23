From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] gpio: interrupt consistency check for OF GPIO IRQs
Date: Mon, 23 Sep 2013 21:41:43 +0200
Message-ID: <CACRpkdZxFpw=EYB4A4nZu7LWjQb6QppVctUsBBDiCMsCBbqm5A@mail.gmail.com>
References: <1377526030-32024-1-git-send-email-larsi@wh2.tu-dresden.de>
	<52279524.8090006@wwwdotorg.org>
	<20130909161924.GT29403@sirena.org.uk>
	<2052193.CMUEUJFRgS@lem-wkst-02>
	<522F78CB.2020507@wwwdotorg.org>
	<20130910213718.GH29403@sirena.org.uk>
	<522F9E6C.2010905@wwwdotorg.org>
	<522FBED9.9000305@collabora.co.uk>
	<5230C7F6.3080803@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5230C7F6.3080803-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars Poeschel <poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org>, Lars Poeschel <larsi-myOXECIRRCL4ajHJ1XSv27NAH6kLmebB@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Enric Balletbo i Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Balaji T K <balajitk-l0cyMroinI0@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Jon Hunter <jgchunter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, joelf-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 11, 2013 at 9:43 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 09/10/2013 06:52 PM, Javier Martinez Canillas wrote:

>> I'm a bit confused now. Doesn't the fact that gpio_request() prevents
>> double-requests mean that the use-case that you say that have not been covered
>> by this patch can't actually happen?
>>
>> I mean, if when using board files an explicit call to gpio_request() is made by
>> platform code then a driver can't call gpio_request() for the same gpio. So this
>> patch shouldn't cause any regression since is just auto-requesting a GPIO when
>> is mapped as an IRQ in a DT which basically will be the same that was made by
>> board files before.
>
> I'm not familiar with the board file path; Linus describe this.

Oh um? Not following, that stuff is right above, what is unclear
about this that I need to describe?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
