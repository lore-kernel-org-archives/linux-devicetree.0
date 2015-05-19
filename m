From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 2/2] iio: adc: xilinx-xadc: Add xlnx,extend-name as an
 optional argument for aux channels
Date: Tue, 19 May 2015 19:53:39 +0200
Message-ID: <555B78A3.2030202@metafoo.de>
References: <1431038644-41600-1-git-send-email-xander.huff@ni.com> <1431038644-41600-2-git-send-email-xander.huff@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431038644-41600-2-git-send-email-xander.huff-acOepvfBmUk@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben.shelton-acOepvfBmUk@public.gmane.org, joshc-acOepvfBmUk@public.gmane.org, joe.hershberger-acOepvfBmUk@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/08/2015 12:44 AM, Xander Huff wrote:
> To better facilitate user-mode access to optional aux channels, allow
> device trees to specify a custom extended name for defined channels.

Hi,

'extend-name' is kind of a IIO specific term. I think a better name in the 
devicetree context would be 'label'. That's used everywhere else when giving 
a short description string to a node.

- Lars
