From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name dt property
Date: Mon, 4 Jul 2016 11:12:07 -0500
Message-ID: <20160704161207.GA4592@rob-hp-laptop>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com>
 <20160701020836.GA1722@rob-hp-laptop>
 <b18cd232-711a-b617-2f09-09c4bdf2c3c4@broadcom.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERBWMV5K5QKGQEA2UIZ7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <b18cd232-711a-b617-2f09-09c4bdf2c3c4-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 01, 2016 at 10:17:37AM +0200, Arend Van Spriel wrote:
> 
> 
> On 1-7-2016 4:08, Rob Herring wrote:
> > On Wed, Jun 29, 2016 at 04:04:31PM +0200, Hans de Goede wrote:
> >> Add a brcm,nvram_file_name dt property to allow overruling the default
> >> nvram filename for sdio devices. The idea is that we can specify a
> >> board specific nvram file, e.g. brcmfmac43362-ap6210.txt for boards
> >> with an ap6210 wifi sdio module and ship this in linux-firmware, so
> >> that wifi will work out of the box, without requiring users to find
> >> and then manually install the right nvram file for their board.
> > 
> > What about putting its contents directly into DT? It's just text 
> > key/value pairs so it would match up well.
> 
> It would be an option, but I have no clue how to dig up documentation of
> these key,value pairs. The file is typically obtained from a wifi module
> vendor which would need to be converted to DT format, ie. prefix with
> "brcm," etc. From driver perspective this would mean it need to know
> keys. Currently, it just takes the file contents and sends it to the device.

Okay, if it is opaque, then probably best to treat as firmware and not 
change it.

Rob
