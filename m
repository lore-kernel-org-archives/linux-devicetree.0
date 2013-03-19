From: Anton Vorontsov <anton@enomsg.org>
Subject: Re: [PATCH v5 1/3] gpio: gpio-generic: Add 16 and 32 bit big endian
 byte order support
Date: Mon, 18 Mar 2013 17:40:13 -0700
Message-ID: <20130319004012.GA1004@lizard.gateway.2wire.net>
References: <1363355140-28216-1-git-send-email-andreas@gaisler.com>
 <1363355140-28216-2-git-send-email-andreas@gaisler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1363355140-28216-2-git-send-email-andreas@gaisler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Larsson <andreas@gaisler.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, software@gaisler.com
List-Id: devicetree@vger.kernel.org

On Fri, Mar 15, 2013 at 02:45:38PM +0100, Andreas Larsson wrote:
> There is no general support for 64-bit big endian accesses, so that is
> left unsupported.
> 
> Signed-off-by: Andreas Larsson <andreas@gaisler.com>

This looks perfect, thanks a lot!

Acked-by: Anton Vorontsov <anton@enomsg.org>
