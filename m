From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name
 dt property
Date: Thu, 30 Jun 2016 13:31:07 +0200
Message-ID: <3960223.GqB9zXL8s8@wuerfel>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com> <CAOiHx==82LHOeQMNVD+dybFifXX690Q6AJTcMBMynjSfUOyGUw@mail.gmail.com> <8d8bd933-717b-48e4-f002-7b834abed6fd@redhat.com>
Reply-To: arnd-r2nGTMty4D4@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDEKVJM7XAHRBZUE2S5QKGQE5JPRCOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <8d8bd933-717b-48e4-f002-7b834abed6fd-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>, Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday, June 30, 2016 12:25:15 PM CEST Hans de Goede wrote:
> > So then how about making use of a more specific compatible string?
> >
> > e.g.
> >
> > brcmf {
> >         compatible = "foo,ap6210", "brcm,bcm4329-fmac";
> >         ...
> > };
> >
> > and if the compatible has more than one element you request
> > FW_NAME_<compatible>.txt as the nvram file. Or try each comptible (and
> > lastly no suffix) until you get a match. (AFAICT, this is what the
> > "model" property was originally intended for anyway, but almost nobody
> > did it right, and everyone put a user readable string into "model" for
> > boards instead of the ePAPR defined compatible string).
> 
> Hmm, interesting idea. Not sure how easy / hard it will be to implement
> this, but from a dt binding point of view it seems elegant.
> 
> Kalle, Arend, what do you think of this ?

I think that's reasonable. Also, we have precedent for using things like
the boardid as part of the compatible string, which would help do what
Kalle suggested earlier with "nvram-<boardtype>-<boardrev>.txt",
as we get that for free by trying out all the compatible strings.

	Arnd
