From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [v5 05/12] soc/fsl/qbman: Drop set/clear_bits usage
Date: Thu, 21 Sep 2017 15:31:26 +0100
Message-ID: <20170921143125.yfqswiovu36bal6l@localhost>
References: <1505767187-4596-1-git-send-email-roy.pledge@nxp.com>
 <1505767187-4596-6-git-send-email-roy.pledge@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1505767187-4596-6-git-send-email-roy.pledge-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
Cc: leoyang.li-3arQi8VN3Tc@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, madalin.bucur-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, Claudiu Manoil <claudiu.manoil-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 18, 2017 at 04:39:40PM -0400, Roy Pledge wrote:
> From: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
> 
> Replace PPC specific set/clear_bits API with standard
> bit twiddling so driver is portalable outside PPC.
> 
> Signed-off-by: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Claudiu Manoil <claudiu.manoil-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>

Reviewed-by: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
