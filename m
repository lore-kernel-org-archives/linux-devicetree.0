From: Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCHv5 03/15] hwspinlock/core: maintain a list of registered
 hwspinlock banks
Date: Fri, 4 Jul 2014 08:01:29 +0300
Message-ID: <CAK=WgbaahqdmWRDMKtRhco4y5B-WBFYDHYs2cLM7NL=QhnhK2Q@mail.gmail.com>
References: <1398904476-26200-1-git-send-email-s-anna@ti.com>
 <1398904476-26200-4-git-send-email-s-anna@ti.com> <CAK=WgbakGbTaYz+4K24aT3vyRkDYwPKCm6XrcJvH667NMMfTTA@mail.gmail.com>
 <53B47621.6090307@ti.com> <CAK=WgbYtJ7TGqvjG3VAPPD5tVXx9-jEJU3iKEStUMxOvD1v=LQ@mail.gmail.com>
 <53B592CE.2010001@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <53B592CE.2010001@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Suman Anna <s-anna@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Tony Lindgren <tony@atomide.com>, Josh Cartwright <joshc@codeaurora.org>, Bjorn Andersson <bjorn@kryo.se>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Suman,

On Thu, Jul 3, 2014 at 8:28 PM, Suman Anna <s-anna@ti.com> wrote:
> OK, but we would still require this function to lookup the registered
> device from the controller-phandle to retrieve the base_id.

Can we retrieve the base_id from the parent DT node itself?

Thanks,
Ohad.
