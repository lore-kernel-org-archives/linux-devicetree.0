Return-Path: <jaswinder.singh@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1465205633.25607.33.camel@mtksdaap41>
References: <1464578397-29743-1-git-send-email-hs.liao@mediatek.com>
 <1464578397-29743-3-git-send-email-hs.liao@mediatek.com> <574C5CBF.7060002@gmail.com>
 <1464683762.14604.59.camel@mtksdaap41> <574DEE40.9010008@gmail.com>
 <1464775020.11122.40.camel@mtksdaap41> <574FF264.7050209@gmail.com>
 <1464934356.15175.31.camel@mtksdaap41> <57516774.5080008@gmail.com>
 <CABb+yY2aOncqM-fOiq_ZBink0Fth6Drd30ZMe3-bXNkodW2dVA@mail.gmail.com> <1465205633.25607.33.camel@mtksdaap41>
From: Jassi Brar <jaswinder.singh@linaro.org>
Date: Mon, 6 Jun 2016 18:47:02 +0530
Message-ID: <CAJe_ZhfHQLW02pqyrSuSCHayT_7f1aaeg8cH9RAK16Skg9+3Jw@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] CMDQ: Mediatek CMDQ driver
Content-Type: multipart/alternative; boundary=001a1147f4b27114d005349be3d8
To: Horng-Shyang Liao <hs.liao@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, CK HU <ck.hu@mediatek.com>, cawa cheng <cawa.cheng@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Damon Chu <damon.chu@mediatek.com>, Josh-YC Liu <josh-yc.liu@mediatek.com>, Glory Hung <glory.hung@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Monica Wang <monica.wang@mediatek.com>
List-ID: <devicetree@vger.kernel.org>

--001a1147f4b27114d005349be3d8
Content-Type: text/plain; charset=UTF-8

On 6 June 2016 at 15:03, Horng-Shyang Liao <hs.liao@mediatek.com> wrote:

> Hi Matthias, Jassi,
>
> On Fri, 2016-06-03 at 18:41 +0530, Jassi Brar wrote:
> > On Fri, Jun 3, 2016 at 4:48 PM, Matthias Brugger <matthias.bgg@gmail.com>
> wrote:
> > > On 03/06/16 08:12, Horng-Shyang Liao wrote:
> > >> On Thu, 2016-06-02 at 10:46 +0200, Matthias Brugger wrote:
> >
> > >>> I keep thinking about how to get rid of the two data structures,
> > >>> task_busy_list and the task_release_wq. We need the latter for the
> only
> > >>> sake of getting a timeout.
> > >>>
> > >>> Did you have a look on how the mailbox framework handles this?
> > >>> By the way, what is the reason to not implement the whole driver as a
> > >>> mailbox controller? For me, this driver looks like a good fit.
> > >>
> > >>
> > >> CMDQ needs to encode commands for GCE hardware. We think this behavior
> > >> should be put in CMDQ driver, and client just call CMDQ functions.
> > >> Therefore, if we want to use mailbox framework, cmdq_rec must be
> > >> mailbox client, and the others must be mailbox controller.
> > >>
> > >
> > > You mean the functions to fill the cmdq_rec and execute it?
> > > I think this should be part of the driver.
> > >
> > > Jassi, can you have a look on the interface this driver exports [0].
> > > They are needed to actually create the message which will be send.
> > > Could something like this be part of a mailbox driver?
> > >
> > > [0] https://patchwork.kernel.org/patch/9140221/
> > >
> > Packet creating/parsing should not be a part of controller driver. As
> > the log of this patch says, today it is used for only display but in
> > future it could work with other h/w as well, so it makes sense to have
> > mailbox api do the message queuing, the controller driver do the
> > send/receive and client drivers implement display and other h/w
> > specific packaging of data (protocol handling).
> >
> > So yes, I think this could use mailbox api.
> >
> > Cheers.
>
>
> Let me use display as an example to do some further explanation
> about CMDQ in advance. You can think CMDQ is a shadow register
> replacement. Therefore, we use cmdq_rec_write(_mask), cmdq_rec_wfe, and
> cmdq_rec_clear_event instead of accessing registers, and use
> cmdq_rec_flush(_async) instead of atomic swap.
>
> If we use mailbox to do the message queue, we can use mailbox framework
> to implement flush and callback. However, I don't think mailbox is
> suitable for cmdq_rec_write(_mask), cmdq_rec_wfe, and
> cmdq_rec_clear_event since they are just record some commands. Is this
> the same as your comment "Packet creating/parsing should not be a part
> of controller driver."?
>
> Therefore, do you mean we use mailbox framework to implement flush and
> callback and keep other interfaces?


Yes, implement flush and callback in mailbox controller driver and keep
other interfaces in mailbox client driver(s).

Cheers.

--001a1147f4b27114d005349be3d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 6 June 2016 at 15:03, Horng-Shyang Liao <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:hs.liao@mediatek.com" target=3D"_blank">hs.liao@mediatek.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Matthias, Jassi,<b=
r>
<br>
On Fri, 2016-06-03 at 18:41 +0530, Jassi Brar wrote:<br>
&gt; On Fri, Jun 3, 2016 at 4:48 PM, Matthias Brugger &lt;<a href=3D"mailto=
:matthias.bgg@gmail.com">matthias.bgg@gmail.com</a>&gt; wrote:<br>
&gt; &gt; On 03/06/16 08:12, Horng-Shyang Liao wrote:<br>
&gt; &gt;&gt; On Thu, 2016-06-02 at 10:46 +0200, Matthias Brugger wrote:<br=
>
&gt;<br>
&gt; &gt;&gt;&gt; I keep thinking about how to get rid of the two data stru=
ctures,<br>
&gt; &gt;&gt;&gt; task_busy_list and the task_release_wq. We need the latte=
r for the only<br>
&gt; &gt;&gt;&gt; sake of getting a timeout.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Did you have a look on how the mailbox framework handles =
this?<br>
&gt; &gt;&gt;&gt; By the way, what is the reason to not implement the whole=
 driver as a<br>
&gt; &gt;&gt;&gt; mailbox controller? For me, this driver looks like a good=
 fit.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; CMDQ needs to encode commands for GCE hardware. We think this=
 behavior<br>
&gt; &gt;&gt; should be put in CMDQ driver, and client just call CMDQ funct=
ions.<br>
&gt; &gt;&gt; Therefore, if we want to use mailbox framework, cmdq_rec must=
 be<br>
&gt; &gt;&gt; mailbox client, and the others must be mailbox controller.<br=
>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; You mean the functions to fill the cmdq_rec and execute it?<br>
&gt; &gt; I think this should be part of the driver.<br>
&gt; &gt;<br>
&gt; &gt; Jassi, can you have a look on the interface this driver exports [=
0].<br>
&gt; &gt; They are needed to actually create the message which will be send=
.<br>
&gt; &gt; Could something like this be part of a mailbox driver?<br>
&gt; &gt;<br>
&gt; &gt; [0] <a href=3D"https://patchwork.kernel.org/patch/9140221/" rel=
=3D"noreferrer" target=3D"_blank">https://patchwork.kernel.org/patch/914022=
1/</a><br>
&gt; &gt;<br>
&gt; Packet creating/parsing should not be a part of controller driver. As<=
br>
&gt; the log of this patch says, today it is used for only display but in<b=
r>
&gt; future it could work with other h/w as well, so it makes sense to have=
<br>
&gt; mailbox api do the message queuing, the controller driver do the<br>
&gt; send/receive and client drivers implement display and other h/w<br>
&gt; specific packaging of data (protocol handling).<br>
&gt;<br>
&gt; So yes, I think this could use mailbox api.<br>
&gt;<br>
&gt; Cheers.<br>
<br>
<br>
Let me use display as an example to do some further explanation<br>
about CMDQ in advance. You can think CMDQ is a shadow register<br>
replacement. Therefore, we use cmdq_rec_write(_mask), cmdq_rec_wfe, and<br>
cmdq_rec_clear_event instead of accessing registers, and use<br>
cmdq_rec_flush(_async) instead of atomic swap.<br>
<br>
If we use mailbox to do the message queue, we can use mailbox framework<br>
to implement flush and callback. However, I don&#39;t think mailbox is<br>
suitable for cmdq_rec_write(_mask), cmdq_rec_wfe, and<br>
cmdq_rec_clear_event since they are just record some commands. Is this<br>
the same as your comment &quot;Packet creating/parsing should not be a part=
<br>
of controller driver.&quot;?<br>
<br>
Therefore, do you mean we use mailbox framework to implement flush and<br>
callback and keep other interfaces?</blockquote><div><br></div><div>Yes, im=
plement flush and callback in mailbox controller driver and keep other inte=
rfaces in mailbox client driver(s).</div><div><br></div><div>Cheers.</div><=
/div>
</div></div>

--001a1147f4b27114d005349be3d8--
