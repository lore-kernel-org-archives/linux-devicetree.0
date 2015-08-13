From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/6] mailbox: Add generic mechanism for testing
 Mailbox Controllers
Date: Thu, 13 Aug 2015 14:07:36 +0100
Message-ID: <20150813130736.GG8782@x1>
References: <20150812102328.GD18282@x1>
 <CABb+yY0A74Vy3-KOvj0URU_4zb2FAC7Yp3gmEwnFaBrD0mzt0w@mail.gmail.com>
 <20150813091914.GB8782@x1>
 <CABb+yY0cgbtM68-E_Xqgh5O6GRLXESYTLa5WcAwUBoVL3ufrxA@mail.gmail.com>
 <20150813102335.GC8782@x1>
 <CABb+yY3z7p97eOhncQ2i+g6yoYGfDgSN9BDPKmiDaVLa3oPocA@mail.gmail.com>
 <20150813110008.GD8782@x1>
 <CABb+yY34i=VUnswUE21vgeQYAGOS=7uwvdnTAFFgYkTV0CFk=w@mail.gmail.com>
 <20150813114005.GF8782@x1>
 <CABb+yY2OH16mgOwi=yH_eEHQN2Ck2x5xtVk-p-8Un9gGmcACdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY2OH16mgOwi=yH_eEHQN2Ck2x5xtVk-p-8Un9gGmcACdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 13 Aug 2015, Jassi Brar wrote:

> On Thu, Aug 13, 2015 at 5:10 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wro=
te:
> > On Thu, 13 Aug 2015, Jassi Brar wrote:
> >
> >> On Thu, Aug 13, 2015 at 4:30 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =
wrote:
> >> > On Thu, 13 Aug 2015, Jassi Brar wrote:
> >> >
> >> >> On Thu, Aug 13, 2015 at 3:53 PM, Lee Jones <lee.jones-QSEj5FYQhm5QFI55V6+gNQ@public.gmane.org=
g> wrote:
> >> >> > On Thu, 13 Aug 2015, Jassi Brar wrote:
> >> >> >
> >> >> >> On Thu, Aug 13, 2015 at 2:49 PM, Lee Jones <lee.jones@linaro=
=2Eorg> wrote:
> >> >> >> > On Thu, 13 Aug 2015, Jassi Brar wrote:
> >> >> >>
> >> >> >> >> >> > +
> >> >> >> >> >> > +static void mbox_test_prepare_message(struct mbox_c=
lient *client, void *message)
> >> >> >> >> >> > +{
> >> >> >> >> >> > +       struct mbox_test_device *tdev =3D dev_get_dr=
vdata(client->dev);
> >> >> >> >> >> > +
> >> >> >> >> >> > +       if (tdev->mmio)
> >> >> >> >> >> > +               memcpy(tdev->mmio, message, MBOX_MAX=
_MSG_LEN);
> >> >> >> >> >> >
> >> >> >> >> >> This is unlikely to work. Those platforms that need to=
 send a 2 part
> >> >> >> >> >> message, they do :
> >> >> >> >> >> (a) Signal/Command/Target code via some controller reg=
ister (via
> >> >> >> >> >> mbox_send_message).
> >> >> >> >> >> (b) Setup the payload in Shared-Memory (via tx_prepare=
).
> >> >> >> >> >>
> >> >> >> >> >> This test driver assumes both are the same. I think yo=
u have to
> >> >> >> >> >> declare something like
> >> >> >> >> >
> >> >> >> >> > This driver assumes that the framework will call client=
->tx_prepare()
> >> >> >> >> > first, which satisfies (b).  It then assumes controller=
->send_data()
> >> >> >> >> > will be invoked, which will send the platform specific
> >> >> >> >> > signal/command/target code, which then satisfies (a).
> >> >> >> >> >
> >> >> >> >> Yeah, but what would be that code? Who provides that?
> >> >> >> >>
> >> >> >> >> > In what way does it assume they are the same?
> >> >> >> >> >
> >> >> >> >> notice the 'message' pointer in
> >> >> >> >> mbox_send_message(tdev->tx_channel, message);
> >> >> >> >>     and
> >> >> >> >> memcpy(tdev->mmio, message, MBOX_MAX_MSG_LEN);
> >> >> >> >>
> >> >> >> >> >> struct mbox_test_message { /* same for TX and RX */
> >> >> >> >> >>           unsigned sig_len;
> >> >> >> >> >>           void *signal;               /* rx/tx via mai=
lbox api */
> >> >> >> >> >>           unsigned pl_len;
> >> >> >> >> >>           void *payload;           /* rx/tx via shared=
-memory */
> >> >> >> >> >> };
> >> >> >> >> >
> >> >> >> >> > How do you think this should be set and use these?
> >> >> >> >> >
> >> >> >> >> The userspace would want to specify the command code (32b=
its or not)
> >> >> >> >> that would be passed via the fifo/register of the control=
ler. So we
> >> >> >> >> need signal[]
> >> >> >> >>
> >> >> >> >> The data to be passed via share-memory could be provided =
by userspace
> >> >> >> >> via the payload[] array.
> >> >> >> >
> >> >> >> > Okay, so would the solution be two userspace files 'signal=
' and
> >> >> >> > 'message', so in the case of a client specified signal we =
can write it
> >> >> >> > into there first.
> >> >> >> >
> >> >> >> > echo 255  > signal
> >> >> >> > echo test > message
> >> >> >> >
> >> >> >> > ... or in the case where no signal is required, or the con=
troller
> >> >> >> > driver taking care of it, we just don't write anything to =
signal?
> >> >> >> >
> >> >> >> file_operations.write() should parse signal and message, com=
ing from
> >> >> >> userspace, into a local structure before routing them via
> >> >> >> mbox_send_message and tx_prepare respectively.
> >> >> >
> >> >> > Okay.  So before I code this up we should agree on syntax.
> >> >> >
> >> >> > How would you like to represent the break between signal and =
message?
> >> >> > Obviously ' ' would be a bad idea, as some clients may want t=
o send
> >> >> > messages with white space contained.  How about '\t' or '\n'?
> >> >> >
> >> >> Yeah, I am not a fan of markers and flags either.
> >> >>
> >> >> Maybe we should share with userspace
> >> >>   struct mbox_test_message { /* same for TX and RX */
> >> >>            unsigned sig_len;
> >> >>            void __user *signal;        /* rx/tx via mailbox api=
 */
> >> >>            unsigned pl_len;
> >> >>            void __user *payload;    /* rx/tx via shared-memory =
*/
> >> >>   };
> >> >>
> >> >> First copy_from_user the structure of length sizof(struct
> >> >> mbox_test_message) and then copy_from_user length sig_len and p=
l_len
> >> >> from signal[] and payload[] respectively (usually ioctls would =
carry
> >> >> such data).
> >> >
> >> > Simplicity and ease of use should be the goals here.  Testers sh=
ould
> >> > not have to write applications to use this driver.  Can we come =
up
> >> > with a simple/effective method that uses SYSFS/DEBUGFS please?
> >> >
> >> > The easiest way I can think of which avoids markers/separators A=
ND the
> >> > requirement for users to have to write applications is to have t=
wo
> >> > files, 'signal' and 'message' as mentioned before.  Once both ar=
e
> >> > populated I can get this driver to draft the message appropriate=
ly and
> >> > fire it off.
> >> >
> >> And then write to more files for RX data? ... which should also be=
 in
> >> the form of 'signal' and 'message'.
> >>
> >> BTW like for spi there is a stock application in
> >> Documentation/spi/spidev_test.c we could do the same?
> >
> > Coming from personal experience, testing drivers with (even stock)
> > applications is much more painful that simply writing/reading
> > (cat/echo) to a file in SYSFS/DEBUGFS.  Particularly if people are
> > using initramfs or thelike.  If it is possible to use SYSFS/DEBUGFS=
,
> > which it is in this case, then I believe that's the route we could =
go
> > down.
> >
> Well, where could sysfs/debugfs not be used? :)  Anyways I am ok if
> prefer debugfs.

You know what I mean; CPIO et. al.

> > In answer to your question; we only need those two files.  The repl=
y
> > can be placed back into 'message' and can be read from there.
> >
> Testing shouldn't be restricted to 'send command and receive reply'.
> What if Linux only listens to broadcasts from the remote? Who knows
> someone might want to (ab)use this test client to implement userspace
> handler of remote commands?
> So please see RX to be independent of TX.

Sure.

Now just agree with me that mbox_request_chan() should fail on request
of a known bad configuration request and I can code all this up and
re-submit. :D

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
