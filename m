From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: common location for devicetree files
Date: Fri, 8 Nov 2013 11:33:00 -0800
Message-ID: <CAOesGMgyqXS8tq0Ru=ibypV89-oAJ8bzxhdFTnSAvfOobEC+Lw@mail.gmail.com>
References: <1438803E-C904-428B-B042-891978BC15DF@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438803E-C904-428B-B042-891978BC15DF-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org list" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 7, 2013 at 3:21 PM, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> As we start having more sharing of device trees between architectures (arm & arm64, arm & powerpc, guessing maybe mips & arm) we need dts to live in location that
>
> I was wondering what people felt about doing:
>
>         arch/dts/<VENDOR>/
>
> as a common location that could be shared.  I'm up for other suggestions.

dts isn't an architecture, so having it directly under arch/ doesn't
make sense. I know it's the first common parent of a lot of platforms
though.

I'd be ok with adding a toplevel dts/ directory for this, for lack of
better options. It doesn't really fit under firmware, lib, kernel,
scripts, tools...


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
