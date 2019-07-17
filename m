From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] riscv: dts: Add DT node for SiFive FU540 Ethernet
 controller driver
Date: Wed, 17 Jul 2019 12:30:10 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1907171228560.22190@viisi.sifive.com>
References: <1561097422-25130-1-git-send-email-yash.shah@sifive.com> <1561097422-25130-2-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561097422-25130-2-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

On Fri, 21 Jun 2019, Yash Shah wrote:

> DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Dropping this one until it's updated to align with whatever you pick for 
the new driver DT compatible string, per

https://lore.kernel.org/linux-riscv/1558611952-13295-1-git-send-email-yash.shah@sifive.com/T/#me298e16b2feeb481116cca61b94e014433cf2977

Please send an updated DT patch at your earliest convenience so we can get 
it into the v5.3-rc series.


- Paul
