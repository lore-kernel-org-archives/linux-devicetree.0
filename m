From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] riscv: dts: Re-organize SPI DT nodes
Date: Mon, 24 Jun 2019 14:23:39 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1906241421550.22820@viisi.sifive.com>
References: <1561375453-3135-1-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561375453-3135-1-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

On Mon, 24 Jun 2019, Yash Shah wrote:

> As per the General convention, define only device DT node in SOC DTSi
> file with status = "disabled" and enable device in Board DTS file with
> status = "okay"
> 
> Reported-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

This is a good start, but should also cover the other I/O devices in the 
chip DT file.  The mandatory internal devices, like the PRCI and PLIC, can 
stay the way they are.


- Paul
