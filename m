From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 12/13] ARM: shmobile: alt dts: Add chosen/stdout-path
Date: Sat, 31 Jan 2015 11:18:11 +0100
Message-ID: <CAMuHMdUoc0f0WReqx86Qe35zwnbT3j49q5b+fFHupQa+3QsKag@mail.gmail.com>
References: <1412349104-18724-1-git-send-email-geert+renesas@glider.be>
	<1412349104-18724-13-git-send-email-geert+renesas@glider.be>
	<54CC06A4.9040408@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54CC06A4.9040408-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Fri, Jan 30, 2015 at 11:33 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> On 10/03/2014 07:11 PM, Geert Uytterhoeven wrote:
>> Add a stdout-path property so that automatic console selection works
>> in the absence of a "console=" parameter on the kernel command line.
>
>> Note that we have to keep the "console=ttySC0,38400" parameter in
>> chosen/bootargs, else the console will use the default setting of 115200
>> baud.
>
>    I've looked at the code and it appears that one can still specify a baud
> rate after ':' even in the "stdout-path" prop.

That's correct. I believe that support was added later.
Can you please send a patch?

Spaciba!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
