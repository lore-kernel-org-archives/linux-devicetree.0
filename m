From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] mailbox: Add support for ST's Mailbox IP
Date: Wed, 18 Mar 2015 13:17:22 +0000
Message-ID: <20150318131722.GN3318@x1>
References: <1425379283-1567-1-git-send-email-lee.jones@linaro.org>
 <1425379283-1567-4-git-send-email-lee.jones@linaro.org>
 <3926609.Ff6LCkuuMX@wuerfel>
 <CAJe_ZhdjPa3C_TUDAPA3fS3K83FGB-GaAjVBjtsow2mp5h8NRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJe_ZhdjPa3C_TUDAPA3fS3K83FGB-GaAjVBjtsow2mp5h8NRw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 03 Mar 2015, Jassi Brar wrote:

> On 3 March 2015 at 17:04, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Tuesday 03 March 2015 10:41:23 Lee Jones wrote:
> >> +
> >> +/*
> >> + * struct sti_mbox_msg - sti mailbox message description
> >> + * @dsize:             data payload size
> >> + * @pdata:             message data payload
> >> + */
> >> +struct sti_mbox_msg {
> >> +       u32             dsize;
> >> +       u8              *pdata;
> >> +};
> >
> > As mentioned in another thread, we may just want to add a 'size'
> > argument to the message send function, and a default helper for
> > messages with size of 32 bits.
> >
> Case-a) 'size' is a member of the payload structure itself
>     The extra 'size' argument would only be used for sanity check.
>     This driver seems so. Lee, can you not do without 'dsize'?
>=20
> Case-b) 'size' is not a member of payload structure:
>      b1)  payload is fixed length, that is 'size' :=3D sizeof(struct =
my_payload)
>             Here the size argument is redundant.
>=20
>      b2)  payload length varies
>             This case is highly unlikely because there would be no wa=
y
> for remote to know how many bytes to read as the payload. Not to mean
> we can't do without the 'size' argument.
>=20
> Your opinion has huge weight, but I would like to be enlightened
> before agreeing.

Let's simplify this.

If you want to have varying length payloads, you have to carry the
size in the payload.  If you wish to force fixed size payloads, then
you may do without a size segment.

Do you really want to force all users of Mailbox to use fixed size
payloads?  That sounds daft to me, as we have no idea how the payload
is being used by the remote processor.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
