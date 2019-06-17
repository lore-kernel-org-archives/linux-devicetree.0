From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
Date: Mon, 17 Jun 2019 07:20:31 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1906170715350.32654@viisi.sifive.com>
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com> <mvmtvco62k9.fsf@suse.de> <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com> <mvmpnnc5y49.fsf@suse.de> <alpine.DEB.2.21.9999.1906170305020.19994@viisi.sifive.com> <mvmh88o5xi5.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170419010.19994@viisi.sifive.com> <F48A4F7F-0B0D-4191-91AD-DC51686D1E78@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <F48A4F7F-0B0D-4191-91AD-DC51686D1E78@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Troy Benjegerdes <troy.benjegerdes@sifive.com>
Cc: Andreas Schwab <schwab@suse.de>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, nicolas.ferre@microchip.com, Sachin Ghadi <sachin.ghadi@sifive.com>, Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, ynezz@true.cz, linux-riscv@lists.infradead.org, davem@davemloft.net, Jim Jacobsen <jamez@wit.com>
List-Id: devicetree@vger.kernel.org

On Mon, 17 Jun 2019, Troy Benjegerdes wrote:

> Have we documented this tx clock switch register in something with a
> direct URL link (rather than a PDF)?

The SiFive FU540 user manual PDF is the canonical public reference:

https://static.dev.sifive.com/FU540-C000-v1.0.pdf

This practice aligns with other SoC vendors, who also release PDFs.

The relevant Ethernet documentation, including register maps, is in 
Chapter 19.


- Paul
