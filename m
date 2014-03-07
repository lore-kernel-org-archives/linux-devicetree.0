Return-Path: <boxerspam1@gmail.com>
Date: Thu, 6 Mar 2014 18:06:29 -0600
From: Eric Boxer <boxerspam1@gmail.com>
Message-ID: <35D7707C-A2FD-4C11-8FE9-3D578468CA33@gmail.com>
In-Reply-To: <22856833.LpWmmzXcxv@avalon>
References: <1393522540-22887-1-git-send-email-p.zabel@pengutronix.de>
 <1393932989.3917.62.camel@paszta.hi.pengutronix.de>
 <5315C535.2070303@ti.com> <22856833.LpWmmzXcxv@avalon>
Subject: Re: [PATCH v5 5/7] [media] of: move common endpoint parsing to
 drivers/of
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="53190d85_507ed7ab_72c"
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--53190d85_507ed7ab_72c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Eric Boxer liked your message with Boxer. On March 6, 2014 at 5:59:17 PM =
CST, Laurent Pinchart  wrote:Hi Tomi,On Tuesday 04 March 2014 14:21:09 To=
mi Valkeinen wrote:> On 04/03/14 13:36, Philipp Zabel wrote:> > Am Dienst=
ag, den 04.03.2014, 10:58 +0200 schrieb Tomi Valkeinen:> > =5B...=5D=5Bsn=
ip=5D> >> Then, about the get=5Fremote functions: I think there should be=
 only one> >> function for that purpose, one that returns the device node=
 that> >> contains the remote endpoint.> >> > >> My reasoning is that the=
 ports and endpoints, and their contents, should> >> be private to the de=
vice. So the only use to get the remote is to get> >> the actual device, =
to see if it's been probed, or maybe get some video> >> API for that devi=
ce.> > > > of=5Fgraph=5Fget=5Fremote=5Fport currently is used in the exyn=
os4-is/fimc-is.c> > v4l2 driver to get the mipi-csi channel id from the r=
emote port, and> > I've started using it in imx-drm-core.c for two cases:=
> > - given an endpoint on the encoder, find the remote port connected to=
> > it, get the associated drm=5Fcrtc, to obtain its the drm=5Fcrtc=5Fmas=
k> > for encoder->possible=5Fcrtcs.> > > > - given an encoder and a conne=
cted drm=5Fcrtc, walk all endpoints to find> > the remote port associated=
 with the drm=5Fcrtc, and then use the local> > endpoint parent port to d=
etermine multiplexer settings.> > Ok.> > In omapdss each driver handles o=
nly the ports and endpoints defined for> its device, and they can be cons=
idered private to that device. The only> reason to look for the remote en=
dpoint is to find the remote device. To> me the omapdss model makes sense=
, and feels logical and sane =3D). So I> have to say I'm not really famil=
iar with the model you're using.I agree with you that most of the content=
 of the remote endpoint should be considered private to the remote device=
 and not accessed by the local device driver. There is, however, one piec=
e of information from the remote endpoint useful to the local device driv=
er, it's the remote port identifier. This can be expressed by a phandle, =
a remote port number, a media entity pad pointer, or any other mean, but =
the information is useful for the local device driver to communicate with=
 the remote device driver. =46or instance a driver could use it to ask it=
s video stream source to start the video stream on a given port.> Of cour=
se, the different get=5Fremove=5F* funcs do no harm, even if we have> a b=
unch of them. My point was only about enforcing the correct use of> the m=
odel, where =22correct=22 is of course subjective =3D).-- Regards,Laurent=
 Pinchart     
--53190d85_507ed7ab_72c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><body><div>Eric Boxer liked your message with <a href=3D=22http://a=
d.apps.fm/x3NHJParL2cT9cQ9WcgT1xM8G1T=5FLUvoWYXredpuoYBLq62ptJqsuhqD23uAm=
N=5FARL=5FcKzXIyDOjqo=5F2b16qX20uaphn=46WU7uPwUiYWuOAT=46UAGQB7Cox3TWT3ZK=
jzWyP=46IlhepnEZcRklQejqpibw=22>Boxer</a>.</div><br/><br/><div><div class=
=3D=22quote=22>On March 6, 2014 at 5:59:17 PM CST, Laurent Pinchart <laur=
ent.pinchart=40ideasonboard.com> wrote:<br/><blockquote type=3D=22cite=22=
 style=3D=22border-left-style:solid;border-width:1px;margin-left:0px;padd=
ing-left:10px;=22>Hi Tomi,<br /><br />On Tuesday 04 March 2014 14:21:09 T=
omi Valkeinen wrote:<br />> On 04/03/14 13:36, Philipp Zabel wrote:<br />=
> > Am Dienstag, den 04.03.2014, 10:58 +0200 schrieb Tomi Valkeinen:<br /=
>> > =5B...=5D<br /><br />=5Bsnip=5D<br /><br />> >> Then, about the get=5F=
remote functions: I think there should be only one<br />> >> function for=
 that purpose, one that returns the device node that<br />> >> contains t=
he remote endpoint.<br />> >> <br />> >> My reasoning is that the ports a=
nd endpoints, and their contents, should<br />> >> be private to the devi=
ce. So the only use to get the remote is to get<br />> >> the actual devi=
ce, to see if it's been probed, or maybe get some video<br />> >> API for=
 that device.<br />> > <br />> > of=5Fgraph=5Fget=5Fremote=5Fport current=
ly is used in the exynos4-is/fimc-is.c<br />> > v4l2 driver to get the mi=
pi-csi channel id from the remote port, and<br />> > I've started using i=
t in imx-drm-core.c for two cases:<br />> > - given an endpoint on the en=
coder, find the remote port connected to<br />> >   it, get the associate=
d drm=5Fcrtc, to obtain its the drm=5Fcrtc=5Fmask<br />> >   for encoder-=
>possible=5Fcrtcs.<br />> > <br />> > - given an encoder and a connected =
drm=5Fcrtc, walk all endpoints to find<br />> >   the remote port associa=
ted with the drm=5Fcrtc, and then use the local<br />> >   endpoint paren=
t port to determine multiplexer settings.<br />> <br />> Ok.<br />> <br /=
>> In omapdss each driver handles only the ports and endpoints defined fo=
r<br />> its device, and they can be considered private to that device. T=
he only<br />> reason to look for the remote endpoint is to find the remo=
te device. To<br />> me the omapdss model makes sense, and feels logical =
and sane =3D). So I<br />> have to say I'm not really familiar with the m=
odel you're using.<br /><br />I agree with you that most of the content o=
f the remote endpoint should be <br />considered private to the remote de=
vice and not accessed by the local device <br />driver. There is, however=
, one piece of information from the remote endpoint <br />useful to the l=
ocal device driver, it's the remote port identifier. This can <br />be ex=
pressed by a phandle, a remote port number, a media entity pad pointer, <=
br />or any other mean, but the information is useful for the local devic=
e driver <br />to communicate with the remote device driver. =46or instan=
ce a driver could use <br />it to ask its video stream source to start th=
e video stream on a given port.<br /><br />> Of course, the different get=
=5Fremove=5F* funcs do no harm, even if we have<br />> a bunch of them. M=
y point was only about enforcing the correct use of<br />> the model, whe=
re =22correct=22 is of course subjective =3D).<br /><br />-- <br />Regard=
s,<br /><br />Laurent Pinchart<br /></blockquote></div></div></body></htm=
l>
--53190d85_507ed7ab_72c--
