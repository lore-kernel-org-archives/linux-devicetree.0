From: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 1/3] drivers: hwspinlock: add CSR atlas7 implementation
Date: Fri, 12 Jun 2015 18:20:59 +0300
Message-ID: <CAK=WgbYHMiLZjMxui9N+hA-ZJ3K=QQ=E8ndAqxfAWFZwa4VGCA@mail.gmail.com>
References: <1432628911-18555-1-git-send-email-21cnbao@gmail.com> <CAJAp7Og0GDmh7EcsDedNkRi0StoQZOE+ShP_m2GXAhq9M4UG+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJAp7Og0GDmh7EcsDedNkRi0StoQZOE+ShP_m2GXAhq9M4UG+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Cc: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DL-SHA-WorkGroupLinux <workgroup.linux-kQvG35nSl+M@public.gmane.org>, Wei Chen <wei.chen-kQvG35nSl+M@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> On Tue, May 26, 2015 at 1:28 AM, Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > From: Wei Chen <wei.chen-kQvG35nSl+M@public.gmane.org>
> >
> > Add hwspinlock support for the CSR atlas7 SoC.
> >
> > The Hardware Spinlock device on atlas7 provides hardware assistance
> > for synchronization between the multiple processors in the system
> > (dual Cortex-A7, CAN bus Cortex-M3 and audio DSP).
> >
> > Cc: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
> > Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Applied first two patches. Thanks Suman and Bjorn for making the time
to review them!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
