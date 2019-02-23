From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] checkpatch: don't complain about "undocumented" USB VID
Date: Fri, 22 Feb 2019 16:52:28 -0800
Message-ID: <82b7d3bb2799468a715e280366401f732d83cfdf.camel@perches.com>
References: <20190222225545.78031-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222225545.78031-1-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <briannorris@chromium.org>, Andy Whitcroft <apw@canonical.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2019-02-22 at 14:55 -0800, Brian Norris wrote:
> Documentation/devicetree/bindings/usb/usb-device.txt describes the
> 'usbVID,...' compatible format, where VID is hexadecimal, with leading
> zeroes suppressed. Allow it here without complaining.
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3012,6 +3012,8 @@ sub process {
>  				}
>  
>  				next if $compat !~ /^([a-zA-Z0-9\-]+)\,/;
> +				# USB VIDs don't need special vendor prefix documentation.
> +				next if $compat =~ /^usb[1-9a-f][0-9a-f]{0,3},/;

Maybe check the PID too?

				next if $compat =~ /^usb[1-9a-f][0-9a-f]{0,3},[1-9a-f][0-9a-f]{0,3}\b/;


Maybe add a test for uses of the leading 0?
