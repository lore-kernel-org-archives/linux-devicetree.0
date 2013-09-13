From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] memory: add a basic OF-based memory driver
Date: Thu, 12 Sep 2013 17:57:32 -0700
Message-ID: <CAOesGMiUMniKRLRgGPsimR0bXWQFbx+SL5dUJXOb8t0JfEcHsg@mail.gmail.com>
References: <1378863781-4235-1-git-send-email-emilio@elopez.com.ar>
	<1379032225-6425-1-git-send-email-emilio@elopez.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379032225-6425-1-git-send-email-emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?ISO-8859-1?Q?David_Lanzend=F6rfer?= <david.lanzendoerfer-Z7Kmv9EsliU@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2013 at 5:30 PM, Emilio L=F3pez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org> =
wrote:
> This driver's only job is to claim and ensure the necessary clock
> for memory operation on a DT-powered machine remains enabled.
>
> Signed-off-by: Emilio L=F3pez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
> ---
>
> I believe this new patch should resolve all the concerns raised; as
> always, all feedback is welcome :)

I think you're going about this the wrong way.

If you have a problem with a clock not staying on, shouldn't you just
marking it appropriately in the clock table instead, making sure it's
initialized with at least one reference to it? I believe that is how
some of the other platforms handle this, and it's a lot cleaner than
adding a fake binding and a fake driver just to grab a single clock.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
