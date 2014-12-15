From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH 5/5] ARM: dts: sun6i: Add dts file for
 CSQ CS908 board
Date: Mon, 15 Dec 2014 11:21:37 +0100
Message-ID: <CAEKpxBnm2w9pcuf_T1HaO8ACz+94U9G3MeYKNhtzph+9fPtPWg@mail.gmail.com>
References: <1416747283-13489-1-git-send-email-hdegoede@redhat.com>
	<1416747283-13489-6-git-send-email-hdegoede@redhat.com>
	<20141125182147.GD25249@lukather>
	<5475962A.4090508@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=047d7b3a84c08b8f29050a3e9b1c
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBMPMXKSAKGQENC7WFYY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <5475962A.4090508-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--047d7b3a84c08b8f29050a3e9b1c
Content-Type: text/plain; charset=UTF-8

>
> usb0 (otg): usb-a receptacle 1 (labeled 1 on the box, 0 on the print)
> usb1 (ehci): routed to internal wifi
> usb2 (ehci): usb-a receptacle 2 (labeled 2 on both the box and the print)
>
> I'm using fel mode with an usb-a <-> usb-a cable connected to usb0 on
> the cs908. The cs908 has no fel button, so I've hooked up the serial
> console,
> and then keep 2 pressed on the serial console while inserting the usb-a
> into
> the PC (which will also power the board). boot0 from the nand will then
> jump
> into fel mode when it sees the 2 keypress.
>

Hi Hans,

I'm looking to try this on my vidon box which like the cs908 doesn't have
OTG
or a fel button. Just would like to confirm the wiring on the usb-a 2 usb-a
male
cable. Are they connected one to one i.e. 5v <-> 5v, D+ <-> D+ etc or are
the
data lines twisted. i.e. D+ <-> D- and vice versa?.

Good work with the A31 and A23 deliveries.
Thanks,
CK


>
> This was an interesting exercise to confirm that everything on the A31s
> just
> works with A31 code, but now that is confirms A31s devices are not all that
> interesting anymore :)
>
>  I wonder wether to put URL in the commit log is the right thing
>> though. It's most likely to be dead in a very near future. The cover
>> letter would be a better fit for that.
>>
>
> Ok, I'll drop it from the commit message.
>
> Regards,
>
> Hans
>
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--047d7b3a84c08b8f29050a3e9b1c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><spa=
n class=3D""></span><br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
usb0 (otg): usb-a receptacle 1 (labeled 1 on the box, 0 on the print)<br>
usb1 (ehci): routed to internal wifi<br>
usb2 (ehci): usb-a receptacle 2 (labeled 2 on both the box and the print)<b=
r>
<br>
I&#39;m using fel mode with an usb-a &lt;-&gt; usb-a cable connected to usb=
0 on<br>
the cs908. The cs908 has no fel button, so I&#39;ve hooked up the serial co=
nsole,<br>
and then keep 2 pressed on the serial console while inserting the usb-a int=
o<br>
the PC (which will also power the board). boot0 from the nand will then jum=
p<br>
into fel mode when it sees the 2 keypress.<br></blockquote><div><br>Hi Hans=
,<br><br>I&#39;m looking to try this on my vidon box which like the cs908 d=
oesn&#39;t have OTG <br>or a fel button. Just would like to confirm the wir=
ing on the usb-a 2 usb-a male <br></div><div>cable. Are they connected one =
to one i.e. 5v &lt;-&gt; 5v, D+ &lt;-&gt; D+ etc or are the<br></div><div>d=
ata lines twisted. i.e. D+ &lt;-&gt; D- and vice versa?.<br><br></div><div>=
Good work with the A31 and A23 deliveries.<br></div><div>Thanks,<br></div><=
div>CK<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
This was an interesting exercise to confirm that everything on the A31s jus=
t<br>
works with A31 code, but now that is confirms A31s devices are not all that=
<br>
interesting anymore :)<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I wonder wether to put URL in the commit log is the right thing<br>
though. It&#39;s most likely to be dead in a very near future. The cover<br=
>
letter would be a better fit for that.<br>
</blockquote>
<br></span>
Ok, I&#39;ll drop it from the commit message.<br>
<br>
Regards,<br>
<br>
Hans<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote></=
div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--047d7b3a84c08b8f29050a3e9b1c--
