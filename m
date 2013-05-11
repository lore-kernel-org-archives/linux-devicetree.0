From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/2 V2] iio: magnetometer: ak8975: Add support for DT
 and interrupt handling
Date: Sat, 11 May 2013 11:00:11 +0100
Message-ID: <518E16AB.6010809@kernel.org>
References: <1367923299-30594-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1367923299-30594-1-git-send-email-j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Applied to togreg branch of iio.git.
I'll send upstream after merge window has closed
(so if anyone else wants to take a look at this, you have
a couple of days)

Thanks,

On 05/07/2013 11:41 AM, Jacek Anaszewski wrote:
> These patches add 'data ready' interrupt handling for AK8975
> magnetometer, so as to provide more efficient alternative of
> waiting for the end of conversion. This short series adds also
> support for parsing 'gpios' property when initializing from oftree.
> 
> This is a follow-up of the previous patchset and it includes
> following improvements:
> 
> - replaced NULL with 'data' in the second argument of the free_irq calls,
>   which fixes problem on the module removal
> - changed the order of checking for the platform_data and added
>   checking for the -EPROBE_DEFER as spotted by Lars-Peter Clausen
> - moved ak8975.txt out of staging as spotted by Jonathan Cameron
> - modified header description in ak8975.txt
> - renamed '0C' to '0c' in the examplary device node in ak8975.txt
> 
> Thanks,
> Jacek Anaszewski
> 
> Jacek Anaszewski (2):
>   iio:ak8975 Add support for gpios DT property
>   iio:ak8975 Implement data ready interrupt handling
> 
>  .../bindings/iio/magnetometer/ak8975.txt           |   18 ++++
>  drivers/iio/magnetometer/ak8975.c                  |  103 +++++++++++++++++++-
>  2 files changed, 116 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/ak8975.txt
> 
