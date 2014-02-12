From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC/PATCH 0/3] Add devicetree scanning for randomness
Date: Wed, 12 Feb 2014 12:51:05 +0100
Message-ID: <201402121251.06280.arnd@arndb.de>
References: <1392168805-14200-1-git-send-email-lauraa@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1392168805-14200-1-git-send-email-lauraa@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laura Abbott <lauraa@codeaurora.org>
Cc: devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 12 February 2014, Laura Abbott wrote:
> This is an RFC to seed the random number pool earlier when using devicetree.
> The big issue this is trying to solve is the fact that the stack canary for
> ARM tends to be the same across bootups of the same device. This is because
> the random number pools do not get initialized until after the canary has
> been set up. The canary can be moved later, but in general there is still
> no way to reliably get random numbers early for other features (e.g. vector
> randomization).

Implementation-wise this looks reasonable, and it obviously addresses a
very real problem.

> The goal here is to allow devices to add to the random pools via
> add_device_randomness or some other method of their chosing at FDT time.
> I realize that ARCH_RANDOM is already available but this didn't work because
> 1) ARCH_RANDOM is not multi-platform compatible without added
> infrastructure to ARM

That could certainly be done, but I agree that a more generic
approach like you did is nicer. One thing that might be useful
would be to wire up your OF_RANDOM infrastructure as a generic
implementation of ARCH_RANDOM, and merge your header file into
include/asm-generic/archrandom.h, with an added way to call
arch_get_random_long() for the devices you add.

> The big reason to skip ARCH_RANDOM though is that the random number generation
> we have would be reasonable if only seeded earlier.

Yes, makes sense.

I also wonder if we should add a 'trivial' implementation that just
reads a DT property full of random numbers to use as either an initial
seed, or to feed into arch_get_random_long(). This would allow the
boot loader to pass any entropy it has already gathered into the kernel,
but leaves the danger that people might pass static not-so-random data
through a precompiled dtb file ;-). If we get the boot loaders to be
smart enough, doing only this would be a much simpler kernel implementation
than your suggestion, but I'm not sure how far I want to trust boot loaders.

Another possibilitiy is to mix in the any contents of a "local-mac-address"
property into the entropy at early DT probing, which would still be
deterministic for a given machine and should not count as entropty,
but at least give each machine with this property a unique seed in the
absence of any other entropy source.

	Arnd
