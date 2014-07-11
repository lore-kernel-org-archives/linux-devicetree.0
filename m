From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv8 1/2] mailbox: rename pl320-ipc specific mailbox.h
Date: Fri, 11 Jul 2014 19:12:14 +0200
Message-ID: <201407111912.14538.arnd@arndb.de>
References: <1405071167-14503-1-git-send-email-jaswinder.singh@linaro.org> <1405071252-14630-1-git-send-email-jaswinder.singh@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405071252-14630-1-git-send-email-jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org, lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, loic.pallardy-qxv4g6HH51o@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bjorn-UYDU3/A3LUY@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Mollie.Wu-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org, t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 11 July 2014, Jassi Brar wrote:
> From: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
> 
> The patch 30058677 "ARM / highbank: add support for pl320 IPC"
> added a pl320 IPC specific header file as a generic mailbox.h.
> This file has been renamed appropriately to allow the
> introduction of the generic mailbox API framework.
> 
> Acked-by: Mark Langsdorf <mark.langsdorf-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Rafael J. Wysocki <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
