From: "Priebe, Sebastian" <Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org>
Subject: AW: core command line parameters with dt
Date: Fri, 1 Aug 2014 14:39:16 +0000
Message-ID: <E70AF999396FDF4EAE40E195B84709611F847234@SPMDEGHN001.CADCON.INTERN>
References: <E70AF999396FDF4EAE40E195B84709611F8471EA@SPMDEGHN001.CADCON.INTERN>
 <20140801141222.GG22994@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140801141222.GG22994@leverpostej>
Content-Language: de-DE
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Mark,

thank you for your advice. I figured out what I did wrong now.
And my function has "bt" in its name and not "dt". So, don't worry, I d=
on't mess with the DT there.

Greetings
Sebastian Priebe





=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
CADCON
Ingenieurgesellschaft mbH & Co. KG
Geschaeftsfuehrer: Robert Bauer, Andreas Gundel
Sitz der Gesellschaft: D-86368 Gersthofen
Registergericht: Amtsgericht Augsburg HRA 14521
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

-----Urspr=FCngliche Nachricht-----
Von: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:devicetree-owner-u79uwXL29TY@public.gmane.org=
nel.org] Im Auftrag von Mark Rutland
Gesendet: Freitag, 1. August 2014 16:12
An: Priebe, Sebastian
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Betreff: Re: core command line parameters with dt

On Fri, Aug 01, 2014 at 02:55:42PM +0100, Priebe, Sebastian wrote:
> Hello,
>
> I want to use kernel command line parameters within my machine file.
> If I use the __setup macro I get the following build error:
> error: __setup_str_model_bt causes a section type conflict with
> myboard_dt_board_compat
>
> static const char *myboard_dt_board_compat[] __initconst =3D {
>         "vendor,model",
>         NULL
> };

You have a section mismatch because your code evidently doesn't live in=
 an init section, but is trying to access data which does. The fact tha=
t the data happens to be a list of compatible strings is irrelevant, an=
d this is in no way related to dt.

=46igure out whether your function should live in an init section or if=
 the data should not. Make sure that you don't reference anything in in=
it section from anything else which does not itself live in an init sec=
tion. That will solve your build issue.

The name of the function sounds suspicious to begin with from a DT pers=
pective. You shouldn't need to override DT properties from the command =
line.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org More majordomo inf=
o at  http://vger.kernel.org/majordomo-info.html


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
