From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/5] power: sbs-battery: rename internals to new name
Date: Mon, 05 Dec 2011 17:20:10 -0800
Message-ID: <1323134410.24760.1.camel@rklein-linux2>
References: <1323129487-24859-1-git-send-email-rklein@nvidia.com>
 <1323129487-24859-2-git-send-email-rklein@nvidia.com>
 <20111206012012.GA3065@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111206012012.GA3065-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2011-12-05 at 17:20 -0800, Anton Vorontsov wrote:
> On Mon, Dec 05, 2011 at 03:58:04PM -0800, Rhyland Klein wrote:
> [...]
> > -static const struct i2c_device_id bq20z75_id[] = {
> > -	{ "bq20z75", 0 },
> > +static const struct i2c_device_id sbs_id[] = {
> > +	{ "sbs-battery", 0 },
> 
> You have to leave "bq20z75" here as is, and add "sbs-battery" as an
> additional device id.
> 
> The reason is that older device trees might already have compatible
> = "bq20z75", without specifying "sbs-battery".
> 
> Thanks!
> 

Good thought! I had thought about that at some point but apparently not
when actually working on the patch. Will do in v2.

-rhyland
