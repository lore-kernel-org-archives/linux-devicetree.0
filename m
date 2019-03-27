From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v4 0/4] Add support for lradc on A83T
Date: Wed, 27 Mar 2019 10:16:24 +0800
Message-ID: <CAGb2v649vo4Neudau+jmE_7egsL6nuTgOezjgfO08w0rQCpbPw@mail.gmail.com>
References: <20190327002501.4630-1-megous@megous.com>
Reply-To: wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBBN25PSAKGQEXLB4B7Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190327002501.4630-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 27, 2019 at 8:25 AM <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:
>
> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
>
> This series implements r_lradc (low res ADC) support for A83T.
>
> This is a continuation of v3 patch series from 2017 by Ziping Chen. I've
> rebased it on top of linux-next and changed the compatibe string as
> requested back then.[1]
>
> There was some talk of iio based lradc driver back then[2], but noone
> stepped forward to make it. Let's finish this series, so that it's
> at least possible to add support for tablet keys on various A83T tablets
> as that's the main use of lradc module.
>
> [1] https://lkml.org/lkml/2017/6/26/558
>
> [2] https://lkml.org/lkml/2017/6/27/877
>
> Please take a look, and apply the patches if you have no objections.

You need to send this series to the input subsystem maintainer, Dmitry
Torokhov, and CC the input mailing list. Otherwise the driver and binding
changes won't be picked up.

ChenYu
