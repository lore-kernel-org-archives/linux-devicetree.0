From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] of: Allow selection of OF_DYNAMIC and OF_OVERLAY if OF_UNITTEST
Date: Fri, 20 Mar 2015 08:32:12 -0500
Message-ID: <CAL_Jsq+mVvSs-9jLEHyYec2RYfqpCSev3k0oUu=7PE06h+gFXQ@mail.gmail.com>
References: <1422029405-9353-1-git-send-email-geert+renesas@glider.be>
 <1422029405-9353-2-git-send-email-geert+renesas@glider.be> <20150320122502.EB491C40724@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150320122502.EB491C40724-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 20, 2015 at 7:25 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, 23 Jan 2015 17:10:04 +0100
> , Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>  wrote:
>> Currently OF_DYNAMIC and OF_OVERLAY are not visible to the user, and are
>> selected automatically only when needed.
>>
>> Allow them to be enabled manually to improve device tree unit test
>> coverage.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>
> I like the change. Merged, thanks.

Making OF_OVERLAY visible is already in 4.0-rc4.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
