From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH] of: Add of_device_destroy_children() function
Date: Thu, 8 May 2014 14:33:39 -0600
Message-ID: <20140508203339.GA542@obsidianresearch.com>
References: <1399567069-3174-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1399567069-3174-1-git-send-email-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 08, 2014 at 06:37:49PM +0200, Sylwester Nawrocki wrote:
> This patch adds a helper function to unregister devices which
> were created by an of_platform_populate() call. The pattern
> used here can already be found in multiple drivers. This helper
> can now be used instead of repeating similar code in drivers.

I have a driver that does this as well, and what I found is that the
remove must be in reverse order from the create or things explode, and
that assumes the DT is topologically sorted according to dependency
(so no deferred probe).

AFAIK, there is no analog to deferred probe for removal, and
attempting to remove, say, a GPIO driver while an I2C bit bang is using
it just fails.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
