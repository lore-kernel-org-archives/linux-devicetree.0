From: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
Date: Mon, 17 Jun 2019 12:01:42 +0200
Message-ID: <mvmpnnc5y49.fsf@suse.de>
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com>
        <mvmtvco62k9.fsf@suse.de>
        <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com> (Paul
        Walmsley's message of "Mon, 17 Jun 2019 02:58:20 -0700 (PDT)")
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Yash Shah <yash.shah@sifive.com>, davem@davemloft.net, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, palmer@sifive.com, aou@eecs.berkeley.edu, ynezz@true.cz, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

On Jun 17 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:

> Looks to me that it shouldn't have an impact unless the DT string is 
> present, and even then, the impact might simply be that the MACB driver 
> may not work?

If the macb driver doesn't work you have an unusable system, of course.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
