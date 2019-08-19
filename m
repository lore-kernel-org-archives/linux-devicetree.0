From: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH v8 2/3] fdt: add support for rng-seed
Date: Mon, 19 Aug 2019 14:13:49 -0400
Message-ID: <20190819181349.GE10349@mit.edu>
References: <20190819071602.139014-1-hsinyi@chromium.org>
 <20190819071602.139014-3-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190819071602.139014-3-hsinyi@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Stephen Boyd <swboyd@chromium.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Jun Yao <yaojun8558363@gmail.com>, Miles Chen <miles.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 19, 2019 at 03:16:04PM +0800, Hsin-Yi Wang wrote:
> Introducing a chosen node, rng-seed, which is an entropy that can be
> passed to kernel called very early to increase initial device
> randomness. Bootloader should provide this entropy and the value is
> read from /chosen/rng-seed in DT.

So it's really cool that you've sent out this patch set.  I've been
wanting this for all platforms / architectures for quite a while.
Question --- are you willing to guarantee that the booloader can be
trusted enough that you *know* the entropy being provided by the
bootloader to be secure?

If so, we could let fdt.c use a different interface, perhaps
add_hwgenerator_randomness(), which allows the bootloader to transfer
trusted entropy for the purposes of initializing the crng and entropy
accounting for /dev/random.

One of the questions is how do we make sure the boot loader is
actually secure, but given that we have to trust the boot loader for
various trusted boot use cases, it seems reasonable to do that.

What do you think?

					- Ted
