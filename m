From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: Device Tree on ARM status report - Mar 20
Date: Tue, 29 Mar 2011 17:08:50 +0800
Message-ID: <20110329090849.GE18775@S2100-06.ap.freescale.net>
References: <AANLkTikZkfhA2Wu7_P_z5UX0Z5QeHa-W8TNksR1n4GV2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikZkfhA2Wu7_P_z5UX0Z5QeHa-W8TNksR1n4GV2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, =?iso-8859-1?Q?Lo=EFc?= Minier <loic.minier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 21, 2011 at 03:25:16AM -0600, Grant Likely wrote:
> 
[...]
> - Add packaging of .dtb files into linux-image-linaro-* packages.
> Loic and I discussed putting them under /lib/dtb/`uname -r`/, but
> thinking about it more, it might make more sense to share the modules
> directory and use /lib/modules/`uname -r`/dtbs.  The dtc tool needed
> to build the .dtbs is included with the kernel tree.
> - Add relevant dtb files to boot partition in linaro-image tools
> - Add boot script which passes dtb as 3rd argument to 'bootm'
> 
I just had a talk with Loic.  Considering the experience of playing
l-m-c and the kind help that people jcrigby, slangasek, lool will give
me, I would like to give a shot on this tasks.

-- 
Regards,
Shawn
