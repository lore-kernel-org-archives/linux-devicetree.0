From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6] media: platform: Renesas IMR driver
Date: Mon, 26 Jun 2017 14:49:05 -0500
Message-ID: <20170626194905.zjvdzcdlnv74mnr5@rob-hp-laptop>
References: <20170623203456.503714406@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170623203456.503714406-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Konstantin Kozhevnikov <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 23, 2017 at 11:34:44PM +0300, Sergei Shtylyov wrote:
> From: Konstantin Kozhevnikov <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> 
> The image renderer, or the distortion correction engine, is a drawing
> processor with a simple instruction system capable of referencing video
> capture data or data in an external memory as the 2D texture data and
> performing texture mapping and drawing with respect to any shape that is
> split into triangular objects.
> 
> This V4L2 memory-to-memory device driver only supports image renderer light
> extended 4 (IMR-LX4) found in the R-Car gen3 SoCs; the R-Car gen2 support
> can be added later...
> 
> [Sergei: merged 2 original patches, added  the patch description, removed
> unrelated parts,  added the binding document and the UAPI documentation,
> ported the driver to the modern kernel, renamed the UAPI header file and
> the guard macros to match the driver name, extended the copyrights, fixed
> up Kconfig prompt/depends/help, made use of the BIT/GENMASK() macros,
> sorted  #include's, replaced 'imr_ctx::crop' array with the 'imr_ctx::rect'
> structure, replaced imr_{g|s}_crop() with imr_{g|s}_selection(), completely
> rewrote imr_queue_setup(), removed 'imr_format_info::name', moved the
> applicable code from imr_buf_queue() to imr_buf_prepare() and moved the
> rest of imr_buf_queue() after imr_buf_finish(), assigned 'src_vq->dev' and
> 'dst_vq->dev' in imr_queue_init(), removed imr_start_streaming(), assigned
> 'src_vq->dev' and 'dst_vq->dev' in imr_queue_init(), clarified the math in
> imt_tri_type_{a|b|c}_length(), clarified the pointer math and avoided casts
> to 'void *' in imr_tri_set_type_{a|b|c}(), replaced imr_{reqbufs|querybuf|
> dqbuf|expbuf|streamon|streamoff}() with the generic helpers, implemented
> vidioc_{create_bufs|prepare_buf}() methods, used ALIGN() macro and merged
> the matrix size checks and replaced kmalloc()/copy_from_user() calls with
> memdup_user() call in imr_ioctl_map(), moved setting device capabilities
> from imr_querycap() to imr_probe(), set the valid default queue format in
> imr_probe(), removed leading dots and fixed grammar in the comments, fixed
> up  the indentation  to use  tabs where possible, renamed DLSR, CMRCR.
> DY1{0|2}, and ICR bits to match the manual, changed the prefixes of the
> CMRCR[2]/TRI{M|C}R bits/fields to match the manual, removed non-existent
> TRIMR.D{Y|U}D{X|V}M bits, added/used the IMR/{UV|CP}DPOR/SUSR bits/fields/
> shifts, separated the register offset/bit #define's, sorted instruction
> macros by opcode, removed unsupported LINE instruction, masked the register
> address in WTL[2]/WTS instruction macros, moved the display list #define's
> after the register #define's, removing the redundant comment, avoided
> setting reserved bits when writing CMRCCR[2]/TRIMCR, used the SR bits
> instead of a bare number, removed *inline* from .c file, fixed lines over
> 80 columns, removed useless spaces, comments, parens, operators, casts,
> braces, variables, #include's, statements, and even 1 function, added
> useful local variable, uppercased and spelled out the abbreviations,
> made comment wording more consistent/correct, fixed the comment typos,
> reformatted some multiline comments, inserted empty line after declaration,
> removed extra empty lines,  reordered some local variable desclarations,
> removed calls to 4l2_err() on kmalloc() failure, replaced '*' with 'x'
> in some format strings for v4l2_dbg(), fixed the error returned by
> imr_default(), avoided code duplication in the IRQ handler, used '__packed'
> for the UAPI structures, declared 'imr_map_desc::data' as '__u64' instead
> of 'void *', switched to '__u{16|32}' in the UAPI header, enclosed the
> macro parameters in parens, exchanged the values of IMR_MAP_AUTO{S|D}G
> macros.]

TL;DR needed here IMO. Not sure anyone really cares every detail you 
changed in re-writing this. If they did, it should all be separate 
commits.

> Signed-off-by: Konstantin Kozhevnikov <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

I acked v5 and it doesn't seem the binding changed.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
