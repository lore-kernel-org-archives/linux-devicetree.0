From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: powerpc: build virtex dtb
Date: Thu, 24 Jan 2019 14:40:16 +1100 (AEDT)
Message-ID: <43lSbP32bBz9sDK@ozlabs.org>
References: <1546951970-29079-1-git-send-email-clabbe@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546951970-29079-1-git-send-email-clabbe@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: benh@kernel.crashing.org, mark.rutland@arm.com, paulus@samba.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-01-08 at 12:52:50 UTC, Corentin Labbe wrote:
> I wanted to test the virtex440-ml507 qemu machine and found that the dtb
> for it was not builded.
> All powerpc DTB are only built when CONFIG_OF_ALL_DTBS is set which depend on
> COMPILE_TEST.
> 
> This patchs adds build of virtex dtbs depending on
> CONFIG_XILINX_VIRTEX440_GENERIC_BOARD option.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/acef5e0165912c459a9ae98a25f0f879

cheers
