From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 6/6] usb: chipidea: add work-around for Marvell HSIC
 PHY startup
Date: Wed, 20 May 2015 22:47:42 -0500
Message-ID: <CAL_Jsq+0zaKZJwgAPea25a=TrChOJs0LdCRV-R824=qij3pnTw@mail.gmail.com>
References: <1432087805-16671-1-git-send-email-robh@kernel.org>
 <1432087805-16671-7-git-send-email-robh@kernel.org> <20150521031334.GA2897@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150521031334.GA2897@shlinux2>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 20, 2015 at 10:13 PM, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On Tue, May 19, 2015 at 09:10:05PM -0500, Rob Herring wrote:
>> The Marvell 28nm HSIC PHY requires the port to be forced to HS mode after
>> the port power is applied. This is done using the test mode in the PORTSC
>> register.
>>
>> As HSIC is always HS, this work-around should be safe to do with all HSIC
>> PHYs. If not, a flag can also be added.
>
> I think a flag is needed, not sure all vendors can work well with that.

Only i.MX6Sx uses HSIC in mainline. Is that something you can test? It
would be better to not add flags unless they are really needed.
Otherwise you end up with dozens of flags like SDHCI drivers have.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
