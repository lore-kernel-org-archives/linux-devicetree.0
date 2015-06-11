From: Evgeniy Polyakov <zbr@ioremap.net>
Subject: Re: [PATCH v2] w1: masters: omap_hdq: Add support for 1-wire mode
Date: Thu, 11 Jun 2015 18:34:34 +0300
Message-ID: <1072261434036874@web13o.yandex.ru>
References: <1431950959-19606-1-git-send-email-vigneshr@ti.com> <5562AFDB.1080701@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5562AFDB.1080701@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Tony Lindgren <tony@atomide.com>, NeilBrown <neilb@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabian Frederick <fabf@skynet.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi

25.05.2015, 08:15, "Vignesh R" <vigneshr@ti.com>:
>> =9AHDQ mode remains unchanged.
>>
>> =9ASigned-off-by: Vignesh R <vigneshr@ti.com>

I have no experience with omap_hdq platform, but there are quite a few =
questions
related to IO - you never check whether write was successful or read re=
turned actually
valid data, is it ok? I mean is it correct to assume that read can not =
return 0xff for example
and it is a sign that something is wrong, or this can not happen?

As for me, I have no objection, but this patch must go via omap tree im=
o.
