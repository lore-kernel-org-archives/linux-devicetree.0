From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] gpio: Add Altera GPIO driver
Date: Mon, 12 Mar 2012 10:04:18 -0600
Message-ID: <20120312160418.816A83E07B0@localhost>
References: <1328551142-8439-1-git-send-email-tklauser@distanz.ch>
Reply-To: nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nios2-dev-bounces-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org>
In-Reply-To: <1328551142-8439-1-git-send-email-tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
List-Unsubscribe: <http://sopc.et.ntust.edu.tw/cgi-bin/mailman/options/nios2-dev>,
	<mailto:nios2-dev-request-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sopc.et.ntust.edu.tw/pipermail/nios2-dev>
List-Post: <mailto:nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org>
List-Help: <mailto:nios2-dev-request-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org?subject=help>
List-Subscribe: <http://sopc.et.ntust.edu.tw/cgi-bin/mailman/listinfo/nios2-dev>,
	<mailto:nios2-dev-request-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org?subject=subscribe>
Sender: nios2-dev-bounces-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
Errors-To: nios2-dev-bounces-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
To: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon,  6 Feb 2012 18:59:02 +0100, Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org> wrote:
> This driver supports the Altera PIO core.
> 
> Signed-off-by: Thomas Chou <thomas-SDxUXYEhEBiCuPEqFHbRBg@public.gmane.org>
> Signed-off-by: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
> ---
> This driver was submitted already about a year ago by Thomas, was
> adjusted by him according to some remarks made by Grant and was then
> included in the -mm tree [1] for some time but dropped again
> (couldn't find out when and why exactly).
> 
> [0] http://article.gmane.org/gmane.linux.drivers.devicetree/4231
> [1] http://article.gmane.org/gmane.linux.kernel.commits.mm/65119
> 
> So this is a new attempt towards getting this driver into mainline
> from the nios2 tree. The following changes have been made atop the
> version submitted by Thomas:
> 
> - Changed driver name to new naming convention
> - Usage of of_property_read_u32 in the probe function

This looks like a pretty generic memory-mapped gpio chip.  It should use the
gpio-generic infrastructure instead of open-coding all of the accessor hooks.

g.
