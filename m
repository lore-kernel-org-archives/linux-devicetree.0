From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
Date: Mon, 17 Jun 2019 03:05:06 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1906170305020.19994@viisi.sifive.com>
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com> <mvmtvco62k9.fsf@suse.de> <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com> <mvmpnnc5y49.fsf@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <mvmpnnc5y49.fsf@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Schwab <schwab@suse.de>
Cc: Yash Shah <yash.shah@sifive.com>, davem@davemloft.net, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, palmer@sifive.com, aou@eecs.berkeley.edu, ynezz@true.cz, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

On Mon, 17 Jun 2019, Andreas Schwab wrote:

> On Jun 17 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:
> 
> > Looks to me that it shouldn't have an impact unless the DT string is 
> > present, and even then, the impact might simply be that the MACB driver 
> > may not work?
> 
> If the macb driver doesn't work you have an unusable system, of course.

Why?

- Paul
