From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] mailbox: Add support for ST's Mailbox IP
Date: Thu, 19 Mar 2015 09:17:42 +0000
Message-ID: <20150319091742.GX3318@x1>
References: <1425379283-1567-1-git-send-email-lee.jones@linaro.org>
 <1425379283-1567-4-git-send-email-lee.jones@linaro.org>
 <3926609.Ff6LCkuuMX@wuerfel>
 <CAJe_ZhdjPa3C_TUDAPA3fS3K83FGB-GaAjVBjtsow2mp5h8NRw@mail.gmail.com>
 <20150318131722.GN3318@x1>
 <CABb+yY0wmy+oYUsVkStrMVmfGjvedDPn+wsN_yjvdMRQoVEHOg@mail.gmail.com>
 <20150318153421.GP3318@x1>
 <CABb+yY0HufMEDy7ANj8KV0hamvM-Tgy4GBkwD73wm3DMumcbaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY0HufMEDy7ANj8KV0hamvM-Tgy4GBkwD73wm3DMumcbaQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 19 Mar 2015, Jassi Brar wrote:

> On Wed, Mar 18, 2015 at 9:04 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wro=
te:
> > On Wed, 18 Mar 2015, Jassi Brar wrote:
> >
> >> On Wed, Mar 18, 2015 at 6:47 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =
wrote:
> >> > On Tue, 03 Mar 2015, Jassi Brar wrote:
> >> >
> >> >> On 3 March 2015 at 17:04, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> >> >> > On Tuesday 03 March 2015 10:41:23 Lee Jones wrote:
> >> >> >> +
> >> >> >> +/*
> >> >> >> + * struct sti_mbox_msg - sti mailbox message description
> >> >> >> + * @dsize:             data payload size
> >> >> >> + * @pdata:             message data payload
> >> >> >> + */
> >> >> >> +struct sti_mbox_msg {
> >> >> >> +       u32             dsize;
> >> >> >> +       u8              *pdata;
> >> >> >> +};
> >> >> >
> >> >> > As mentioned in another thread, we may just want to add a 'si=
ze'
> >> >> > argument to the message send function, and a default helper f=
or
> >> >> > messages with size of 32 bits.
> >> >> >
> >> >> Case-a) 'size' is a member of the payload structure itself
> >> >>     The extra 'size' argument would only be used for sanity che=
ck.
> >> >>     This driver seems so. Lee, can you not do without 'dsize'?
> >> >>
> >> >> Case-b) 'size' is not a member of payload structure:
> >> >>      b1)  payload is fixed length, that is 'size' :=3D sizeof(s=
truct my_payload)
> >> >>             Here the size argument is redundant.
> >> >>
> >> >>      b2)  payload length varies
> >> >>             This case is highly unlikely because there would be=
 no way
> >> >> for remote to know how many bytes to read as the payload. Not t=
o mean
> >> >> we can't do without the 'size' argument.
> >> >>
> >> >> Your opinion has huge weight, but I would like to be enlightene=
d
> >> >> before agreeing.
> >> >
> >> > Let's simplify this.
> >> >
> >> > If you want to have varying length payloads, you have to carry t=
he
> >> > size in the payload.  If you wish to force fixed size payloads, =
then
> >> > you may do without a size segment.
> >> >
> >> > Do you really want to force all users of Mailbox to use fixed si=
ze
> >> > payloads?
> >> >
> >> No. I only observed the fact that every known mailbox controller
> >> driver already has a way to figure out the payload length because
> >> either the protocol uses fixed length payloads or has the 'size' f=
ield
> >> in every payload.
> >> I am yet to see a platform that uses both, then the 'size' argumen=
t
> >> will be helpful but still not necessary.
> >
> > I see.  So your real concern is that controllers shouldn't have two
> > means of obtaining size.
> >
> I think right now there's not much need to expand the api for 'u32'
> sized payloads.
>=20
> > Arnd's idea of placing the message size as part of the send_message=
()
> > call is fine, but it's still going to end up in the payload isn't i=
t?
> >
> ... or it will be implied by sizeof(struct my_packet) if the protocol
> has finite set of payloads.
>=20
> > And what about receiving?
> >
> Similar to sending - controller driver passes pointer to RX buffer
> which the client parses. Remember the protocol would already have a
> way to communicate payload length.

So this is the bit that's getting me.  How do you pass payload length
to the remote processor if you don't have it in the payload?  Unless
we are using cross-terminology of course.  I'm thinking that the
payload is the entire message sent to the remote proc i.e:
[[ size ][ data]].

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
