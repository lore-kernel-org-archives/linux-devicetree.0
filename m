From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: add baud rate to Juno stdout-path
Date: Fri, 23 Jan 2015 14:18:07 -0800
Message-ID: <20150123221807.GK20896@quad.lixom.net>
References: <d0f44fbb7ffc85806ab00d7e54a64161ef79cad7.1421924801.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d0f44fbb7ffc85806ab00d7e54a64161ef79cad7.1421924801.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 22, 2015 at 11:21:32AM +0000, Robin Murphy wrote:
> Without explicit command-line parameters, the Juno UART ends up running
> at 57600 baud in the kernel, which is at odds with the 115200 baud used
> by the rest of the firmware. Since commit 7914a7c5651a5161 now lets us
> fix this by specifying default options in stdout-path, do so.
> 
> Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>


Thanks, applied as a fix for 3.19.

-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
