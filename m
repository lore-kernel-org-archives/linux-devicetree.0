From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: dts: mt7623: Add initial Geek Force support
Date: Thu, 12 Jan 2017 09:23:14 +0100
Message-ID: <0bd6567e-1c5b-0ff6-d044-57d25e1a40d2@phrozen.org>
References: <20170108133100.10428-1-afaerber@suse.de>
 <91f5ec74-1aa1-f2ad-24e9-14267cbe8498@phrozen.org>
 <d6bd3783-d124-9871-d3b4-93e366517895@suse.de>
 <3fecb422-8185-7ee0-c203-2bfdc4fd1393@phrozen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3fecb422-8185-7ee0-c203-2bfdc4fd1393-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Lai <paul-37fROp6E04DQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andreas,

had a look last night why the ethernet dtsi was not added and it
obviously was not added as we were waiting for the clk-mt2701 to be
merged. the ethernet dtsi will have phandles pointing at the clk nodes
which did not exist at the time. same is true for the PWM code.

i sat down last night and worked out what pending patches i still have
for mt7623 and out of the ~80 required to get v4.4 working i only need
around 10 for v4.10-rc1.

i started to rebase these patches last night and will have time to test
them tomorrow or early next week. as the pwrap node alone is around 200
lines of devicetree we need to figure out a way to add this to the dts
files without duplicating it. i'll try to post a series early next week
that we can then discuss and rebase your geekboard patches on.

	John
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
