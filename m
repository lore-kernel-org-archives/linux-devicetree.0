From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v1 1/2] efuse: IMG Pistachio eFuse Controller
Date: Tue, 18 Nov 2014 11:03:39 +0100
Message-ID: <1877949.WaxRIbih3M@wuerfel>
References: <1416237576-21542-1-git-send-email-arul.ramasamy@imgtec.com> <CAL1qeaHSevOJ-o=nFqgze8utMgTk-Mh7Y9uRMa6wnjeofji98w@mail.gmail.com> <546B152D.1010804@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <546B152D.1010804-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <Ezequiel.Garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 18 November 2014 09:45:17 James Hogan wrote:
> On 18/11/14 00:26, Andrew Bresticker wrote:
> > Hi Naidu,
> > 
> > On Mon, Nov 17, 2014 at 4:12 PM, Naidu Tellapati
> > <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> >> Hi Andrew,
> >>
> >> (We will respond to James Hogan's remaining review comments in a separate email)
> >>
> >>>>
> >>>> +obj-$(CONFIG_SOC_IMG)           += pistachio/
> >>
> >>> What is CONFIG_SOC_IMG? It sounds very generic.
> >>
> >> May I have your suggestions on the above.
> >>
> >> (Assuming we create drivers/soc/img/ instead of drivers/soc/pistachio/)
> 
> What would "belong" in there?
> Basically anything that doesn't belong in some particular subsystem?
> 
> 

I think we have reached the threshold of needing a proper subsystem for
efuse/otp devices, and we should move the existing drivers into one
common directory and find a maintainer who can generalize the interfaces.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
