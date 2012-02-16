From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v4 1/8] sandbox: fdt: Add support for
	CONFIG_OF_CONTROL
Date: Thu, 16 Feb 2012 11:16:32 -0800
Message-ID: <CAPnjgZ11gEk8+40MuTxN=4-Vnqn5N9147B9xhLtqCwWdqc1ttA@mail.gmail.com>
References: <1329349878-16664-1-git-send-email-sjg@chromium.org>
	<201202161150.04317.marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0499744708=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <201202161150.04317.marek.vasut@gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Marek Vasut <marek.vasut@gmail.com>
Cc: u-boot@lists.denx.de, Jerry Van Baren <vanbaren@cideas.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

--===============0499744708==
Content-Type: multipart/alternative; boundary=e89a8f64314884451e04b919aa64

--e89a8f64314884451e04b919aa64
Content-Type: text/plain; charset=ISO-8859-1

Hi Marek,

On Feb 16, 2012 2:50 AM, "Marek Vasut" <marek.vasut@gmail.com> wrote:
>
> > This adds support for a controlling fdt, mirroring the ARM
implementation.
>
> This is offtopic, but CONFIG OF CONTROL sounds interesting ;-)

Yes I hope it will be before end of year.

>
> btw. aren't you missing this part from ARM implementation?
>
> /* Allow the early environment to override the fdt address */
> gd->fdt_blob = (void *)getenv_ulong("fdtcontroladdr", 16, (uintptr_t)gd-
> >fdt_blob);

In principle yes. In practice we don't have a simple memory interface for
sandbox yet, so we can't implement this.

Well we did have one but it broke a few boards so was reverted. We should
come up with a way to do this...

Regards,
Simon

>
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> > Changes in v3:
> > - Use #if defined()..#elif defined, instead of #ifdef..#elif defined
> >
> >  arch/sandbox/include/asm/global_data.h |    1 +
> >  arch/sandbox/lib/board.c               |    8 ++++++++
> >  2 files changed, 9 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/sandbox/include/asm/global_data.h
> > b/arch/sandbox/include/asm/global_data.h index 8d47191..01a7063 100644
> > --- a/arch/sandbox/include/asm/global_data.h
> > +++ b/arch/sandbox/include/asm/global_data.h
> > @@ -45,6 +45,7 @@ typedef     struct global_data {
> >       unsigned long   fb_base;        /* base address of frame buffer */
> >       u8              *ram_buf;       /* emulated RAM buffer */
> >       phys_size_t     ram_size;       /* RAM size */
> > +     const void      *fdt_blob;      /* Our device tree, NULL if none
*/
> >       void            **jt;           /* jump table */
> >       char            env_buf[32];    /* buffer for getenv() before
reloc. */
> >  } gd_t;
> > diff --git a/arch/sandbox/lib/board.c b/arch/sandbox/lib/board.c
> > index b7997e9..6d464d6 100644
> > --- a/arch/sandbox/lib/board.c
> > +++ b/arch/sandbox/lib/board.c
> > @@ -156,6 +156,14 @@ void board_init_f(ulong bootflag)
> >
> >       memset((void *)gd, 0, sizeof(gd_t));
> >
> > +#if defined(CONFIG_OF_EMBED)
> > +     /* Get a pointer to the FDT */
> > +     gd->fdt_blob = _binary_dt_dtb_start;
> > +#elif defined(CONFIG_OF_SEPARATE)
> > +     /* FDT is at end of image */
> > +     gd->fdt_blob = (void *)(_end_ofs + _TEXT_BASE);
> > +#endif
> > +
> >       for (init_fnc_ptr = init_sequence; *init_fnc_ptr; ++init_fnc_ptr)
{
> >               if ((*init_fnc_ptr)() != 0)
> >                       hang();

--e89a8f64314884451e04b919aa64--

--===============0499744708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============0499744708==--
