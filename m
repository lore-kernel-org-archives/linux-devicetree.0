From: Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] Add documentation for tca6507 devicetree bindings.
Date: Thu, 8 Nov 2012 20:51:32 +0100
Message-ID: <CAAfyv37h31kQuyyXWL7B_2DXZFDMHQNq5w0ZR7Deiyk-47X6DQ@mail.gmail.com>
References: <1352321726-21284-1-git-send-email-marek.belisko@open-nandra.com>
 <1352321726-21284-2-git-send-email-marek.belisko@open-nandra.com>
 <509AEB59.7010504@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2283102417069238434=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <509AEB59.7010504-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2283102417069238434==
Content-Type: multipart/alternative; boundary=20cf30334b5f8fedea04ce0129ac

--20cf30334b5f8fedea04ce0129ac
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 8, 2012 at 12:14 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>wrote:

> On 11/07/2012 01:55 PM, Marek Belisko wrote:
>
> > diff --git a/Documentation/devicetree/bindings/leds/tca6507.txt
> b/Documentation/devicetree/bindings/leds/tca6507.txt
>
> > +LEDs conected to tca6507
> > +
> > +Required properties:
> > +- compatible : should be : "leds-tca6507".
>
> "ti,tca6507" would be more typical.
>
OK will post update for that

>
> > +Each led is represented as a sub-node of the leds-tca6507 device.
> > +
> > +LED sub-node properties:
> > +- label : label for this LED
> > +- reg : number of LED line (could be from 0 to 6)
> > +- linux,default-trigger : led default trigger
>
> You probably want to mention which binding document defines the valid
> values for that property; ../gpio/led.txt I think.
>
Will add that also. Just an idea this is common for most of the leds cannot
this be put to some common place as reference
to avoid copying same text again?

>
> I wonder if we need to think about representing the blinking/fading/...
> capabilities of the chip too? Should that be encoded into the DT, or
> should it be controlled at run-time via some LED subsystem?
>
I think this is handled internally and current platform data doesn't have
support for that.

Thanks,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

--20cf30334b5f8fedea04ce0129ac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 8, 2012 at 12:14 AM, Stephen Warren <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" target=3D"_blank">swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org=
</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
On 11/07/2012 01:55 PM, Marek Belisko wrote:<br>
<br>
&gt; diff --git a/Documentation/devicetree/bindings/leds/tca6507.txt b/Docu=
mentation/devicetree/bindings/leds/tca6507.txt<br>
<div class=3D"im"><br>
&gt; +LEDs conected to tca6507<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; +- compatible : should be : &quot;leds-tca6507&quot;.<br>
<br>
</div>&quot;ti,tca6507&quot; would be more typical.<br></blockquote><div>OK=
 will post update for that=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
&gt; +Each led is represented as a sub-node of the leds-tca6507 device.<br>
&gt; +<br>
&gt; +LED sub-node properties:<br>
&gt; +- label : label for this LED<br>
&gt; +- reg : number of LED line (could be from 0 to 6)<br>
&gt; +- linux,default-trigger : led default trigger<br>
<br>
</div>You probably want to mention which binding document defines the valid=
<br>
values for that property; ../gpio/led.txt I think.<br></blockquote><div>Wil=
l add that also. Just an idea this is common for most of the leds cannot th=
is be put to some common place as reference</div><div>to avoid copying same=
 text again?=C2=A0</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
I wonder if we need to think about representing the blinking/fading/...<br>
capabilities of the chip too? Should that be encoded into the DT, or<br>
should it be controlled at run-time via some LED subsystem?<br></blockquote=
><div>I think this is handled internally and current platform data doesn&#3=
9;t have support for that.</div></div><br>Thanks,</div><div class=3D"gmail_=
extra">
<br></div><div class=3D"gmail_extra">marek<br clear=3D"all"><div><br></div>=
-- <br>as simple and primitive as possible<br>-----------------------------=
--------------------<br>Marek Belisko - OPEN-NANDRA<br>Freelance Developer<=
br>
<br>Ruska Nova Ves 219 | Presov, 08005 Slovak Republic<br>Tel: +421 915 052=
 184<br>skype: marekwhite<br>twitter: #opennandra<br>web: <a href=3D"http:/=
/open-nandra.com" target=3D"_blank">http://open-nandra.com</a><br>
</div>

--20cf30334b5f8fedea04ce0129ac--

--===============2283102417069238434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2283102417069238434==--
