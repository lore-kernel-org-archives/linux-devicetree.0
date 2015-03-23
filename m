From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/3] mailbox: Add support for ST's Mailbox IP
Date: Mon, 23 Mar 2015 15:06:46 +0000
Message-ID: <20150323150646.GO24804@x1>
References: <1425379283-1567-1-git-send-email-lee.jones@linaro.org>
 <1425379283-1567-4-git-send-email-lee.jones@linaro.org>
 <3926609.Ff6LCkuuMX@wuerfel>
 <CAJe_ZhdjPa3C_TUDAPA3fS3K83FGB-GaAjVBjtsow2mp5h8NRw@mail.gmail.com>
 <20150318131722.GN3318@x1>
 <CABb+yY0wmy+oYUsVkStrMVmfGjvedDPn+wsN_yjvdMRQoVEHOg@mail.gmail.com>
 <20150318153421.GP3318@x1>
 <CABb+yY0HufMEDy7ANj8KV0hamvM-Tgy4GBkwD73wm3DMumcbaQ@mail.gmail.com>
 <20150319091742.GX3318@x1>
 <CABb+yY3GZG0Dg5Vzsp1Cv+C1_yc8SxuqGFXLi3_wg7TrBbk6jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY3GZG0Dg5Vzsp1Cv+C1_yc8SxuqGFXLi3_wg7TrBbk6jw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Devicetree List <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

On Thu, 19 Mar 2015, Jassi Brar wrote:

> On Thu, Mar 19, 2015 at 2:47 PM, Lee Jones <lee.jones@linaro.org> wro=
te:
> > On Thu, 19 Mar 2015, Jassi Brar wrote:
> >
> >> On Wed, Mar 18, 2015 at 9:04 PM, Lee Jones <lee.jones@linaro.org> =
wrote:
> >> > On Wed, 18 Mar 2015, Jassi Brar wrote:
> >> >
> >> >> On Wed, Mar 18, 2015 at 6:47 PM, Lee Jones <lee.jones@linaro.or=
g> wrote:
> >> >> > On Tue, 03 Mar 2015, Jassi Brar wrote:
> >> >> >
> >> >> >> On 3 March 2015 at 17:04, Arnd Bergmann <arnd@arndb.de> wrot=
e:
> >> >> >> > On Tuesday 03 March 2015 10:41:23 Lee Jones wrote:
> >> >> >> >> +
> >> >> >> >> +/*
> >> >> >> >> + * struct sti_mbox_msg - sti mailbox message description
> >> >> >> >> + * @dsize:             data payload size
> >> >> >> >> + * @pdata:             message data payload
> >> >> >> >> + */
> >> >> >> >> +struct sti_mbox_msg {
> >> >> >> >> +       u32             dsize;
> >> >> >> >> +       u8              *pdata;
> >> >> >> >> +};
> >> >> >> >
> >> >> >> > As mentioned in another thread, we may just want to add a =
'size'
> >> >> >> > argument to the message send function, and a default helpe=
r for
> >> >> >> > messages with size of 32 bits.
> >> >> >> >
> >> >> >> Case-a) 'size' is a member of the payload structure itself
> >> >> >>     The extra 'size' argument would only be used for sanity =
check.
> >> >> >>     This driver seems so. Lee, can you not do without 'dsize=
'?
> >> >> >>
> >> >> >> Case-b) 'size' is not a member of payload structure:
> >> >> >>      b1)  payload is fixed length, that is 'size' :=3D sizeo=
f(struct my_payload)
> >> >> >>             Here the size argument is redundant.
> >> >> >>
> >> >> >>      b2)  payload length varies
> >> >> >>             This case is highly unlikely because there would=
 be no way
> >> >> >> for remote to know how many bytes to read as the payload. No=
t to mean
> >> >> >> we can't do without the 'size' argument.
> >> >> >>
> >> >> >> Your opinion has huge weight, but I would like to be enlight=
ened
> >> >> >> before agreeing.
> >> >> >
> >> >> > Let's simplify this.
> >> >> >
> >> >> > If you want to have varying length payloads, you have to carr=
y the
> >> >> > size in the payload.  If you wish to force fixed size payload=
s, then
> >> >> > you may do without a size segment.
> >> >> >
> >> >> > Do you really want to force all users of Mailbox to use fixed=
 size
> >> >> > payloads?
> >> >> >
> >> >> No. I only observed the fact that every known mailbox controlle=
r
> >> >> driver already has a way to figure out the payload length becau=
se
> >> >> either the protocol uses fixed length payloads or has the 'size=
' field
> >> >> in every payload.
> >> >> I am yet to see a platform that uses both, then the 'size' argu=
ment
> >> >> will be helpful but still not necessary.
> >> >
> >> > I see.  So your real concern is that controllers shouldn't have =
two
> >> > means of obtaining size.
> >> >
> >> I think right now there's not much need to expand the api for 'u32=
'
> >> sized payloads.
> >>
> >> > Arnd's idea of placing the message size as part of the send_mess=
age()
> >> > call is fine, but it's still going to end up in the payload isn'=
t it?
> >> >
> >> ... or it will be implied by sizeof(struct my_packet) if the proto=
col
> >> has finite set of payloads.
> >>
> >> > And what about receiving?
> >> >
> >> Similar to sending - controller driver passes pointer to RX buffer
> >> which the client parses. Remember the protocol would already have =
a
> >> way to communicate payload length.
> >
> > So this is the bit that's getting me.  How do you pass payload leng=
th
> > to the remote processor if you don't have it in the payload?
> >
> Some protocol may use signature to identify a packet type.
> For example, the remote supports upto 100 commands, each having uniqu=
e
> 8bit code. At fixed offset of any payload is the command code. All th=
e
> remote needs to do is read the u8 value of predefined offset and use
> it dispatch the payload to handler of that command. The command
> handler would know the format of such requests.

Okay, I see what you're saying.  We'll push the knowledge of 'command
type', 'size' and anything else we wish to encode into the message
back into the client so the controller doesn't have to worry about
it.  Sounds reasonable to me.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
