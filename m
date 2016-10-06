From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 17/19] drm/virtio: kconfig: Fix recursive dependency issue.
Date: Thu, 6 Oct 2016 11:45:41 +0100
Message-ID: <CACvgo50vU5_=KFUCAZDaQPepPdsbnF8KN1b+f6KJNuBW6qRdSg@mail.gmail.com>
References: <1473081421-16555-1-git-send-email-peter.griffin@linaro.org>
 <1473081421-16555-18-git-send-email-peter.griffin@linaro.org>
 <CACvgo52_g7anGBd9HTUyYsbp5QmQEk9LR3nNHgSTgjQ29G3ViA@mail.gmail.com>
 <20160920083251.GB26093@griffinp-ThinkPad-X1-Carbon-2nd> <8760pqncee.fsf@intel.com>
 <20161006093721.GA436@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161006093721.GA436@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:VIRTIO GPU DRIVER" <virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 6 October 2016 at 10:37, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> In fact the help text for VIRTIO even states this option should be select=
ed
> by any driver which implements virtio.
>
Almost but not quite. It says:

"This option is selected by any driver which implements the virtio _bus_"

REMOTEPROC obviously does that while the ST SLIM driver does not. Thus
the latter should _not_ select, be that explicitly or implicitly via
REMOTEPROC, the symbol.

>>
>> People tend to abuse select because it's "convenient". If you depend,
>> but some of your dependencies aren't met, you're in for some digging
>> through Kconfig to find the missing deps. Just to make the option you
>> want visible in menuconfig. If you instead select something with
>> dependencies, it'll be right most of the time, and it's "convenient",
>> until it breaks. (And hey, it usually breaks for someone else with some
>> other config, so it's still convenient for you.)
>
> I'm sure they do but in this case it is actually the use of 'depends on'
> which has caused the breakage and inconvenience for somebody else and sad=
ly this
> inconvienice is still on-going due to this patch not being applied or get=
ting an
> acked-by from the appropriate maintainers.
>
Surely you're not saying that pre-existing driver following the
documentation, is 'causing breakage' for a new driver {ab,mis}using a
feature ?

This reminds me an old saying: "If the shoe doesn=E2=80=99t fit, it doesn=
=E2=80=99t
mean there is anything wrong with your feet."
You seem to be suggesting the opposite ?

>>
>> Perhaps kconfig should complain about selecting visible symbols and
>> symbols with dependencies.
>
> That sounds like it would be a useful addition.
>
> Is it possible to get this patch applied or an acked-by to avoid further =
delay
> to the fdma series?
>
Please don't apply duct tape, especially where it's _not_ needed.

$ sed -i s/select REMOTEPROC/depends on REMOTEPROC/ drivers/remoteproc/Kcon=
fig

... will resolve things in the right place. The alternative will lead
to random issues in other subsystems.

Regards,
Emil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
