From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH resend] checkpatch: Enable whitespace checks for DTS
 files
Date: Wed, 27 Aug 2014 09:37:13 -0700
Message-ID: <1409157433.25751.7.camel@joe-AO725>
References: <1409152106-9424-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409152106-9424-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Whitcroft <apw@canonical.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

(adding Andrew Morton)

On Wed, 2014-08-27 at 17:08 +0200, Geert Uytterhoeven wrote:
> When run on *.dtsi or *.dts files, the whitespace checks were skipped,
> while they are valid for DTS files.  Hence stop skipping them.
> 
> I ran checkpatch on all in-tree DTS files, and didn't notice any error or
> warning messages that are inappropriate for DTS files.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Joe Perches <joe@perches.com>

> ---
>  scripts/checkpatch.pl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 31a731e06f50..ded90b6d7e17 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2338,7 +2338,7 @@ sub process {
>  		}
>  
>  # check we are in a valid source file if not then ignore this hunk
> -		next if ($realfile !~ /\.(h|c|s|S|pl|sh)$/);
> +		next if ($realfile !~ /\.(h|c|s|S|pl|sh|dtsi|dts)$/);
>  
>  #line length limit
>  		if ($line =~ /^\+/ && $prevrawline !~ /\/\*\*/ &&
> @@ -2399,7 +2399,7 @@ sub process {
>  		}
>  
>  # check we are in a valid source file C or perl if not then ignore this hunk
> -		next if ($realfile !~ /\.(h|c|pl)$/);
> +		next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
>  
>  # at the beginning of a line any tabs must come first and anything
>  # more than 8 must use tabs.
