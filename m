From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 10/10] ARM: dts: da850: add usb device node
Date: Mon, 21 Nov 2016 11:53:32 +0100
Message-ID: <CAKXjFTNNJ7je04U7+yR7Fhn8Lkg8JswR9c7zcA14qVarj5+i6Q@mail.gmail.com>
References: <20161107203948.28324-1-ahaslam@baylibre.com> <20161107203948.28324-11-ahaslam@baylibre.com>
 <48d0c158-f7c8-0d1e-f06e-b7b28d6f2b93@lechnology.com> <CAKXjFTN_VvxJ+mk=ooUiGqZJnuJJJn33KsBF2n6SvZNjWpYm3Q@mail.gmail.com>
 <c812d211-fff8-520f-cc1f-6fa69a765498@ti.com> <e8bc1888-4936-7d8e-cf8a-a3f2b5644ef5@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e8bc1888-4936-7d8e-cf8a-a3f2b5644ef5-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 21, 2016 at 11:49 AM, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org> wrote:
> On Monday 21 November 2016 04:16 PM, Sekhar Nori wrote:
>>>> In commit 2957e36e76c836b167e5e0c1edb578d8a9bd7af6 in the linux-davinci
>>>> >> tree, the alias for the musb device is usb0. So, I think we should use usb1
>>>> >> here instead of ohci - or change the usb0 alias to musb.
>>>> >>
>>>> >> https://git.kernel.org/cgit/linux/kernel/git/nsekhar/linux-davinci.git/commit/?h=v4.10/dt&id=2957e36e76c836b167e5e0c1edb578d8a9bd7af6
>>> >
>>> > ok, i will change to usb1, since i will be resubmiting this.
>
>> I have already applied a version of this patch. Please re-base against
>> linux-davinci/master and send a delta patch.
>
> Hmm, no. scratch that. I mixed this up with the musb patch I applied.
> usb1 sounds good. Please also separate out the soc and board specific
> dts additions for your next version.

Ok will do.


>
> Thanks,
> Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
