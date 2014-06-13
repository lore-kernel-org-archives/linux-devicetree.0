From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: CPU revision IDs
Date: Fri, 13 Jun 2014 15:08:30 +0200
Message-ID: <5045739.TmqqIG2CDG@wuerfel>
References: <CAKON4OwNULPeQFHwRhRfri86yexMvvKfrw_dthim4_oPWvMD3g@mail.gmail.com> <4285095.l6sVUI20tQ@wuerfel> <CAKON4OxzJ7UoKnMgf+sckksjG-rx8NG1tUvPj2qaHNsda0j3jQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKON4OxzJ7UoKnMgf+sckksjG-rx8NG1tUvPj2qaHNsda0j3jQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 13 June 2014 09:05:14 jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> I was adding the CPU revision ID to the top level compatible string,
> nothing specific to the device.  By knowing the CPU revision I know
> which errata to apply.
> 
> If you patch the device strings, then you have to maintain knowledge
> of which devices are broken in two places -- the device driver and the
> machine file where you are patching the strings.

IMHO, the driver only has to know what device versions exist, it
shouldn't need to know which soc has which version of the device.

Can you describe which kind of quirk you are looking at in the driver,
and how common it is?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
