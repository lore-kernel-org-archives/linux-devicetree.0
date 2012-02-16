From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: remoteproc: Load coprocessor code to the specific main memory
 location
Date: Thu, 16 Feb 2012 21:21:48 +0100
Message-ID: <CAHTX3dJ4PruKO-wJLJU8W0boHFL0f6eoF+QNaoNjm5hu26YEow@mail.gmail.com>
References: <4F1EE861.4030405@monstr.eu>
 <CAK=Wgba5kT8AwLtuHyosucYnWf-EA+xpE1kzmssfhSC7ZXQA=g@mail.gmail.com>
 <4F1FF870.3000105@monstr.eu>
 <CAK=WgbZwaxMPsMiNcq5yFvBLrcODqGgDT6b=mmQ91JBVtTEyXA@mail.gmail.com>
 <4F200F64.9060203@monstr.eu>
 <CAK=WgbZDADRf1OF=uWbbsF+t2dx36tqj=kRftn5nd4RA7DtEnA@mail.gmail.com>
 <4F212E9E.9060807@monstr.eu>
 <CAK=WgbYMBDp3Qm8TErNrnDwn2ZTFt62+OuyyQvVE-jrnNsL6kg@mail.gmail.com>
 <4F391C1D.9020402@monstr.eu>
 <CAK=WgbYn6hrS4YLEdfp=0jSEfEwy-HkJmt5S06_j6gZFf0UTmQ@mail.gmail.com>
 <4F3BA962.9040109@monstr.eu> <4F3BC30A.4030301@monstr.eu>
 <4F3CC899.4070302@monstr.eu>
 <CAK=WgbaRF-L7M3VMZQdqFLUFOJuwFVkBH1hUNuJ51kSrzkaVjA@mail.gmail.com>
 <4F3CFFAD.9030402@monstr.eu> <4F3D032B.6090700@monstr.eu>
 <CAK=WgbZ3oXc+NQscdShqmu2wkzv=M-qBDCH2-k=5qSRX9W=z3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2474047746952800187=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAK=WgbZ3oXc+NQscdShqmu2wkzv=M-qBDCH2-k=5qSRX9W=z3Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, "Grosen, Mark" <mgrosen-l0cyMroinI0@public.gmane.org>, linux-arm <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============2474047746952800187==
Content-Type: multipart/alternative; boundary=00504502d1b0e4525204b91a9399

--00504502d1b0e4525204b91a9399
Content-Type: text/plain; charset=ISO-8859-1

2012/2/16 Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>

> On Thu, Feb 16, 2012 at 2:22 PM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
> > ok on that addresses above is mapped vring_desc structure. I expect that
> > addr is address to any memory location when data are places. Next is
> filled
> > by init because of ring buffer. What flags should be used? And what is
> data
> > structure?
>
> I'm sorry, but can you please rephrase this question too ? I'm just not
> sure I understand you correctly.
>
> In general, you don't need to fiddle with the vring_desc structure -
> that's internal to virtio, and things should just work.
>
> Or are you asking about the rtos side ?
>

yes, I mean that rtos side.

Communication from Linux should be pretty easy because I can use sendto
functions but
IRC in init part Linux kick rtos which send which services are
available.inany format which is unknown to me.

rtos should compose that data message and Linux will encode it and is able
to register that and use that.

My question is how that rtos should communicate. What data to send and
where and which structure to you.
For example: Use first vring buffer and write address where message is
placed and it is in ths structure (u32 flag, u32 address, u32 len,
u32data[MAX].

Two vrings buffers are setup as ring buffers and they are empty and from my
code reading rtos has to fill them.


Maybe I can say it in different way. In your ELCE example on panda board (I
will get it pretty shortly to be able to test it) ou get these messages

virtion_rpmsg_bus virtion0: rpmsg host is online - I get the same message
omap-rproc omap-rproc.1: received echo 0 - it is I think written in omap
remote proc driver

and then you get

virtion_rpmsg_bus virtio0: creating channel rpmsg-client-sample2...
virtion_rpmsg_bus virtio0: creating channel rpmsg-client-sample3...
...

Based on that when you have that channel name you can probe that driver
with match id table which has to use the same name to be able to
communication with this channel (name is rpmsg-client-sample).

I am not able to get that list of published services from rtos that's why
linux can't create that channels
and I would lke to know what to do on rtos side and how to send that
messages and which format I should
use.
Definitely rtos when this message is composed will kick Linux that there is
pending message.

Please also correct me if I read the code wrongly. that mailbox in omap
driver is used just to say which buffer contains that message. Is it
correct?
I can create 15 sw signals to tell rtos which buffer contains message.

Will be help if I clear my code and send it to you for review? Maybe you
will see where the problem is.

Thanks,
Michal

--00504502d1b0e4525204b91a9399
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2012/2/16 Ohad Ben-Cohen <span dir=3D"lt=
r">&lt;<a href=3D"mailto:ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org">ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org</a>&gt;</span><br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<div class=3D"im">On Thu, Feb 16, 2012 at 2:22 PM, Michal Simek &lt;<a href=
=3D"mailto:monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org">monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org</a>&gt; wrote:<br>
&gt; ok on that addresses above is mapped vring_desc structure. I expect th=
at<br>
&gt; addr is address to any memory location when data are places. Next is f=
illed<br>
&gt; by init because of ring buffer. What flags should be used? And what is=
 data<br>
&gt; structure?<br>
<br>
</div>I&#39;m sorry, but can you please rephrase this question too ? I&#39;=
m just not<br>
sure I understand you correctly.<br>
<br>
In general, you don&#39;t need to fiddle with the vring_desc structure -<br=
>
that&#39;s internal to virtio, and things should just work.<br>
<br>
Or are you asking about the rtos side ?<br></blockquote><div><br></div></di=
v>yes, I mean that rtos side. <br><br>Communication from Linux should be pr=
etty easy because I can use sendto functions but <br>IRC in init part Linux=
 kick rtos which send which services are <a href=3D"http://available.in">av=
ailable.in</a> any format which is unknown to me.<br>
<br>rtos should compose that data message and Linux will encode it and is a=
ble to register that and use that.<br><br>My question is how that rtos shou=
ld communicate. What data to send and where and which structure to you.<br>
For example: Use first vring buffer and write address where message is plac=
ed and it is in ths structure (u32 flag, u32 address, u32 len, u32data[MAX]=
.<br><br>Two vrings buffers are setup as ring buffers and they are empty an=
d from my code reading rtos has to fill them.<br>
<br><br>Maybe I can say it in different way. In your ELCE example on panda =
board (I will get it pretty shortly to be able to test it) ou get these mes=
sages<br><br>virtion_rpmsg_bus virtion0: rpmsg host is online - I get the s=
ame message<br>
omap-rproc omap-rproc.1: received echo 0 - it is I think written in omap re=
mote proc driver<br><br>and then you get<br><br>virtion_rpmsg_bus virtio0: =
creating channel rpmsg-client-sample2...<br>virtion_rpmsg_bus virtio0: crea=
ting channel rpmsg-client-sample3...<br>
...<br><br>Based on that when you have that channel name you can probe that=
 driver with match id table which has to use the same name to be able to co=
mmunication with this channel (name is rpmsg-client-sample).<br><br>I am no=
t able to get that list of published services from rtos that&#39;s why linu=
x can&#39;t create that channels<br>
and I would lke to know what to do on rtos side and how to send that messag=
es and which format I should<br>use.<br>Definitely rtos when this message i=
s composed will kick Linux that there is pending message. <br><br>Please al=
so correct me if I read the code wrongly. that mailbox in omap driver is us=
ed just to say which buffer contains that message. Is it correct? <br>
I can create 15 sw signals to tell rtos which buffer contains message.<br><=
br>Will be help if I clear my code and send it to you for review? Maybe you=
 will see where the problem is.<br><br>Thanks,<br>Michal<br><br><br><br>
<br><br><br><br><br><div style id=3D"avg_ls_inline_popup"></div>

--00504502d1b0e4525204b91a9399--

--===============2474047746952800187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2474047746952800187==--
