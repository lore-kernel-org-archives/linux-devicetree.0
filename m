From: Romain Baeriswyl <romain.baeriswyl-Yycd8EPnGM5BDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] i2c: designware: Fix falling time bindings doc
Date: Mon, 08 Dec 2014 09:57:07 +0100
Message-ID: <548567E3.6020101@alitech.com>
References: <1417805379-8999-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417805379-8999-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Romain Baeriswyl <Romain.Baeriswyl-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Shinya Kuribayashi <skuribay-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: Christian Ruppert <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>, Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Acked-by: Romain Baeriswyl <romain.baeriswyl-Yycd8EPnGM5BDgjK7y7TUQ@public.gmane.org>


On 2014-12-05 19:49, Doug Anderson wrote:
> In (6468276 i2c: designware: make SCL and SDA falling time
> configurable) new device tree properties were added for setting the
> falling time of SDA and SCL.  The device tree bindings doc had a typo
> in it: it forgot the "-ns" suffix for both properies in the prose of
> the bindings.
>
> I assume this is a typo because:
> * The source code includes the "-ns"
> * The example in the bindings includes the "-ns".
>
> Fix the typo.
>
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Fixes: 6468276b2206 ("i2c: designware: make SCL and SDA falling time configurable")
> ---
>   Documentation/devicetree/bindings/i2c/i2c-designware.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-designware.txt b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
> index 5199b0c..fee26dc 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-designware.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
> @@ -14,10 +14,10 @@ Optional properties :
>    - i2c-sda-hold-time-ns : should contain the SDA hold time in nanoseconds.
>      This option is only supported in hardware blocks version 1.11a or newer.
>
> - - i2c-scl-falling-time : should contain the SCL falling time in nanoseconds.
> + - i2c-scl-falling-time-ns : should contain the SCL falling time in nanoseconds.
>      This value which is by default 300ns is used to compute the tLOW period.
>
> - - i2c-sda-falling-time : should contain the SDA falling time in nanoseconds.
> + - i2c-sda-falling-time-ns : should contain the SDA falling time in nanoseconds.
>      This value which is by default 300ns is used to compute the tHIGH period.
>
>   Example :
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
