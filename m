From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/11] ARM: dts: NSP: define SATA, Reboot, RAM and new
 device tree files
Date: Mon, 8 Aug 2016 18:42:11 -0700
Message-ID: <fc5d767b-4ce1-c0d2-b2f5-cf2b5d2eb3c8@gmail.com>
References: <1470249546-12440-1-git-send-email-jon.mason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470249546-12440-1-git-send-email-jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/03/2016 11:38 AM, Jon Mason wrote:
> This patch series adds SATA and RAM for the existing HR and XMC device
> tree files (as they were missed when those peices were originally
> added).  It also adds GPIO rebooting to the platforms that support that
> feature.  Finally, add device tree files for all known NSP based
> reference boards.
> 
> The only outstanding HW that isn't fully supported on all NSP boards is
> USB and sound.  So, we're getting close :)
> 
> NOTE: SATA is not in the NSP DTSI in Florian's git tree, but it is
> currently in Linus' (due to it going through another maintainer).  So,
> it won't build until the merge with Linus' tree is done.  I thought it
> better to do it this way instead of splitting it off and sending it as
> a follow-on in a couple of weeks.  Let me know if it is preferred I do
> it that way.

Series applied, thanks Jon!
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
