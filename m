From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name
 dt property
Date: Thu, 30 Jun 2016 12:02:17 +0300
Message-ID: <87eg7f6odi.fsf@kamboji.qca.qualcomm.com>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com>
	<ea10ff70-26e6-e151-5cea-c54bd12a054c@redhat.com>
	<f8995599-115d-87e5-7928-c029b48584f1@broadcom.com>
	<6402170.5s0abZDqlD@wuerfel> <1467230078.2598.2.camel@plaes.org>
Reply-To: kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCQYFH77QIORBI6A2O5QKGQEUPNNKCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1467230078.2598.2.camel-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org> (Priit Laes's message of
	"Wed, 29 Jun 2016 22:54:38 +0300")
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-wireless@vger.kernel.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org> writes:

>> What is the size of this nvram file? As it's board specific, I wonder
>> if we can simply include it inside of the DT verbatim. I remember
>> doing that (in the pre-dtb days, on real open firmware) for the
>> "spidernet"
>> ethernet driver.
>
> It contains a bit too much info:
>
> This is what CubieTruck requires:
>
> http://dl.cubieboard.org/public/Cubieboard/benn/firmware/ap6210/nvram_ap6210.txt

In the nvram file I see lots of identifiers:

manfid=0x2d0
prodid=0x492
vendid=0x14e4
devid=0x4343
boardtype=0x0598
boardrev=0x1307
boardnum=777

Are any of these (or a combination of them) unique for each board type?
What if one of these is provided through DT and then the driver could
choose the nvram file based on the board id? Just another idea...

-- 
Kalle Valo
