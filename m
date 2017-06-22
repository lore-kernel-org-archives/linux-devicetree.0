From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] scripts/dtc: dtx_diff - Show real file names in diff
 header
Date: Thu, 22 Jun 2017 11:21:12 -0500
Message-ID: <20170622162112.45uobyoar7cddorv@rob-hp-laptop>
References: <1498136826-6793-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1498136826-6793-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 22, 2017 at 03:07:06PM +0200, Geert Uytterhoeven wrote:
> As the comparison uses process substitution to pass files after
> conversion to DTS format, the diff header doesn't show the real
> filenames, but the names of the file descriptors used:
> 
>     --- /dev/fd/63  2017-06-22 11:21:47.531637188 +0200
>     +++ /dev/fd/62  2017-06-22 11:21:47.531637188 +0200
> 
> This is especially annoying when comparing a bunch of DT files in a
> loop, as the output doesn't show a clue about which files it refers to.
> 
> Fix this by explicitly passing the original file names to the diff
> command using the --label option, giving e.g.:
> 
>     --- arch/arm/boot/dts/r8a7791-koelsch.dtb
>     +++ arch/arm/boot/dts/r8a7791-porter.dtb
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  scripts/dtc/dtx_diff | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.
