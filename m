From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 15/18] ARM: STi: DT: STiH407: Add uniperif reader dt
 nodes
Date: Mon, 5 Sep 2016 16:42:48 +0100
Message-ID: <20160905154248.GU4921@dell>
References: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
 <1472223413-7254-16-git-send-email-peter.griffin@linaro.org>
 <20160830100148.GO1661@dell>
 <20160830142112.GA22514@griffinp-ThinkPad-X1-Carbon-2nd>
 <20160831112819.GJ27357@dell>
 <ae089830-b7c8-ee83-f697-6ff93f2646ed@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ae089830-b7c8-ee83-f697-6ff93f2646ed-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Pouliquen <arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 05 Sep 2016, Arnaud Pouliquen wrote:
> >>>> +			dai-name = "Uni Reader #0 (PCM IN)";
> >>>
> >>> Oooo, not seen something like this before.
> >>>
> >>> If it does not already have one, it would require a DT Ack.
> >>
> >> No idea, the driver got merged 1 year ago.
> This field could be suppressed and handled in source code, using
> st,uniperiph-id to retreive it.

That would be better.

> >> Arnaud did you get a DT ack when you merged this driver & binding? i if i remember well, i had  sent to Alsa mailing list only, I missed
> this obvious...

I'm surprised Mark didn't notice this.

He's usually pretty good at picking stuff like that up.

> >>>> +			st,version = <3>;
> >>>
> >>> This will likely need a DT Ack too.  We usually encode this sort of
> >>> information in the compatible string.
> yes, better to use compatibility
> >>
> >> See 05c1b4480e86a871b18030d6f3d532dc0ecdf38c
> > 
> > Well Rob's the boss.  We certainly never used to take 'device ID' or
> > 'version' attributes.  I guess something must have changed.
> 
> I will try to provide patches for code and bindings rework this week.

Wonderful.. Thanks Arnaud.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
