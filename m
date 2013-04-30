From: Tomi Valkeinen <tomi.valkeinen@iki.fi>
Subject: Re: [PATCH V2] video: implement a simple framebuffer driver
Date: Tue, 30 Apr 2013 10:27:01 +0300
Message-ID: <517F7245.2050606@iki.fi>
References: <1365043183-28905-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1365043183-28905-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, Tomasz Figa <tomasz.figa@gmail.com>, Rob Clark <robclark@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-rpi-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 04/04/2013 05:39 AM, Stephen Warren wrote:
> A simple frame-buffer describes a raw memory region that may be rendered
> to, with the assumption that the display hardware has already been set
> up to scan out from that buffer.
> 
> This is useful in cases where a bootloader exists and has set up the
> display hardware, but a Linux driver doesn't yet exist for the display
> hardware.

I had an idea related to this driver. There are two requirements that I
believe are (or will be) quite common:

On embedded devices quite often the bootloader initializes the display,
with the purpose of having a valid image on the screen for the whole
boot up process (company logo, or whatever).

With multi-arch kernels, we'll have display drivers for all platforms
and panels compiled with the kernel. If all these are built-in, they
will possibly increase the kernel size quite a bit, so it would be good
to have the display drivers as modules.

Now, if we have the display drivers as modules, the point when the
kernel/userspace can update the screen will be pretty late. Also,
there's no chance to get any early kernel boot messages on the screen.

So how about if we had this kind of simple fb, built-in to the kernel,
used only for the boot time until the proper driver is loaded. A "bootfb".

The bootloader would init the display hardware, the bootfb would give an
early /dev/fb0 for the kernel and userspace, and when the real display
driver is loaded, the bootfb would be unbound and the real driver would
take over.

 Tomi
