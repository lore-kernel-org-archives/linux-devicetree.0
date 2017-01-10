From: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v2 2/4] usb: dwc2: Add binding for AHB burst
Date: Wed, 11 Jan 2017 00:01:36 +0100
Message-ID: <1822229.eVKB2DLXUI@debian64>
References: <cover.1479339900.git.johnyoun@synopsys.com> <19255165.1fIP7jmgm1@debian64> <e8fa98c7-0dbc-7be7-be54-b2a9114bc289@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e8fa98c7-0dbc-7be7-be54-b2a9114bc289-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday, January 10, 2017 1:46:56 PM CET John Youn wrote:
> On 12/19/2016 6:49 AM, Christian Lamparter wrote:
> > (Lot's of old stuff, that doesn't matter anymore)

Hello John,
 
> This should be fixed against the latest dwc2 param rework series [1]
> which i hope to get queued for 4.11. If you can give it a test, that
> would be great.

oh Ok. I see you added it to
"[PATCH 16/21] usb: dwc2: Remove platform static params" [0].
Yes, I think this should work nicely. Thank you very much for
your time, even though it's just for like "one old board" :-).

Do you have a public git tree with your patches that I can
clone/checkout?  If not, I'll take some time on the weekend
for this and write back on monday. But yeah, this should 
work.

Regards,
Christian

[0] <https://www.spinics.net/lists/linux-usb/msg151709.html>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
