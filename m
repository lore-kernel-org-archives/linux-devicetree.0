From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/2] devicetree: document ARM bindings for QEMU's
 Firmware Config interface
Date: Wed, 7 Jan 2015 11:12:55 -0600
Message-ID: <CAL_JsqKcwrB3pN0t-nF6Qfb0m1-nA=zzNsz5j820vP7U=rh_-Q@mail.gmail.com>
References: <1418849386-25857-1-git-send-email-lersek@redhat.com>
 <CAL_JsqL+ued8mZj_MONKf0j2MO0zmE+H=mahQC30aV8vki0mvQ@mail.gmail.com> <54AD5FBF.3080108@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54AD5FBF.3080108-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 7, 2015 at 10:33 AM, Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 01/07/15 16:43, Rob Herring wrote:
>> On Wed, Dec 17, 2014 at 2:49 PM, Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>> The qemu patchset has been turned upside down on qemu-devel during
>>> review (many thanks for that!); one outcome is that now both the
>>> selector and the data registers are big endian. This series has been
>>> updated accordingly.
>>
>> I'm assuming this is now settled on the QEMU side and will apply.
>
> Actually I have a small update for this text file. I thought people
> forgot about it and I didn't want to make more noise. If you're still
> willing to apply it, then I can post an incremental patch or a new version.

Please send a new version.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
