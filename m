From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v8 0/4] perf: Add APM X-Gene SoC Performance Monitoring
 Unit driver
Date: Thu, 14 Jul 2016 14:16:03 +0100
Message-ID: <20160714131602.GJ29455@arm.com>
References: <1468263944-10634-1-git-send-email-ttnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1468263944-10634-1-git-send-email-ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 11, 2016 at 12:05:40PM -0700, Tai Nguyen wrote:
> In addition to the X-Gene ARM CPU performance monitoring unit (PMU), there
> are PMU for the SoC system devices such as L3 cache(s), I/O bridge(s),
> memory controller bridges and memory. These PMU devices are loosely
> architected to follow the same model as the PMU for ARM cores.

You might want to add commit messages to patches 1,2 and 4, but then you
can route this via the arm-soc tree.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
