From: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH v15 2/6] add sysfs document for fpga bridge class
Date: Thu, 21 Jan 2016 10:32:55 -0600
Message-ID: <alpine.DEB.2.02.1601211031170.8804@linuxheads99>
References: <1453317867-10422-1-git-send-email-atull@opensource.altera.com> <1453317867-10422-3-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453317867-10422-3-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 20 Jan 2016, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:

> From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> Add documentation for new FPGA bridge class's sysfs interface.
> 
> Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

I've received two emails that there was no patch in this email.  The
copy I received has 11 lines of changes, adding one file
Documentation/ABI/testing/sysfs-class-fpga-bridge

Alan

> --
> v15: Document added in v15 of patch set
> ---
>  Documentation/ABI/testing/sysfs-class-fpga-bridge |   11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-bridge
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-fpga-bridge b/Documentation/ABI/testing/sysfs-class-fpga-bridge
> new file mode 100644
> index 0000000..312ae2c
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-fpga-bridge
> @@ -0,0 +1,11 @@
> +What:		/sys/class/fpga_bridge/<bridge>/name
> +Date:		January 2016
> +KernelVersion:	4.5
> +Contact:	Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> +Description:	Name of low level FPGA bridge driver.
> +
> +What:		/sys/class/fpga_bridge/<bridge>/state
> +Date:		January 2016
> +KernelVersion:	4.5
> +Contact:	Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> +Description:	Show bridge state as "enabled" or "disabled"
> -- 
> 1.7.9.5
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
