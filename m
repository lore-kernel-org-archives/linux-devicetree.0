From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [v5 08/12] soc/fsl/qbman: Rework portal mapping calls for ARM/PPC
Date: Thu, 21 Sep 2017 15:32:42 +0100
Message-ID: <20170921143242.f3bdqpa4gq6r7dj3@localhost>
References: <1505767187-4596-1-git-send-email-roy.pledge@nxp.com>
 <1505767187-4596-9-git-send-email-roy.pledge@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1505767187-4596-9-git-send-email-roy.pledge-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
Cc: leoyang.li-3arQi8VN3Tc@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, madalin.bucur-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 18, 2017 at 04:39:43PM -0400, Roy Pledge wrote:
> Rework portal mapping for PPC and ARM. The PPC devices require a
> cacheable coherent mapping while ARM will work with a non-cachable/write
> combine mapping. This also eliminates the need for manual cache
> flushes on ARM. This also fixes the code so sparse checking is clean.
> 
> Signed-off-by: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>

Reviewed-by: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
