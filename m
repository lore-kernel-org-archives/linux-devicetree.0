From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Thu, 7 May 2015 10:48:13 -0500
Message-ID: <CAL_Jsq+exFg17M-f_nKHM+RHKmkFPzrdn9RscOD1y=TB6oU_jg@mail.gmail.com>
References: <20150318055437.21025.13990.stgit@notabene.brown>
 <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dr. H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: List for communicating with real GTA04 owners <gta04-owner-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, NeilBrown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 6, 2015 at 12:19 AM, Dr. H. Nikolaus Schaller
<hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org> wrote:
> Hi Peter,
>
> Am 05.05.2015 um 21:54 schrieb Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org=
>:
>
>> Hi Neil,
>>
>> On 03/18/2015 01:58 AM, NeilBrown wrote:
>>> here is version 3 of support for tty-slaves.
>>
>> Is there a v4 of this that I missed?

I'm interested in seeing this to completion as well.

> We did have a lengthy discussion about [PATCH 3/3] how to best (1)
> represent the slave device in the device tree but as far as I am conc=
erned,
> I do not see that we have a consensus (2) and the device tree maintai=
ners
> have no comments or clear guidelines so far.

I'm just catching up on the thread, but I agree with what Sebastian
has said at least on regulators.

>
> BR,
> Nikolaus
>
> (1) best with respect to maintainability, flexibility, common design =
patterns,
> compatibility and some other factors I don=E2=80=99t know the correct=
 english words for
> (2) basically the slave can be described as a subnode like for I2C bu=
s slaves
> or the slave device can reference the uart it is connected to like fo=
r GPIOs
> and regulators--

I'm not sure I follow the debate on sub-nodes, but it is a pretty well
defined pattern that sub-nodes are describing a connection to parent
nodes. Usually it follows the main/data connection and not some
side-band connections like regulators or gpios.

Rob

> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
