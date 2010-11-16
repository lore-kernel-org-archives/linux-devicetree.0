From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 4/4] of/fdt: add kernel command line option for
	dtb_compat string
Date: Mon, 15 Nov 2010 23:34:40 -0700
Message-ID: <20101116063440.GC4074@angua.secretlab.ca>
References: <cover.1289520079.git.dirk.brandewie@gmail.com>
	<855a5a11d04a7c1883675b6a77992c4af85222fd.1289520079.git.dirk.brandewie@gmail.com>
	<20101114062246.GD2355@angua.secretlab.ca>
	<4CE1CFDA.7030900@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4CE1CFDA.7030900-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 15, 2010 at 04:27:06PM -0800, H. Peter Anvin wrote:
> On 11/13/2010 10:22 PM, Grant Likely wrote:
> > 
> > 'char' is completely bogus in this context.  Either void or struct
> > boot_param_header would be more accurate and useful.  I believe you
> > can do:
> > 
> > 	extern void __dtb_start;
> > 	extern_void __dtb_end;
> > 
> > And then reference the addresses with &__dtb_start and &__dtb_end.
> > That would eliminate a lot of the casting below.
> > 
> 
> Except that doesn't work with gcc 4.5+; you really need to use an array
> type.

heh.  Oh well, an array it must be then.

g.
