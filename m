From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/5] Documentation: DT: Renamed of-serial.txt to 8250.txt
Date: Mon, 20 Oct 2014 15:47:42 +0200
Message-ID: <1938561.uq5BpWofVY@wuerfel>
References: <1413539665-11484-2-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413539665-11484-2-git-send-email-chunyan.zhang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Chunyan Zhang <chunyan.zhang@spreadtrum.com>, catalin.marinas@arm.com, gregkh@linuxfoundation.org, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, galak@codeaurora.org, broonie@linaro.org, mark.rutland@arm.com, m-karicheri2@ti.com, pawel.moll@arm.com, artagnon@gmail.com, rrichter@cavium.com, robh+dt@kernel.org, will.deacon@arm.com, orsonzhai@gmail.com, geng.ren@spreadtrum.com, zhizhou.zhang@spreadtrum.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sprdlinux@freelists.org
List-Id: devicetree@vger.kernel.org

On Friday 17 October 2014 17:54:21 Chunyan Zhang wrote:
> The file of-serial.txt was only for 8250 compatible UART implementations,
> so renamed it to 8250.txt to avoid confusing other persons.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
> ---
>  Documentation/devicetree/bindings/serial/8250.txt  |   50 ++++++++++++++++++++
>  .../devicetree/bindings/serial/of-serial.txt       |   50 --------------------
>  2 files changed, 50 insertions(+), 50 deletions(-)
> 

Patch looks good, but please use 'git format-patch -M' when generating it,
to avoid having the whole add/remove in the patch, for easier review.

	Arnd
