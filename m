From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 3/4] gnss: add mtk receiver type support
Date: Fri, 25 Jan 2019 10:12:56 +0100
Message-ID: <20190125091256.GC3691@localhost>
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
 <1547744074-28308-4-git-send-email-lollivier@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547744074-28308-4-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loys Ollivier <lollivier@baylibre.com>
Cc: devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 17, 2019 at 05:54:33PM +0100, Loys Ollivier wrote:
> Add an MTK (Mediatek) type to the "GNSS_TYPE" attribute.
> 
> Note that MTK receivers support a subset of NMEA 0183 with vendor
> extensions (e.g. to allow switching to the vendor protocol).

Copy paste error? AFAICT there is no Mediatek vendor protocol, only the
extensions to NMEA.

> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
> ---
> 
> v2: renamed from GTOP to MTK.
> 
>  include/linux/gnss.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/gnss.h b/include/linux/gnss.h
> index 43546977098c..36968a0f33e8 100644
> --- a/include/linux/gnss.h
> +++ b/include/linux/gnss.h
> @@ -22,6 +22,7 @@ enum gnss_type {
>  	GNSS_TYPE_NMEA = 0,
>  	GNSS_TYPE_SIRF,
>  	GNSS_TYPE_UBX,
> +	GNSS_TYPE_MTK,
>  
>  	GNSS_TYPE_COUNT
>  };

Add the gnss_type_names string in this patch along with the define.

Johan
