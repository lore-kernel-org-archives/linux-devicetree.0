From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/3] NFC: trf7970a: Add driver with ISO/IEC 14443 Type 2
 Tag Support
Date: Mon, 3 Mar 2014 21:37:07 +0100
Message-ID: <20140303203707.GB17664@zurbaran>
References: <1391206631-9862-1-git-send-email-mgreer@animalcreek.com>
 <1391206631-9862-2-git-send-email-mgreer@animalcreek.com>
 <20140221005059.GS18868@zurbaran>
 <20140226215309.GA21867@animalcreek.com>
 <20140303181112.GA32605@animalcreek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140303181112.GA32605-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Mark A. Greer" <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Cc: Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Erick Macias <emacias-l0cyMroinI0@public.gmane.org>, Thierry Escande <thierry.escande-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Mon, Mar 03, 2014 at 11:11:12AM -0700, Mark A. Greer wrote:
> > > Would you say this timeout depend on the SPI bus bandwidth ?
> > 
> > It'll be one of the factors but the tag's response characteristics are
> > a big factor too.  I can bump it up a bit more if you prefer or do you
> > want me to somehow calculate it from the SPI bitrate?
> 
> Ping.
Sorry, I missed that one: No, bumping it a bit more just to be on the
safe side will be enough.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
