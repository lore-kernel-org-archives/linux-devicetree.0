From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] brcmfmac: Add brcm, nvram_file_name
 dt property
Date: Thu, 07 Jul 2016 11:24:53 +0200
Message-ID: <5859938.CkoVuKNmJq@wuerfel>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com> <3996482.D5xdKXDiGl@wuerfel> <27f6d3d3-4bcc-8572-4c7b-b44966ad72f4@broadcom.com>
Reply-To: arnd-r2nGTMty4D4@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDEKVJM7XAHRBNF67C5QKGQE6SKZJPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <27f6d3d3-4bcc-8572-4c7b-b44966ad72f4-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday, July 7, 2016 11:16:59 AM CEST Arend Van Spriel wrote:
> On 7-7-2016 10:46, Arnd Bergmann wrote:
> > On Wednesday, July 6, 2016 9:19:41 PM CEST Arend Van Spriel wrote:
> >> On 6-7-2016 15:42, Arnd Bergmann wrote:
> >>> On Wednesday, July 6, 2016 10:08:55 AM CEST Arend Van Spriel wrote:
> >>>> On Tue, Jul 5, 2016 at 3:43 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > I'm a bit confused by the interdependencies now. You say that there are
> > board ID/rev values stored in OTP. What exactly prevents us from just
> > using those to generate a file name to look up the nvram file on disk
> > for the remaining values?
> > 
> > Do we require the firmware to be running before we can read the OTP,
> > or are there cases where the board ID in OTP is wrong or missing?
> 
> Well, both. Primarily we need firmware running to get the info. If board
> ID is missing in OTP the value from nvram file is used. If board ID in
> OTP is wrong we are screwed 

Ok.

> > If we can't rely on OTP for one of those reasons and instead add two
> > properties for boardtype/boardrev, I don't think that requires a
> > change of the compatible string, we would just document those two
> > as optional properties.
> 
> Right. I suppose the bindings update and driver update should preferably
> be in the same kernel release although bindings are supposedly OS agnostic.

It's a one-way dependency, we shouldn't add the kernel code handling
the property without having agreed on and updated the binding first.

	Arnd
