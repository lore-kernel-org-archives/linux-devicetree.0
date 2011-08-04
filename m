From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] dt: remove of_alias_get_id() reference
Date: Fri, 5 Aug 2011 01:13:02 +0800
Message-ID: <20110804170932.GA10897@freescale.com>
References: <20110804102950.10845.67898.stgit@ponder>
	<20110804103336.GE17540@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110804103336.GE17540-UiBtZHVXSwEVvW8u9ZQWYwjfymiNCTlR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 04, 2011 at 01:33:37PM +0300, Felipe Balbi wrote:
> On Thu, Aug 04, 2011 at 11:30:27AM +0100, Grant Likely wrote:
> > of_alias_get_id() is broken and being reverted.  Remove the reference
> > to it and replace with a single incrementing id number.
> > 
> > There is no risk of regression here on the imx driver since the imx
> > change to use of_alias_get_id() is commit 22698aa2, "serial/imx: add
> > device tree probe support" which is new for v3.1, and it won't get
> > used unless CONFIG_OF is enabled and the board is booted using a
> > device tree.  A single incrementing integer is sufficient for now.
> > 
> > Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > Acked-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> > 
> > I'm about to ask Linus to pull this patch through the devicetree/merge
> > branch along with the of_alias revert.
> > 
> >  drivers/tty/serial/imx.c |   13 ++++---------
> >  1 files changed, 4 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> > index 827db76..7e91b3d 100644
> > --- a/drivers/tty/serial/imx.c
> > +++ b/drivers/tty/serial/imx.c
> > @@ -1286,22 +1286,17 @@ static int serial_imx_resume(struct platform_device *dev)
> >  static int serial_imx_probe_dt(struct imx_port *sport,
> >  		struct platform_device *pdev)
> >  {
> > +	static int portnum = 0;
> 
> would it be better to use an IDR here ?
> 

This patch is a step back to avoid using of_alias_* api since it's
been reverted.  But we need to fix the api to make it right later.
That said the serial will still go after the of_alias_get_id.

What we want is a fixed device id for specified serial instance,
which is defined by device tree (in turn by hardware), instead of
a random id.  I'm not sure that I completely understand what IDR is
exactly for.  But from the documentation in lib/idr.c, I feel it's
not what we need here.  Or can you please elaborate why it fits here?

/*
 * You call it to allocate an id (an int) an associate with that id a
 * pointer or what ever, we treat it as a (void *).  You can pass this
 * id to a user for him to pass back at a later time.  You then pass
 * that id to this code and it returns your pointer.
 */

-- 
Regards,
Shawn
