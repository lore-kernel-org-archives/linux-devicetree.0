From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH RFC 0/2] clk: add metag specific gate/mux clocks
Date: Wed, 15 May 2013 15:31:11 -0700
Message-ID: <51940CAF.6010808@codeaurora.org>
References: <1368198127-1295-1-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1368198127-1295-1-git-send-email-james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/10/13 08:02, James Hogan wrote:
> This adds a metag architecture specific clk-gate and clk-mux which
> extends the generic ones to use global lock2 to protect the register
> fields. It is common with metag to have an RTOS running on a different
> thread or core with access to different bits in the same register (which
> contain clock gate/switch bits for other clocks). Access to such
> registers must be serialised with a global lock such as the one provided
> by the metag architecture port in <asm/global_lock.h>
>
> RFC because despite extending the generic clocks there's still a bit of
> duplicated code necessary. One alternative is to add special cases to
> the generic clock components for when a global or callback function
> based lock is desired instead of a spinlock, but I wasn't sure if that
> sort of hack would really be appreciated in the generic drivers.
>
> Comments?

Can you please Cc the devicetree mailing list when proposing new bindings?

Your patchset brings up a question I've had which is if we should be
putting the bits and register width information in devicetree at all. On
the one hand it's nice to not have anything in C code, just iterate over
nodes and register clocks. On the other hand, it's the first time I've
seen anyone put the register interface into devicetree. From what I can
tell, the regulator bindings have put at most the register base and
physical properties like enable-time, max voltage, etc., but not what
bits are needed to enable/disable a regulator. Also I thought I read
somewhere that reg properties shouldn't overlap each other, so if you
ever have two clocks living in the same register we're going to violate
that.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
