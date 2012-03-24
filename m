From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] s5p-tv: Add initial DT-support for HDMIPHY
Date: Sat, 24 Mar 2012 19:03:53 +0000
Message-ID: <20120324190353.8CBE03E0AD3@localhost>
References: <1331912532-7798-1-git-send-email-k.lewandowsk@samsung.com>
 <1331912532-7798-3-git-send-email-k.lewandowsk@samsung.com>
 <20120318182458.9CCC43E07BF@localhost> <4F6C5E74.60104@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F6C5E74.60104-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 23 Mar 2012 12:28:52 +0100, Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> On 18.03.2012 19:24, Grant Likely wrote:
> 
> > On Fri, 16 Mar 2012 16:42:12 +0100, Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> >> Make it possible to instantiate driver from device tree description.
> >>
> >> Signed-off-by: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >> Reviewed-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> ---
> >>  drivers/media/video/s5p-tv/hdmiphy_drv.c |   10 ++++++++++
> >>  1 files changed, 10 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/drivers/media/video/s5p-tv/hdmiphy_drv.c b/drivers/media/video/s5p-tv/hdmiphy_drv.c
> >> index 6693f4a..ddf3008 100644
> >> --- a/drivers/media/video/s5p-tv/hdmiphy_drv.c
> >> +++ b/drivers/media/video/s5p-tv/hdmiphy_drv.c
> >> @@ -18,6 +18,7 @@
> >>  #include <linux/interrupt.h>
> >>  #include <linux/irq.h>
> >>  #include <linux/err.h>
> >> +#include <linux/of.h>
> >>  
> >>  #include <media/v4l2-subdev.h>
> >>  
> >> @@ -165,10 +166,19 @@ static const struct i2c_device_id hdmiphy_id[] = {
> >>  };
> >>  MODULE_DEVICE_TABLE(i2c, hdmiphy_id);
> >>  
> >> +#ifdef CONFIG_OF
> >> +static struct of_device_id hdmiphy_dt_match[] = {
> >> +	{ .compatible = "samsung,s5pv210-hdmiphy" },
> > 
> > Ditto here; needs to be listed in documentation.
> 
> 
> As these drivers require only irq and io address may add these to
> something like [bindings/arm/samsung/]trivial-devices.txt (like it's
> done for i2c)?

yes.  I just want the values in the documentation where they can be
searched for.

g.
