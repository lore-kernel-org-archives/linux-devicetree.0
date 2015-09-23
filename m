From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v11 2/4] fpga manager: add sysfs interface document
Date: Tue, 22 Sep 2015 17:52:34 -0700
Message-ID: <CAAtXAHdLuG-fGkEys=1icSPWkrJxMSogtz7UOxg4UPAjnEtaJg@mail.gmail.com>
References: <1442935271-10375-1-git-send-email-atull@opensource.altera.com>
	<1442935271-10375-3-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442935271-10375-3-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Philip Balister <philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org>, rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, kyle.teske-acOepvfBmUk@public.gmane.org, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, pawel.moll-AbSShOkvfpQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 22, 2015 at 8:21 AM,  <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
> From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>
> Add documentation under drivers/staging for new fpga manager's
> sysfs interface.
>
Reviewed-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
> v5  : (actually second version, but keeping version numbers
>       aligned with rest of patch series)
>       Move document to drivers/staging/fpga/Documentation/ABI
>
> v6  : No change in this patch for v6 of the patch set
> v7  : No change in this patch for v7 of the patch set
> v8  : No change in this patch for v8 of the patch set
>
> v9  : Remove 'firmware' and 'reset' files
>       Update state strings
>
> v10 : Clarifications about state attribute
>       Move to Documentation/ABI/testing/
>
> v11 : No change in this patch for v11 of the patch set
> ---
>  Documentation/ABI/testing/sysfs-class-fpga-manager |   37 ++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-manager
>
> diff --git a/Documentation/ABI/testing/sysfs-class-fpga-manager b/Documentation/ABI/testing/sysfs-class-fpga-manager
> new file mode 100644
> index 0000000..23056c5
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-fpga-manager
> @@ -0,0 +1,37 @@
> +What:          /sys/class/fpga_manager/<fpga>/name
> +Date:          August 2015
> +KernelVersion: 4.3
> +Contact:       Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> +Description:   Name of low level fpga manager driver.
> +
> +What:          /sys/class/fpga_manager/<fpga>/state
> +Date:          August 2015
> +KernelVersion: 4.3
> +Contact:       Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> +Description:   Read fpga manager state as a string.
> +               The intent is to provide enough detail that if something goes
> +               wrong during FPGA programming (something that the driver can't
> +               fix) then userspace can know, i.e. if the firmware request
> +               fails, that could be due to not being able to find the firmware
> +               file.
> +
> +               This is a superset of FPGA states and fpga manager driver
> +               states.  The fpga manager driver is walking through these steps
> +               to get the FPGA into a known operating state.  It's a sequence,
> +               though some steps may get skipped.  Valid FPGA states will vary
> +               by manufacturer; this is a superset.
> +
> +               * unknown               = can't determine state
> +               * power off             = FPGA power is off
> +               * power up              = FPGA reports power is up
> +               * reset                 = FPGA held in reset state
> +               * firmware request      = firmware class request in progress
> +               * firmware request error = firmware request failed
> +               * write init            = preparing FPGA for programming
> +               * write init error      = Error while preparing FPGA for
> +                                         programming
> +               * write                 = FPGA ready to receive image data
> +               * write error           = Error while programming
> +               * write complete        = Doing post programming steps
> +               * write complete error  = Error while doing post programming
> +               * operating             = FPGA is programmed and operating
> --
> 1.7.9.5
>

Cheers,

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
