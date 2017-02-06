From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 1/3] lib/string: introduce ascii2utf16le() helper
Date: Mon, 6 Feb 2017 19:48:39 +0300
Message-ID: <29ff4981-ed4d-d87b-f6e2-112234f6a10a@cogentembedded.com>
References: <cover.1486388711.git.richard.leitner@skidata.com>
 <a2874c07d68aa29354154ce1961aa17e6468d40f.1486388711.git.richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a2874c07d68aa29354154ce1961aa17e6468d40f.1486388711.git.richard.leitner@skidata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <richard.leitner@skidata.com>, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, keescook@chromium.org, dev@g0hl1n.net
List-Id: devicetree@vger.kernel.org

Hello!

On 02/06/2017 05:03 PM, Richard Leitner wrote:

> For USB string descriptors we need to convert ASCII strings to UTF16-LE.
> Therefore make a simple helper function (based on ascii2desc from
> drivers/usb/core/hcd.c) for that purpose.
>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
[...]
> diff --git a/lib/string.c b/lib/string.c
> index ed83562..a113e3e 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -952,3 +952,29 @@ char *strreplace(char *s, char old, char new)
>  	return s;
>  }
>  EXPORT_SYMBOL(strreplace);
> +
> +/**
> + * ascii2utf16le() - Helper routine for producing UTF-16LE string descriptors
> + * @s: Null-terminated ASCII (actually ISO-8859-1) string
> + * @buf: Buffer for UTF-16LE string
> + * @len: Length (in bytes; may be odd) of UTF-16LE buffer.
> + *
> + * Return: The number of bytes filled in: 2*strlen(s) or @len, whichever is less
> + */
> +unsigned int ascii2utf16le(char const *s, u8 *buf, unsigned int len)
> +{
> +	unsigned int n, t = 2 * strlen(s);
> +
> +	if (len > t)
> +		len = t;
> +	n = len;
> +	while (n--) {
> +		t = (unsigned char)*s++;
> +		*buf++ = t;
> +		if (!n--)
> +			break;
> +		*buf++ = t >> 8;

    Isn't it always 0?

> +	}
> +	return len;
> +}
> +EXPORT_SYMBOL(ascii2utf16le);

MBR, Sergei
