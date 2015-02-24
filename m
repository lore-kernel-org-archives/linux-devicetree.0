From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/5] MIPS: Allow platforms to specify the decompressor load address
Date: Tue, 24 Feb 2015 09:15:12 +0100
Message-ID: <7814815.Q6KYv1fjo1@wuerfel>
References: <1424741507-8882-1-git-send-email-abrestic@chromium.org> <1424741507-8882-3-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424741507-8882-3-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>
List-Id: devicetree@vger.kernel.org

On Monday 23 February 2015 17:31:44 Andrew Bresticker wrote:
> Platforms which use raw zboot images may need to link the image at
> a fixed address if there is no other way to communicate the load
> address to the bootloader.  Allow the per-platform Kbuild files
> to specify an optional zboot image load address (zload-y) and fall
> back to calc_vmlinuz_load_addr if unset.
> 
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Cc: Lars-Peter Clausen <lars@metafoo.de>

No objections to the patch, but have you considered doing the
same thing as ARM's AUTO_ZRELADDR, where we calculate the
address at runtime from the entry point?

I assume this is the same kind of address you are talking
about here; if not, nevermind.

	Arnd
