From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [version 2]  amba uarts - arm type uarts fifo size provided by
 device tree
Date: Mon, 9 Mar 2015 12:29:51 +0000
Message-ID: <20150309122951.GK8656@n2100.arm.linux.org.uk>
References: <1424290069-8760-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20150303165534.GB10239@leverpostej>
 <54FD912F.8080403@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54FD912F.8080403-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 09, 2015 at 08:25:19AM -0400, Jorge Ramirez-Ortiz wrote:
> I just confirmed that there are a number of differences on top of the
> fifo size requiring many additional software changes.
> This is not great news since the uart announces itself as vendor_arm
> version 1.

And that is a _very_ bad thing.  The IP is claiming to be created by ARM,
but it isn't - that probably puts this PL011 in a sticky situation from a
legal point of view.  (We've had a CPU which identified itself as an ARM
Ltd ARM926, but it wasn't - the silicon vendor was forced to re-spin their
silicon to change the ID... I wouldn't be surprised if that happens here
too.)

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
