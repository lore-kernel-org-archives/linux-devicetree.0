From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add a RISC-V SBI firmware node
Date: Mon, 20 Nov 2017 15:45:20 -0600
Message-ID: <20171120214520.dcaqvyncojwefmgt@rob-hp-laptop>
References: <20171120195000.2070-1-palmer@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171120195000.2070-1-palmer@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@sifive.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, patches@groups.riscv.org, linux-kernel@vger.kernel.org, nathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 20, 2017 at 11:50:00AM -0800, Palmer Dabbelt wrote:
> The RISC-V privileged ISA mandates the presence of an SBI, but there's
> no reason not to put it in the device tree.  This would allow us to
> possibly remove the SBI later.

If it is mandatory, then it should not be in DT. DT is not a driver 
instantiation mechanism.

If your ISA can vary, I'd recommend you make that discoverable. DT is 
for what we failed to make discoverable.

Rob
