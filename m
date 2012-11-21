From: "Philip, Avinash" <avinashphilip-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH v2 0/3] mtd: nand: OMAP: ELM error correction support
 for BCH ecc
Date: Wed, 21 Nov 2012 07:01:25 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3E9EC70D@DBDE01.ent.ti.com>
References: <1351667307-447-1-git-send-email-avinashphilip@ti.com>
 <1352978534.2221.33.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: "artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "Mohammed, Afzal" <afzal-l0cyMroinI0@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "Nori, Sekhar" <nsekhar-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Hebbar,
 Gururaja" <gururaja.hebbar-l0cyMroinI0@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "ivan.djelic-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org" <ivan.djelic-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 19, 2012 at 18:13:56, Philip, Avinash wrote:
> 
> On Thu, Nov 15, 2012 at 16:52:14, Artem Bityutskiy wrote:
> > On Wed, 2012-10-31 at 12:38 +0530, Philip, Avinash wrote:
> > > Support to use ELM as BCH 4 & 8 bit error correction module. Also performance
> > > enhancement by adding single shot read_page and write_page functions for the
> > > nand flashes with page size less than 4 KB.
> > > 
> > > ELM module can be used to correct errors reported by BCH 4, 8 & 16 bit
> > > ECC scheme. For now only 4 & 8 bit support is added.
> > > 
> > > BCH 4 & 8 bit error detection support is already available in mainline
> > > kernel and works with software error correction.
> > > 
> > > This series is based on [1] and tested with RFC: OMAP GPMC bindings
> > > patch series
> > > 
> > > 1. linux-next/20121030
> > 
> > Would you please re-send a version which cleanly applies to the
> > l2-mtd.git tree? This series has many conflicts. Thanks!
> 
> Artem,
> 
> Omap nand driver is being changed considerably with Afzal's omap-gpmc cleanup
> series for common arm zImage [2] and those changes move many
> of the nand related code from platform folders to omap nand driver.
> 
> Omap-gpmc changes are present in Tony's " omap-for-v3.8/cleanup-headers-gpmc"
> branch [3]and is present in linux-next also, but is not present in l2-mtd.
> Tony has signed tag including omap-gpmc cleanup series,
> "omap-for-v3.8/cleanup-headers-prepare-multiplatform-v3-signed" [4]
> 
> If this series is made over l2-mtd, and it would cause lot of conflict
> with omap-gpmc cleanup series.
> 
> I am not sure how this dependency has to be handled for this series,
> let me know whether you still want it to be made over l2-mtd?

Artem,

Is it possible for you to give ack for these patches so that these patches
can go in Tony's tree where Omap-gpmc changes are present?

Thanks
Avinash
> 
> 2. http://markmail.org/message/ev67wm7irgc2qc5d#query:+page:1+mid:wgjdv6fsfghnua5z+state:results
> 3. http://git.kernel.org/?p=linux/kernel/git/tmlind/linux-omap.git;a=shortlog;h=refs/heads/omap-for-v3.8/cleanup-headers-gpmc
> 4. http://git.kernel.org/?p=linux/kernel/git/tmlind/linux-omap.git;a=tag;h=refs/tags/omap-for-v3.8/cleanup-headers-prepare-multiplatform-v3-signed
> 
> 
> Thanks
> Avinash
> 
> > 
> > git://git.infradead.org/users/dedekind/l2-mtd.git
> > 
> > -- 
> > Best Regards,
> > Artem Bityutskiy
> > 
> 
> 
