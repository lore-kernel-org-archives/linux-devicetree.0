From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RESEND PATCH] arm64: dts: add <dt-bindings/> symlink
Date: Tue, 2 Sep 2014 09:42:14 +0100
Message-ID: <20140902084214.GE25379@arm.com>
References: <1409629756-14304-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409629756-14304-1-git-send-email-pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "naushad-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <naushad-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 02, 2014 at 04:49:16AM +0100, Pankaj Dubey wrote:
> Add symlink to include/dt-bindings from arch/arm64/boot/dts/include/ to
> match the ones in ARM architectures so that preprocessed device
> tree files can include various useful constant definitions.
> 
> See commit c58299aa8754 ("kbuild: create an "include chroot" for DT bindings")
> merged in v3.10-rc1 for details.
> 
> CC: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> 
> Resubmitting this change as now it will be required for Samsung ARM64
> based SoC.

Just include this change in the series adding a .dts that needs it -- it
doesn't really make sense in isolation (unless somebody desperately wants
this in?).

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
