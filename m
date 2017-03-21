From: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: Question regarding back compatibility for DT
Date: Tue, 21 Mar 2017 09:16:41 -0700
Message-ID: <CANCZdfpwRSSEhBcr_BrvRj4MfBbMHSYpC+wJvm7fU6h=GXkqtg@mail.gmail.com>
References: <20170321155814.GA10342@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170321155814.GA10342@mai>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 21, 2017 at 8:58 AM, Daniel Lezcano
<daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Rob, dt people,
>
> is it acceptable a driver is changed using a new DT binding but becomes
> incompatible with the old DT files ?
>
> IOW, is it possible to change the DT and the driver without supporting th=
e old
> DT format, forcing an update of the DT and the kernel ?

I've seen new properties many times added, even though the new driver
wouldn't work quite right on old DT files. I've also seen people
create a new hardware compatibility name for a totally new binding.
Finally, I've seen the bindings just randomly change for no reason
with no concern for backwards compat. The last really sucks if you
have a driver that's not in the Linux tree (say, because it's a
FreeBSD driver).

Warner

> Thanks.
>
>   -- Daniel
>
> --
>
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
