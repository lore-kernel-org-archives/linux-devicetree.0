From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [v2 2/2] fpga: Add support for Lattice iCE40 FPGAs
Date: Tue, 25 Oct 2016 09:34:20 -0700
Message-ID: <20161025163420.GA24050@live.com>
References: <1477283989-21947-1-git-send-email-joel@airwebreathe.org.uk>
 <1477283989-21947-2-git-send-email-joel@airwebreathe.org.uk>
 <alpine.DEB.2.02.1610241615280.14525@linuxheads99>
 <c971d8f4-dbb4-8d6e-f8eb-028a0a95e6fb@airwebreathe.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c971d8f4-dbb4-8d6e-f8eb-028a0a95e6fb@airwebreathe.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Holdsworth <joel@airwebreathe.org.uk>
Cc: atull <atull@opensource.altera.com>, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 24, 2016 at 11:05:28PM -0600, Joel Holdsworth wrote:

> Only being able to load firmware from kernel C-code is rather a limitation -
> though I suppose the framework is quite early in development.

I agree this is a limitation. To expand a bit on what Alan said. For the
last year(?) or so we've been reviewing / reiterating patches to do that
using device tree overlays.

Rob was ok with the last round of bindings so it looks like it is moving
in the right direction.

The part that's missing in the whole spiel is a way to apply overlays
from userland (which in turn then trigger the reconfiguration of the
regions).

Pantelis has a patchset that allows doing this using a configfs
interface; however the devicetree maintainers weren't too happy with it.

At ELCE Pantelis and me talked to Frank about the patchset and Pantelis
agreed to resubmit the patchset with small changes.

TL;DR we'll eventually get there but it takes time and many rounds of review :)

Cheers,

Moritz
