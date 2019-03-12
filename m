From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 0/2] L2 Cache EDAC Support for HiFive Unleashed
Date: Tue, 12 Mar 2019 09:32:34 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1903120925400.26459@viisi.sifive.com>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, bp@alien8.de, mchehab@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Yash,

On Tue, 12 Mar 2019, Yash Shah wrote:

> This patch series adds a L2 Cache EDAC driver and DT documentation
> for HiFive Unleashed board.

This should also reference the "FU540-C000 chip" since there isn't 
anything board-specific about it.

Also - could you please describe in your patch 0 message what kernel 
commit this driver has been tested on; or, if it's not a mainline commit, 
what additional patches are needed to test it?

thanks,

- Paul
