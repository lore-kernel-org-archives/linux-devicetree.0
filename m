From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: royalty device tree implementation?
Date: Thu, 26 Oct 2017 08:48:41 +0100
Message-ID: <20171026074840.w4byt4mz4le5ga3z@salmiak>
References: <84855b32-e5b8-1b36-ba9d-bdd10e140655@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <84855b32-e5b8-1b36-ba9d-bdd10e140655-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Walker <danielwa-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, xe-linux-external-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 25, 2017 at 12:39:37PM -0700, Daniel Walker wrote:
> 
> Hi,
> 
> I was looking for a royalty free (i.e. MIT or X11 license) device tree
> implementation? Something that could be used inside a boot loader for
> example to add small sections into the device tree prior to booting the
> kernel. I did some searches for something similar to this, but did not find
> anything.

IIRC, libfdt is dual licensed under GPL/BSD, and can be found in the dtc source
tree.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
