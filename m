From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 0/2 v6] arm: kirkwood: add dreamplug/devicetree support
Date: Mon, 27 Feb 2012 16:29:37 +0000
Message-ID: <201202271629.37478.arnd@arndb.de>
References: <cover.1312906908.git.jason@lakedaemon.net>
 <cover.1330358323.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <cover.1330358323.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 27 February 2012, Jason Cooper wrote:
> This patch series provides initial support for devicetree on kirkwood for the
> dreamplug platform.  After discussing the approach with Arnd Bergman last week
> at ELC, we decided to take an incremental approach to the conversion.  First, I
> would detect that we were on the dreamplug via the devicetree blob.  Then,
> configure uart0 via devicetree.  We chose the uart since it is already well
> supported under devicetree.
> 
> This patch series has been boot-tested on the dreamplug.
> 
> In a future patch series, I plan to migrate spi/flash/partitions over to
> devicetree.
> 
> When the migration is complete, board-dt.c will not be specific to the
> dreamplug, and dts files can be written for all of the other kirkwood boards.
> 
> Jason Cooper (2):
>   arm: kirkwood: add dreamplug (fdt) support.
>   arm: kirkwood: convert uart0 to devicetree.

Applied to the kirkwood/board branch and pulled into next/boards.

Great work!

I've made two trivial manual changes, please do these yourself next time:

1. Subject should start with "ARM: kirkwood:", not "arm: kirkwood:" by
   convention.

2. Nico and I had both replied with "Acked-by:". When you get one of
   these replies, add that line under your "Signed-off-by:" line.

If you have more changes for dreamplug, please submit those on top of
these patches now.

	Arnd
